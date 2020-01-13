package com.travel.www.vo;

import java.awt.List;
import java.util.ArrayList;

import org.springframework.web.multipart.MultipartFile;

public class ScheduleOrderVO {
	private ArrayList<ScheduleOrderVO> Schedules;

	public ArrayList<ScheduleOrderVO> getSchedules() {
		return Schedules;
	}
	public void setSchedules(ArrayList<ScheduleOrderVO> schedules) {
		Schedules = schedules;
	}
	private ArrayList<String> pid;
	private ArrayList<String> type;
	private ArrayList<String> placeName;
	private ArrayList<String> liCnt;
	private ArrayList<String> placeAddress;
	private ArrayList<String> placeLat;
	private ArrayList<String> placeLng;
	private ArrayList<MultipartFile> scheduleImg;
	private String scheduleName;
	private String scheduleBody;
	
	public ArrayList<String> getPlaceLat() {
		return placeLat;
	}
	public void setPlaceLat(ArrayList<String> placeLat) {
		this.placeLat = placeLat;
	}
	public ArrayList<String> getPlaceLng() {
		return placeLng;
	}
	public void setPlaceLng(ArrayList<String> placeLng) {
		this.placeLng = placeLng;
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
	public ArrayList<MultipartFile> getScheduleImg() {
		return scheduleImg;
	}
	public void setScheduleImg(ArrayList<MultipartFile> scheduleImg) {
		this.scheduleImg = scheduleImg;
	}
	public ArrayList<String> getPid() {
		return pid;
	}
	public void setPid(ArrayList<String> pid) {
		this.pid = pid;
	}
	public ArrayList<String> getType() {
		return type;
	}
	public void setType(ArrayList<String> type) {
		this.type = type;
	}
	public ArrayList<String> getPlaceName() {
		return placeName;
	}
	public void setPlaceName(ArrayList<String> placeName) {
		this.placeName = placeName;
	}
	public ArrayList<String> getLiCnt() {
		return liCnt;
	}
	public void setLiCnt(ArrayList<String> liCnt) {
		this.liCnt = liCnt;
	}
	public ArrayList<String> getPlaceAddress() {
		return placeAddress;
	}
	public void setPlaceAddress(ArrayList<String> placeAddress) {
		this.placeAddress = placeAddress;
	}
	public ArrayList<String> getBody() {
		return body;
	}
	public void setBody(ArrayList<String> body) {
		this.body = body;
	}
	public ArrayList<String> getPrice() {
		return price;
	}
	public void setPrice(ArrayList<String> price) {
		this.price = price;
	}
	public ArrayList<String> getDayCount() {
		return dayCount;
	}
	public void setDayCount(ArrayList<String> dayCount) {
		this.dayCount = dayCount;
	}
	private ArrayList<String> body;
	private ArrayList<String> price;
	private ArrayList<String> dayCount;

}
