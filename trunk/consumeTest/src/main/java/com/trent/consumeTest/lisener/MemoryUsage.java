package com.trent.consumeTest.lisener;

import java.text.DecimalFormat;
import java.util.concurrent.atomic.AtomicInteger;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.trent.consumeTest.MeasureState;
import com.trent.consumeTest.util.MemoryUtil;

public class MemoryUsage implements MeasureListener {
	private static final Log log = LogFactory.getLog(MemoryUsage.class);
	private static final DecimalFormat integerFormat = new DecimalFormat(
			"#,##0.000");

	private AtomicInteger count = new AtomicInteger();

	public void onMeasure(MeasureState state) {
		this.count.getAndIncrement();
		outputMeasureInfo(state);
	}

	private void outputMeasureInfo(MeasureState state) {
		if (isEnd(state)) {
			StringBuffer sb = new StringBuffer("\n");
			sb.append("memory-usage: ").append(state.getLabel()).append("\t")
					.append(format(MemoryUtil.memoryUsed() / 1000.0D)).append(
							" Kb\n");
			this.count.set(0);

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
