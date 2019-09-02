package com.kh.ticketsky.info.model.vo;

public class SeatInfo {
	private int seatInfoNo;		//좌석정보 번호
	private int seatFloor;		//층수
	private String seatLevel;	//좌석 등급
	private String seatName;	//좌석이름	
	private int seatStartNum;		//좌석시작번호
	private int seatEndNum;		//좌석 끝 번호
	private int seatPrice;		//좌석 가격
	private String notReserved; //비지정석 경우 Y
	private int performDateNo;		//공연일정 번호 참조
	private int seatCount;		//잔여 좌석수

	public SeatInfo() {}

	public SeatInfo(int seatInfoNo, int seatFloor, String seatLevel, String seatName, int seatStartNum, int seatEndNum,
			int seatPrice, String notReserved, int performDateNo, int seatCount) {
		super();
		this.seatInfoNo = seatInfoNo;
		this.seatFloor = seatFloor;
		this.seatLevel = seatLevel;
		this.seatName = seatName;
		this.seatStartNum = seatStartNum;
		this.seatEndNum = seatEndNum;
		this.seatPrice = seatPrice;
		this.notReserved = notReserved;
		this.performDateNo = performDateNo;
		this.seatCount = seatCount;
	}

	public int getSeatInfoNo() {
		return seatInfoNo;
	}

	public void setSeatInfoNo(int seatInfoNo) {
		this.seatInfoNo = seatInfoNo;
	}

	public int getSeatFloor() {
		return seatFloor;
	}

	public void setSeatFloor(int seatFloor) {
		this.seatFloor = seatFloor;
	}

	public String getSeatLevel() {
		return seatLevel;
	}

	public void setSeatLevel(String seatLevel) {
		this.seatLevel = seatLevel;
	}

	public String getSeatName() {
		return seatName;
	}

	public void setSeatName(String seatName) {
		this.seatName = seatName;
	}

	public int getSeatStartNum() {
		return seatStartNum;
	}

	public void setSeatStartNum(int seatStartNum) {
		this.seatStartNum = seatStartNum;
	}

	public int getSeatEndNum() {
		return seatEndNum;
	}

	public void setSeatEndNum(int seatEndNum) {
		this.seatEndNum = seatEndNum;
	}

	public int getSeatPrice() {
		return seatPrice;
	}

	public void setSeatPrice(int seatPrice) {
		this.seatPrice = seatPrice;
	}

	public String getNotReserved() {
		return notReserved;
	}

	public void setNotReserved(String notReserved) {
		this.notReserved = notReserved;
	}

	public int getPerformDateNo() {
		return performDateNo;
	}

	public void setPerformDateNo(int performDateNo) {
		this.performDateNo = performDateNo;
	}

	public int getSeatCount() {
		return seatCount;
	}

	public void setSeatCount(int seatCount) {
		this.seatCount = seatCount;
	}

	
	
	
	
}
