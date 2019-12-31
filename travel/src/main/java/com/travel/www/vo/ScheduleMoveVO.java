package com.travel.www.vo;

import java.sql.Date;
import java.text.SimpleDateFormat;

public class ScheduleMoveVO {

	private int mno;
	private String mtype;
	private String mname;
	private String msloc;
	private String meloc;
	private Date msdate;
	private Date medate;
	private String smsdate;
	private String smedate;
	private int mcost;
	private String type;
	
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	public String getMtype() {
		return mtype;
	}
	public void setMtype(String mtype) {
		this.mtype = mtype;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public String getMsloc() {
		return msloc;
	}
	public void setMsloc(String msloc) {
		this.msloc = msloc;
	}
	public String getMeloc() {
		return meloc;
	}
	public void setMeloc(String meloc) {
		this.meloc = meloc;
	}
	public Date getMsdate() {
		return msdate;
	}
	public void setMsdate(Date msdate) {
		this.msdate = msdate;
		
		setSmsdate();
	}
	public Date getMedate() {
		return medate;
	}
	public void setMedate(Date medate) {
		this.medate = medate;
		
		setSmedate();
	}
	public String getSmsdate() {
		return smsdate;
	}
	public void setSmsdate(String smsdate) {
		this.smsdate = smsdate;
	}
	public void setSmsdate() {
		SimpleDateFormat form = new SimpleDateFormat("yyyy-MM-dd");
		
		this.smsdate = form.format(msdate);
	}
	public String getSmedate() {
		return smedate;
	}
	public void setSmedate(String smedate) {
		this.smedate = smedate;
	}
	public void setSmedate() {
		SimpleDateFormat form = new SimpleDateFormat("yyyy-MM-dd");
		
		this.smedate = form.format(medate);
	}
	public int getMcost() {
		return mcost;
	}
	public void setMcost(int mcost) {
		this.mcost = mcost;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	
}
