package com.travel.www.vo;

import java.sql.Date;
import java.text.SimpleDateFormat;

public class ScheduleVO {
	private int sRn;
	private int sNo;
	private String sName; 
	private String mId; 
	private String sSdate;
	private String sEdate;  
	private String sCountry; 
	private String sArea;  
	private int sWriter;
	private String sWdate;
	private Date sWedate; 
	private String sBody;
	private int sCtotal;
	private int sAtotal;
	private int sDay;
	private double sRate;
	private String sDel;
	private int sCost;
	private int cnt;
	private int idCheck;
	private double likeAvg;
	private String avatarName;
	
	public String getAvatarName() {
		return avatarName;
	}
	public void setAvatarName(String avatarName) {
		this.avatarName = avatarName;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public int getIdCheck() {
		return idCheck;
	}
	public void setIdCheck(int idCheck) {
		this.idCheck = idCheck;
	}
	public double getLikeAvg() {
		return likeAvg;
	}
	public void setLikeAvg(double likeAvg) {
		this.likeAvg = likeAvg;
	}
	public String getmId() {
		return mId;
	}
	public void setmId(String mId) {
		this.mId = mId;
	}
	public int getsCost() {
		return sCost;
	}
	public void setsCost(int sCost) {
		this.sCost = sCost;
	}
	public int getsRn() {
		return sRn;
	}
	public void setsRn(int sRn) {
		this.sRn = sRn;
	}
	public int getsAtotal() {
		return sAtotal;
	}
	public void setsAtotal(int sAtotal) {
		this.sAtotal = sAtotal;
	}
	
	public int getsCtotal() {
		return sCtotal;
	}
	public void setsCtotal(int sCtotal) {
		this.sCtotal = sCtotal;
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
	public String getsSdate() {
		return sSdate;
	}
	public void setsSdate(String sSdate) {
		this.sSdate = sSdate;
	}
	public String getsEdate() {
		return sEdate;
	}
	public void setsEdate(String sEdate) {
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
	public String getsWdate() {
		return sWdate;
	}
	public void setsWdate(String sWdate) {
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
	public double getsRate() {
		return sRate;
	}
	public void setsRate(double sRate) {
		this.sRate = sRate;
	}
	public String getsDel() {
		return sDel;
	}
	public void setsDel(String sDel) {
		this.sDel = sDel;
	}
	public int getsDay() {
		return sDay;
	}
	public void setsDay(int sDay) {
		this.sDay = sDay;
	}
}
