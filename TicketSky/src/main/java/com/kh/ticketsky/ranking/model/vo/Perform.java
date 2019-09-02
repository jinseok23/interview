package com.kh.ticketsky.ranking.model.vo;

import java.sql.Date;

public class Perform 
{
	private int performNo;
	private String performName;
	private String placeName;
	private String placeAddress;
	private Date ticketOpenDate;
	private String performDuration;
	private int categoryNo;
	private Date regDate;
	private String userId;
	private String companyName;
	private int companyPhoneNum;
	private String performTime;
	private String performGrade;
	private String performConfirm;
	
	
	public Perform() {}

	
	public Perform(int performNo, String performName, String placeName, String placeAddress, Date ticketOpenDate,
			String performDuration, int categoryNo, Date regDate, String userId, String companyName,
			int companyPhoneNum, String performTime, String performGrade, String performConfirm) {
		super();
		this.performNo = performNo;
		this.performName = performName;
		this.placeName = placeName;
		this.placeAddress = placeAddress;
		this.ticketOpenDate = ticketOpenDate;
		this.performDuration = performDuration;
		this.categoryNo = categoryNo;
		this.regDate = regDate;
		this.userId = userId;
		this.companyName = companyName;
		this.companyPhoneNum = companyPhoneNum;
		this.performTime = performTime;
		this.performGrade = performGrade;
		this.performConfirm = performConfirm;
	}




	public int getPerformNo() {
		return performNo;
	}


	public void setPerformNo(int performNo) {
		this.performNo = performNo;
	}


	public String getPerformName() {
		return performName;
	}


	public void setPerformName(String performName) {
		this.performName = performName;
	}


	public String getPlaceName() {
		return placeName;
	}


	public void setPlaceName(String placeName) {
		this.placeName = placeName;
	}


	public String getPlaceAddress() {
		return placeAddress;
	}


	public void setPlaceAddress(String placeAddress) {
		this.placeAddress = placeAddress;
	}


	public Date getTicketOpenDate() {
		return ticketOpenDate;
	}


	public void setTicketOpenDate(Date ticketOpenDate) {
		this.ticketOpenDate = ticketOpenDate;
	}


	public String getPerformDuration() {
		return performDuration;
	}


	public void setPerformDuration(String performDuration) {
		this.performDuration = performDuration;
	}


	public int getCategoryNo() {
		return categoryNo;
	}


	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
	}


	public Date getRegDate() {
		return regDate;
	}


	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}


	public String getUserId() {
		return userId;
	}


	public void setUserId(String userId) {
		this.userId = userId;
	}


	public String getCompanyName() {
		return companyName;
	}


	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}


	public int getCompanyPhoneNum() {
		return companyPhoneNum;
	}


	public void setCompanyPhoneNum(int companyPhoneNum) {
		this.companyPhoneNum = companyPhoneNum;
	}


	public String getPerformTime() {
		return performTime;
	}


	public void setPerformTime(String performTime) {
		this.performTime = performTime;
	}


	public String getPerformGrade() {
		return performGrade;
	}


	public void setPerformGrade(String performGrade) {
		this.performGrade = performGrade;
	}


	public String getPerformConfirm() {
		return performConfirm;
	}


	public void setPerformConfirm(String performConfirm) {
		this.performConfirm = performConfirm;
	}




	@Override
	public String toString() 
	{
		return "Perform [performNo=" + performNo + ", performName=" + performName + ", placeName=" + placeName
				+ ", placeAddress=" + placeAddress + ", ticketOpenDate=" + ticketOpenDate + ", performDuration="
				+ performDuration + ", categoryNo=" + categoryNo + ", regDate=" + regDate + ", userId=" + userId
				+ ", companyName=" + companyName + ", companyPhoneNum=" + companyPhoneNum + ", performTime="
				+ performTime + ", performGrade=" + performGrade + ", performConfirm=" + performConfirm + "]";
	}
	

	
	
}
