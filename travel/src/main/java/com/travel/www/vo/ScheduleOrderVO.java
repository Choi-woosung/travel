package com.travel.www.vo;

import java.awt.List;
import java.util.ArrayList;

public class ScheduleOrderVO {
	private ArrayList<ScheduleOrderVO> Schedules;
	private String placeName;
	private String liCnt;
	private String placeAddress;
	private String body;
	private String price;
	private String pid;
	
	public ArrayList<ScheduleOrderVO> getSchedules() {
		return Schedules;
	}
	public void setSchedules(ArrayList<ScheduleOrderVO> schedules) {
		Schedules = schedules;
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
	private String type;
	
}
