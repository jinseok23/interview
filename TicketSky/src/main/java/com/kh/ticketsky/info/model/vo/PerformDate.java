package com.kh.ticketsky.info.model.vo;

public class PerformDate {
	
	private int performDateNo;
	private String performDate; //날짜 시간까지 저장
	private int performNo; //공연번호 참조
	
    public PerformDate() {}

	public PerformDate(int performDateNo, String performDate, int performNo) {
		super();
		this.performDateNo = performDateNo;
		this.performDate = performDate;
		this.performNo = performNo;
	}
	
	public PerformDate(String performDate) {
		super();
		this.performDate = performDate;
	}

	public int getPerformDateNo() {
		return performDateNo;
	}

	public void setPerformDateNo(int performDateNo) {
		this.performDateNo = performDateNo;
	}

	public String getPerformDate() {
		return performDate;
	}

	public void setPerformDate(String performDate) {
		this.performDate = performDate;
	}

	public int getPerformNo() {
		return performNo;
	}

	public void setPerformNo(int performNo) {
		this.performNo = performNo;
	}
    
}
