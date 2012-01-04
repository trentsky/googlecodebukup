package com.trent.consumeTest.lisener;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicLong;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.trent.consumeTest.MeasureState;

public class SimpleMeasure implements MeasureListener {
	private static final Log log = LogFactory.getLog(SimpleMeasure.class);
	private static final DecimalFormat integerFormat = new DecimalFormat(
			"#,##0.00");

	private List<MeasureState> timesList = new ArrayList<MeasureState>();
	private AtomicInteger count = new AtomicInteger();
	private AtomicLong startTime = new AtomicLong();

	public void onMeasure(MeasureState state) {
		this.count.getAndIncrement();
		this.startTime.compareAndSet(0L, System.nanoTime());
		outputMeasureInfo(state);
	}

	private void outputMeasureInfo(MeasureState state) {
		synchronized (this.timesList) {
			if ((log.isDebugEnabled()) && (this.timesList.size() % 50 == 0)) {
				log.debug("");
			}

			if (log.isDebugEnabled()) {
				log.debug(state.getIndex() + ".");
			}
		}
		if (isEnd(state)) {
			long total = System.nanoTime() - this.startTime.get();
			//TPS(Transaction Per Second)每秒事务处理量
			this.count.set(0);
			this.startTime.set(0L);
			StringBuffer sb = new StringBuffer("\n");
			sb.append(state.getLabel() + "\t").append("avg: ").append(
					format(total / state.getMeasurements() / 1000000.0D))
					.append(" ms\t").append("total: ").append(
							format(total / 1000000.0D)).append(" ms\t").append(
							"tps: ").append(
							format(state.getMeasurements()
									/ (total / 1000000000.0D))).append("\t")
					.append("running: ").append(state.getMeasurements())
					.append(" times\t").append("in ").append(
							state.getThreadCount()).append(" Threads");

			if (!state.getLabel().equals("_warmup_")) {
				log.info(sb.toString());
				return;
			}
			if (log.isDebugEnabled())
				log.debug(sb.toString());
		}
	}

	private String format(double value) {
		return integerFormat.format(value);
	}

	private boolean isEnd(MeasureState state) {
		return this.count.get() == state.getMeasurements();
	}
}
