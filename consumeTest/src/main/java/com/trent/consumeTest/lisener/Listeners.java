package com.trent.consumeTest.lisener;

public final class Listeners {
	public static MeasureListener[] simple() {
		return new MeasureListener[] { new SimpleMeasure(), new MemoryUsage() };
	}

	public static SimpleMeasure simpleMeasure() {
		return new SimpleMeasure();
	}

	public static MemoryUsage memoryUsage() {
		return new MemoryUsage();
	}
}
