package com.travel.www.vo;

import java.sql.Date;
import java.text.SimpleDateFormat;

public class ScheduleRestVO {
	
	private int rno;
	private String rname;
	private String raddress;
	private Date rsdate;
	private Date redate;
	private String srsdate;
	private String sredate;
	private int rcost;
	private String type;
	
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public String getRname() {
		return rname;
	}
	public void setRname(String rname) {
		this.rname = rname;
	}
	public String getRaddress() {
		return raddress;
	}
	public void setRaddress(String raddress) {
		this.raddress = raddress;
	}
	public Date getRsdate() {
		return rsdate;
	}
	public void setRsdate(Date rsdate) {
		this.rsdate = rsdate;
		
		setSrsdate();
	}
	public Date getRedate() {
		return redate;
	}
	public void setRedate(Date redate) {
		this.redate = redate;
		
		setSredate();
	}
	public String getSrsdate() {
		return srsdate;
	}
	public void setSrsdate(String srsdate) {
		this.srsdate = srsdate;
	}
	public void setSrsdate() {
		SimpleDateFormat form = new SimpleDateFormat("yyyy-MM-dd");
		
		this.srsdate = form.format(rsdate);
	}
	public String getSredate() {
		return sredate;
	}
	public void setSredate(String sredate) {
		this.sredate = sredate;
	}
	public void setSredate() {
		SimpleDateFormat form = new SimpleDateFormat("yyyy-MM-dd");
		
		this.sredate = form.format(redate);
	}
	public int getRcost() {
		return rcost;
	}
	public void setRcost(int rcost) {
		this.rcost = rcost;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	
}
