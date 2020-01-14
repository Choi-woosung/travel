package com.travel.www.vo;

import java.awt.List;
import java.util.ArrayList;

import org.springframework.web.multipart.MultipartFile;

public class ScheduleOrderVO {
	
	private ArrayList<ScheduleOrderVO> Schedules;
	private String type;
	private String placeName;
	private String body;
	private String price;
	private String liCnt;
	private String dayCount;
	private String placeLat;
	private String placeLng;
	private String pid;
	private String placeAddress;
	private ArrayList<MultipartFile> scheduleImg;
	private String scheduleName;
	private String scheduleBody;
	private String sCountry;
	private String sArea;
	private String sSdate;
	private String sEdate;
	private String writer;
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	private String url;
	
	public ArrayList<ScheduleOrderVO> getSchedules() {
		return Schedules;
	}
	public void setSchedules(ArrayList<ScheduleOrderVO> schedules) {
		Schedules = schedules;
	}
	public String getPid() {
		return pid;
	}
	public void setPid(String pid) {
		this.pid = pid;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getPlaceName() {
		return placeName;
	}
	public void setPlaceName(String placeName) {
		this.placeName = placeName;
	}
	public String getLiCnt() {
		return liCnt;
	}
	public void setLiCnt(String liCnt) {
		this.liCnt = liCnt;
	}
	public String getPlaceAddress() {
		return placeAddress;
	}
	public void setPlaceAddress(String placeAddress) {
		this.placeAddress = placeAddress;
	}
	public String getPlaceLat() {
		return placeLat;
	}
	public void setPlaceLat(String placeLat) {
		this.placeLat = placeLat;
	}
	public String getPlaceLng() {
		return placeLng;
	}
	public void setPlaceLng(String placeLng) {
		this.placeLng = placeLng;
	}
	public String getBody() {
		return body;
	}
	public void setBody(String body) {
		this.body = body;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getDayCount() {
		return dayCount;
	}
	public void setDayCount(String dayCount) {
		this.dayCount = dayCount;
	}
	public ArrayList<MultipartFile> getScheduleImg() {
		return scheduleImg;
	}
	public void setScheduleImg(ArrayList<MultipartFile> scheduleImg) {
		this.scheduleImg = scheduleImg;
	}
	public String getScheduleName() {
		return scheduleName;
	}
	public void setScheduleName(String scheduleName) {
		this.scheduleName = scheduleName;
	}
	public String getScheduleBody() {
		return scheduleBody;
	}
	public void setScheduleBody(String scheduleBody) {
		this.scheduleBody = scheduleBody;
	}
	public String getsSdate() {
		return sSdate;
	}
	public void setsSdate(String sSdate) {
		sSdate = sSdate.substring(0, sSdate.length()-1);
		this.sSdate = sSdate;
	}
	public String getsEdate() {
		return sEdate;
	}
	public void setsEdate(String sEdate) {
		sEdate = sEdate.substring(0, sEdate.length()-1);
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

}
