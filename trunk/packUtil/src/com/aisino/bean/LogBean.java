package com.aisino.bean;

import java.util.Date;

public class LogBean {
	private String dataEcChangeId;
	private String appId;
	private String interFaceCode;
	private String interFaceId;
	private String requestCode;
	private Date requestTime;
	private String returnCode;
	private String responseCode;
	private String returnMessage;

	public String getDataEcChangeId() {
		return dataEcChangeId;
	}

	public void setDataEcChangeId(String dataEcChangeId) {
		this.dataEcChangeId = dataEcChangeId;
	}

	public String getAppId() {
		return appId;
	}

	public void setAppId(String appId) {
		this.appId = appId;
	}

	public String getInterFaceCode() {
		return interFaceCode;
	}

	public void setInterFaceCode(String interFaceCode) {
		this.interFaceCode = interFaceCode;
	}

	public String getInterFaceId() {
		return interFaceId;
	}

	public void setInterFaceId(String interFaceId) {
		this.interFaceId = interFaceId;
	}

	public String getRequestCode() {
		return requestCode;
	}

	public void setRequestCode(String requestCode) {
		this.requestCode = requestCode;
	}

	public Date getRequestTime() {
		return requestTime;
	}

	public void setRequestTime(Date requestTime) {
		this.requestTime = requestTime;
	}

	public String getReturnCode() {
		return returnCode;
	}

	public void setReturnCode(String returnCode) {
		this.returnCode = returnCode;
	}

	public String getResponseCode() {
		return responseCode;
	}

	public void setResponseCode(String responseCode) {
		this.responseCode = responseCode;
	}

	public String getReturnMessage() {
		return returnMessage;
	}

	public void setReturnMessage(String returnMessage) {
		this.returnMessage = returnMessage;
	}
}
