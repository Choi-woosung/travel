package com.travel.www.util;


public class PageUtil {
	private int nowPage; 	
	private int totalCount; 
	
	private int pageRow;	
	private int pageGroup;	
	
	private int startPage;	
	private int endPage;	
	
	private int startCont;	
	private int endCont;	
	
	private int totalPage;	
	
	public PageUtil() {}
	public PageUtil(int nowPage, int totalCount) {
		this.nowPage = nowPage;
		this.totalCount = totalCount;
		this.pageRow = 3;
		this.pageGroup = 3;
		
		calcPage();
		calcStart();
		calcEnd();
		calcCont();
	}
	public void setPage(int nowPage, int totalCount, int pageRow, int pageGroup) {
		this.nowPage = nowPage;
		this.totalCount = totalCount;
		this.pageRow = pageRow;
		this.pageGroup = pageGroup;
		
		calcPage();
		calcStart();
		calcEnd();
		calcCont();
	}
	public PageUtil(int nowPage, int totalCount, int pageRow, int pageGroup) {
		this.nowPage = nowPage;
		this.totalCount = totalCount;
		this.pageRow = pageRow;
		this.pageGroup = pageGroup;
		
		calcPage();
		calcStart();
		calcEnd();
		calcCont();
	}
	
	public void calcPage() {
		
		totalPage = (totalCount % pageRow == 0) ? (totalCount / pageRow) : (totalCount / pageRow +1);
	}
	
	
	public void calcStart() {
		int tmpGroup = (nowPage - 1) / pageGroup ;
			
			startPage = tmpGroup * pageGroup + 1;
	}
	
	public void calcEnd() {
		int tmpGroup = (nowPage -1) / pageGroup;
		endPage = (tmpGroup +1) * pageGroup; 
		if(endPage > totalPage) {
			endPage = totalPage;
		}
	}
	
	public void calcCont() {
		startCont = (nowPage -1) * pageRow +1;
		endCont = nowPage * pageRow;
	}
	
	public int getNowPage() {
		return nowPage;
	}
	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	public int getPageRow() {
		return pageRow;
	}
	public void setPageRow(int pageRow) {
		this.pageRow = pageRow;
	}
	public int getPageGroup() {
		return pageGroup;
	}
	public void setPageGroup(int pageGroup) {
		this.pageGroup = pageGroup;
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public int getStartCont() {
		return startCont;
	}
	public void setStartCont(int startCont) {
		this.startCont = startCont;
	}
	public int getEndCont() {
		return endCont;
	}
	public void setEndCont(int endCont) {
		this.endCont = endCont;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	
}
