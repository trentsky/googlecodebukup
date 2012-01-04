package com.trent.consumeTest;

public class MeasureState implements Comparable<MeasureState> {
	private String label;
	private long startTime;
	private long endTime;
	private long index;
	private int measurement;
	private int threadCount;

	public MeasureState(String label, long index, int measurement,
			int threadCount) {
		this.label = label;
		this.measurement = measurement;
		this.index = index;
		this.threadCount = threadCount;
	}

	public long getIndex() {
		return this.index;
	}

	public String getLabel() {
		return this.label;
	}

	public long getStartTime() {
		return this.startTime;
	}

	public long getEndTime() {
		return this.endTime;
	}

	public long getMeasurements() {
		return this.measurement;
	}

	public long getMeasureTime() {
		return this.endTime - this.startTime;
	}

	public int getThreadCount() {
		return this.threadCount;
	}

	public void startNow() {
		this.startTime = System.nanoTime();
	}

	public void endNow() {
		this.endTime = System.nanoTime();
	}

	public int compareTo(MeasureState another) {
		if (this.startTime > another.startTime)
			return -1;
		if (this.startTime < another.startTime) {
			return 1;
		}

		return 0;
	}
}
