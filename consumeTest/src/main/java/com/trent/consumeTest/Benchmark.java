package com.trent.consumeTest;

public abstract interface Benchmark {
	public abstract void measure(Runnable paramRunnable);

	public abstract void measure(String paramString, Runnable paramRunnable);
}
