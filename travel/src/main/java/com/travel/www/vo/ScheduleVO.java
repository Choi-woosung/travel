package com.travel.www.vo;

import java.sql.Date;

public class ScheduleVO {
	private int sNo;
	private String sName; 
	private Date sSdate;
	private Date sEdate; 
	private String sCountry; 
	private String sArea;  
	private int sWriter;
	private Date sWdate;
	private Date sWedate; 
	private String sBody;
	private String sPtotal;
	public int sRate;
	public String sDel;
	
	
	public String getsPtotal() {
		return sPtotal;
	}
	public void setsPtotal(String sPtotal) {
		this.sPtotal = sPtotal;
	}
	public int getsNo() {
		return sNo;
	}
	public void setsNo(int sNo) {
		this.sNo = sNo;
	}
	public String getsName() {
		return sName;
	}
	public void setsName(String sName) {
		this.sName = sName;
	}
	public Date getsSdate() {
		return sSdate;
	}
	public void setsSdate(Date sSdate) {
		this.sSdate = sSdate;
	}
	public Date getsEdate() {
		return sEdate;
	}
	public void setsEdate(Date sEdate) {
		this.sEdate = sEdate;
	}
	public String getsCountry() {
		return sCountry;
	}
	public void setsCountry(String sCountry) {
		this.sCountry = sCountry;
	}
	public String getsArea() {
		return sArea;
	}
	public void setsArea(String sArea) {
		this.sArea = sArea;
	}
	public int getsWriter() {
		return sWriter;
	}
	public void setsWriter(int sWriter) {
		this.sWriter = sWriter;
	}
	public Date getsWdate() {
		return sWdate;
	}
	public void setsWdate(Date sWdate) {
		this.sWdate = sWdate;
	}
	public Date getsWedate() {
		return sWedate;
	}
	public void setsWedate(Date sWedate) {
		this.sWedate = sWedate;
	}
	public String getsBody() {
		return sBody;
	}
	public void setsBody(String sBody) {
		this.sBody = sBody;
	}
	public int getsRate() {
		return sRate;
	}
	public void setsRate(int sRate) {
		this.sRate = sRate;
	}
	public String getsDel() {
		return sDel;
	}
	public void setsDel(String sDel) {
		this.sDel = sDel;
	}
	
	}
