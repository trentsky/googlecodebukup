package com.trent.consumeTest.lisener;

import com.trent.consumeTest.MeasureState;

public abstract interface MeasureListener {
	public abstract void onMeasure(MeasureState paramMeasureState);
}