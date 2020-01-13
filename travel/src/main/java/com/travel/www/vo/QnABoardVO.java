package com.travel.www.vo;

import java.sql.Date;
import java.util.ArrayList;

import org.springframework.web.multipart.MultipartFile;

public class QnABoardVO {
	private int q_no;
	private String q_head;
	private String q_body;
	private Date q_wdate;
	private String q_status;
	private String m_id;
	private String f_no;
	private String f_qno;
	private String f_file_name;
	private ArrayList<MultipartFile> files;
	
	public String getF_no() {
		return f_no;
	}
	public void setF_no(String f_no) {
		this.f_no = f_no;
	}
	public String getF_qno() {
		return f_qno;
	}
	public void setF_qno(String f_qno) {
		this.f_qno = f_qno;
	}
	public String getF_file_name() {
		return f_file_name;
	}
	public void setF_file_name(String f_file_name) {
		this.f_file_name = f_file_name;
	}
	public int getQ_no() {
		return q_no;
	}
	public void setQ_no(int q_no) {
		this.q_no = q_no;
	}
	public String getQ_head() {
		return q_head;
	}
	public void setQ_head(String q_head) {
		this.q_head = q_head;
	}
	public String getQ_body() {
		return q_body;
	}
	public void setQ_body(String q_body) {
		this.q_body = q_body;
	}
	public Date getQ_wdate() {
		return q_wdate;
	}
	public void setQ_wdate(Date q_wdate) {
		this.q_wdate = q_wdate;
	}
	public String getQ_status() {
		return q_status;
	}
	public void setQ_status(String q_status) {
		this.q_status = q_status;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public ArrayList<MultipartFile> getFiles() {
		return files;
	}
	public void setFiles(ArrayList<MultipartFile> files) {
		this.files = files;
	}
}
