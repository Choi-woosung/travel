package com.travel.www.util;

/**
 * 	�� Ŭ������ ������ �̵� ��ɿ� �ʿ��� ������ ��� �ϱ� ���ؼ�
 * ������� ��ƿ��Ƽ ���� Ŭ����
 * @author ��ȣ��
 * @since 2019.12.03
 * @version v.1.0
 * @see
 * 
 * 				�����̷�
 * 						2019.12.03		Ŭ��������		�����	-	��ȣ��
 *						2019.12.18		Ŭ��������		�����	-	��ȣ��
 */
public class PageUtil {
	// ���� ����
	private int nowPage; 	// ���� �����ִ� ������
	private int totalCount; // �� �Խù� ��
	
	private int pageRow;	// �������� �� ������ �Խù� ��
	private int pageGroup;	//	��ȭ��� �̵����� ������ ��
	
	private int startPage;	//	�ش�ȭ�鿡�� ��Ÿ�� �̵� ���� ������
	private int endPage;	//	������ ������
	
	private int startCont;	//	���� ���������� ������ ���۰Խù� ��ȣ
	private int endCont;	//	���� ���������� ������ �������Խù� ��ȣ
	
	private int totalPage;	//	�� ������ ��
	
	public PageUtil() {}
	public PageUtil(int nowPage, int totalCount) {
		this.nowPage = nowPage;
		this.totalCount = totalCount;
		this.pageRow = 3;
		this.pageGroup = 3;
		
		// ������ ������ ����ؼ� ä���ش�.
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
		
		// ������ ������ ����ؼ� ä���ش�.
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
		
		// ������ ������ ����ؼ� ä���ش�.
		calcPage();
		calcStart();
		calcEnd();
		calcCont();
	}
	
	// �������� ���� ����ϴ� �Լ�
	public void calcPage() {
		/*
		 	�� ���������� �� �Խù� ���� ��ȭ�鿡 ǥ���� �Խù� ������ ������ �ȴ�.
		 	
		 	��, ��쿡 ���󼭴� ���������� ���� �� �� �ִ�.
		 */
		
		totalPage = (totalCount % pageRow == 0) ? (totalCount / pageRow) : (totalCount / pageRow +1);
	}
	
	// ������������ ����� �Լ�
	
	public void calcStart() {
		// ���� ���� �������� �׷��� ����ϰ�
		int tmpGroup = (nowPage - 1) / pageGroup ;
			
		//���� ���� �������� �׷��� ����������
			startPage = tmpGroup * pageGroup + 1;
	}
	
	// ���� ������ ���� ������ִ� �Լ�
	public void calcEnd() {
		int tmpGroup = (nowPage -1) / pageGroup;
		endPage = (tmpGroup +1) * pageGroup; 
		if(endPage > totalPage) {
			endPage = totalPage;
		}
	}
	
	// ���۰� �����Խù� ��ȣ ������ִ� �Լ�
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
