package com.trent.consumeTest.util;

import java.lang.management.ManagementFactory;

public class MemoryUtil {
	public static void restoreJvm() {
		int maxRestoreJvmLoops = 10;
		long memUsedPrev = memoryUsed();
		for (int i = 0; i < maxRestoreJvmLoops; i++) {
			System.runFinalization();
			System.gc();

			long memUsedNow = memoryUsed();

			if ((ManagementFactory.getMemoryMXBean()
					.getObjectPendingFinalizationCount() == 0)
					&& (memUsedNow >= memUsedPrev)) {
				break;
			}
			memUsedPrev = memUsedNow;
		}
	}

	public static long memoryUsed() {
		Runtime rt = Runtime.getRuntime();
		return rt.totalMemory() - rt.freeMemory();
	}
}