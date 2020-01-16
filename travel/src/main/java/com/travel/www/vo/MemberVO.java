package com.travel.www.vo;


 
import java.sql.*;

import org.springframework.web.multipart.MultipartFile;

	
public class MemberVO {
	private int mNo;
	private String mId;
	private String mPw;
	private String mPw2;
	private int nPw2;
	private Date mPcdate;
	private String sPcdate;
	private String mMail;
	private String mName;
	private String mAddress;
	private String mMobile;
	private Date mJdate;
	private String sJdate;
	private Date mOdate;
	private String mGrade;
	private int mAvatar;
	private int mPoint;
	private int cnt;
	private MultipartFile sFile;
	private MultipartFile[] file;
	
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

	public String getmPw2() {
		return mPw2;
	}
	public void setmPw2(String mPw2) {
		this.mPw2 = mPw2;
	}
	
	public int getnPw2() {
		return nPw2;
	}
	public void setnPw2(int nPw2) {
		this.nPw2 = nPw2;
	}
	public Date getmPcdate() {
		return mPcdate;
	}
	public void setmPcdate(Date mPcdate) {
		this.mPcdate = mPcdate;
	}
	public String getsPcdate() {
		return sPcdate;
	}
	public void setsPcdate(String sPcdate) {
		this.sPcdate = sPcdate;
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
	public String getmMobile() {
		return mMobile;
	}
	public void setmMobile(String mMobile) {
		this.mMobile = mMobile;
	}
	public String getmId() {
		return mId;
	}
	public void setmId(String mId) {
		this.mId = mId;
	}
	public Date getmJdate() {
		return mJdate;
	}
	public void setmJdate(Date mJdate) {
		this.mJdate = mJdate;
	}
	public String getsJdate() {
		return sJdate;
	}
	public void setsJdate(String sJdate) {
		this.sJdate = sJdate;
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
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public MultipartFile getsFile() {
		return sFile;
	}
	public void setsFile(MultipartFile sFile) {
		this.sFile = sFile;
	}
	public MultipartFile[] getFile() {
		return file;
	}
	public void setFile(MultipartFile[] file) {
		this.file = file;
	}

}
