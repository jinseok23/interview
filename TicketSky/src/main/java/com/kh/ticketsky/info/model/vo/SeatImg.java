package com.kh.ticketsky.info.model.vo;

public class SeatImg {
	private int seatImgNo;
	private String oriSeatImg;
	private String reSeatImg;
	private String seatContent;
	private int performNo; //공연번호 참조
	
	public SeatImg() {}

	public SeatImg(int seatImgNo, String oriSeatImg, String reSeatImg, String seatContent, int performNo) {
		super();
		this.seatImgNo = seatImgNo;
		this.oriSeatImg = oriSeatImg;
		this.reSeatImg = reSeatImg;
		this.seatContent = seatContent;
		this.performNo = performNo;
	}

	public int getSeatImgNo() {
		return seatImgNo;
	}

	public void setSeatImgNo(int seatImgNo) {
		this.seatImgNo = seatImgNo;
	}

	public String getOriSeatImg() {
		return oriSeatImg;
	}

	public void setOriSeatImg(String oriSeatImg) {
		this.oriSeatImg = oriSeatImg;
	}

	public String getReSeatImg() {
		return reSeatImg;
	}

	public void setReSeatImg(String reSeatImg) {
		this.reSeatImg = reSeatImg;
	}

	public String getSeatContent() {
		return seatContent;
	}

	public void setSeatContent(String seatContent) {
		this.seatContent = seatContent;
	}

	public int getPerformNo() {
		return performNo;
	}

	public void setPerformNo(int performNo) {
		this.performNo = performNo;
	}

	
	

}
