package com.travel.www.vo;


 
	import java.sql.*;
	import java.text.*;

import org.springframework.web.multipart.MultipartFile;
	
public class MemberVO {
	private int mNo;
	private String mPw;
	private Date mPcdate;
	private String mMail;
	private String mName;
	private String mAddress;
	private int mMobile;
	private String mID;
	private Date mJdate;
	private Date mOdate;
	private String mGrade;
	private int mAvatar;
	private int mPoint;
	public int getmNo() {
		return mNo;
	}
	public void setmNo(int mNo) {
		this.mNo = mNo;
	}
	public String getmPw() {
		return mPw;
	}
	public void setmPw(String mPw) {
		this.mPw = mPw;
	}
	public Date getmPcdate() {
		return mPcdate;
	}
	public void setmPcdate(Date mPcdate) {
		this.mPcdate = mPcdate;
	}
	public String getmMail() {
		return mMail;
	}
	public void setmMail(String mMail) {
		this.mMail = mMail;
	}
	public String getmName() {
		return mName;
	}
	public void setmName(String mName) {
		this.mName = mName;
	}
	public String getmAddress() {
		return mAddress;
	}
	public void setmAddress(String mAddress) {
		this.mAddress = mAddress;
	}
	public int getmMobile() {
		return mMobile;
	}
	public void setmMobile(int mMobile) {
		this.mMobile = mMobile;
	}
	public String getmID() {
		return mID;
	}
	public void setmID(String mID) {
		this.mID = mID;
	}
	public Date getmJdate() {
		return mJdate;
	}
	public void setmJdate(Date mJdate) {
		this.mJdate = mJdate;
	}
	public Date getmOdate() {
		return mOdate;
	}
	public void setmOdate(Date mOdate) {
		this.mOdate = mOdate;
	}
	public String getmGrade() {
		return mGrade;
	}
	public void setmGrade(String mGrade) {
		this.mGrade = mGrade;
	}
	public int getmAvatar() {
		return mAvatar;
	}
	public void setmAvatar(int mAvatar) {
		this.mAvatar = mAvatar;
	}
	public int getmPoint() {
		return mPoint;
	}
	public void setmPoint(int mPoint) {
		this.mPoint = mPoint;
	}
	
	
}
