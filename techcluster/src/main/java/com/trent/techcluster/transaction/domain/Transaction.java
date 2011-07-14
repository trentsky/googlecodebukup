package com.trent.techcluster.transaction.domain;

import java.math.BigDecimal;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;

import org.springframework.format.annotation.DateTimeFormat;

import com.trent.techcluster.base.domain.base.BaseEO;

public class Transaction extends BaseEO{
	
	private static final long serialVersionUID = 1L;

	public Object getPrimaryKey() {
		return null;
	}
	
	@Column(name = "ID")
	private String id;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@Column(name = "TYPE", columnDefinition = "NUMBER")
	@NotNull
	private BigDecimal type;

	@Column(name = "USERNO", columnDefinition = "VARCHAR2", length = 32)
	@NotNull
	private String userno;

	@Column(name = "ACCEPTNO", columnDefinition = "VARCHAR2", length = 32)
	@NotNull
	private String acceptno;

	@Column(name = "FLOWNO", columnDefinition = "VARCHAR2", length = 64)
	@NotNull
	private String flowno;

	@Column(name = "PLATTIME", columnDefinition = "TIMESTAMP(6)")
	@NotNull
	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(style = "S-")
	private Date plattime;

	@Column(name = "AMT", columnDefinition = "NUMBER")
	@NotNull
	private BigDecimal amt;

	@Column(name = "FEE", columnDefinition = "NUMBER")
	@NotNull
	private BigDecimal fee;

	@Column(name = "BANKID", columnDefinition = "VARCHAR2", length = 32)
	private String bankid;

	@Column(name = "BANKACCOUNT", columnDefinition = "VARCHAR2", length = 128)
	@NotNull
	private String bankaccount;

	@Column(name = "BANKORDERID", columnDefinition = "VARCHAR2", length = 128)
	@NotNull
	private String bankorderid;

	@Column(name = "BANKORDERTIME", columnDefinition = "TIMESTAMP(6)")
	@NotNull
	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(style = "S-")
	private Date bankordertime;

	@Column(name = "BANKTRACE", columnDefinition = "VARCHAR2", length = 128)
	@NotNull
	private String banktrace;

	@Column(name = "BANKRETTIME", columnDefinition = "TIMESTAMP(6)")
	@NotNull
	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(style = "S-")
	private Date bankrettime;

	@Column(name = "STATE", columnDefinition = "NUMBER")
	@NotNull
	private BigDecimal state;

	@Column(name = "RETCODE", columnDefinition = "VARCHAR2", length = 32)
	@NotNull
	private String retcode;

	@Column(name = "RETMEMO", columnDefinition = "VARCHAR2", length = 256)
	@NotNull
	private String retmemo;

	@Column(name = "MEMO", columnDefinition = "VARCHAR2", length = 512)
	private String memo;

	@Column(name = "BANKCHECK", columnDefinition = "NUMBER")
	@NotNull
	private BigDecimal bankcheck;

	@Column(name = "PAYTYPE", columnDefinition = "VARCHAR2", length = 16)
	@NotNull
	private String paytype;

	@Column(name = "ACCESSTYPE", columnDefinition = "CHAR")
	@NotNull
	private Character accesstype;
	
	@Column(name = "CHANNEL")
	private String channel;

	@Column(name = "SUBCHANNEL")
	private String subchannel;

	public BigDecimal getType() {
		return type;
	}

	public void setType(BigDecimal type) {
		this.type = type;
	}

	public String getUserno() {
		return userno;
	}

	public void setUserno(String userno) {
		this.userno = userno;
	}

	public String getAcceptno() {
		return acceptno;
	}

	public void setAcceptno(String acceptno) {
		this.acceptno = acceptno;
	}

	public String getFlowno() {
		return flowno;
	}

	public void setFlowno(String flowno) {
		this.flowno = flowno;
	}

	public Date getPlattime() {
		return plattime;
	}

	public void setPlattime(Date plattime) {
		this.plattime = plattime;
	}

	public BigDecimal getAmt() {
		return amt;
	}

	public void setAmt(BigDecimal amt) {
		this.amt = amt;
	}

	public BigDecimal getFee() {
		return fee;
	}

	public void setFee(BigDecimal fee) {
		this.fee = fee;
	}

	public String getBankid() {
		return bankid;
	}

	public void setBankid(String bankid) {
		this.bankid = bankid;
	}

	public String getBankaccount() {
		return bankaccount;
	}

	public void setBankaccount(String bankaccount) {
		this.bankaccount = bankaccount;
	}

	public String getBankorderid() {
		return bankorderid;
	}

	public void setBankorderid(String bankorderid) {
		this.bankorderid = bankorderid;
	}

	public Date getBankordertime() {
		return bankordertime;
	}

	public void setBankordertime(Date bankordertime) {
		this.bankordertime = bankordertime;
	}

	public String getBanktrace() {
		return banktrace;
	}

	public void setBanktrace(String banktrace) {
		this.banktrace = banktrace;
	}

	public Date getBankrettime() {
		return bankrettime;
	}

	public void setBankrettime(Date bankrettime) {
		this.bankrettime = bankrettime;
	}

	public BigDecimal getState() {
		return state;
	}

	public void setState(BigDecimal state) {
		this.state = state;
	}

	public String getRetcode() {
		return retcode;
	}

	public void setRetcode(String retcode) {
		this.retcode = retcode;
	}

	public String getRetmemo() {
		return retmemo;
	}

	public void setRetmemo(String retmemo) {
		this.retmemo = retmemo;
	}

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	public BigDecimal getBankcheck() {
		return bankcheck;
	}

	public void setBankcheck(BigDecimal bankcheck) {
		this.bankcheck = bankcheck;
	}

	public String getPaytype() {
		return paytype;
	}

	public void setPaytype(String paytype) {
		this.paytype = paytype;
	}

	public Character getAccesstype() {
		return accesstype;
	}

	public void setAccesstype(Character accesstype) {
		this.accesstype = accesstype;
	}

	public String getChannel() {
		return channel;
	}

	public void setChannel(String channel) {
		this.channel = channel;
	}

	public String getSubchannel() {
		return subchannel;
	}

	public void setSubchannel(String subchannel) {
		this.subchannel = subchannel;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

}
