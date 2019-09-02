package com.kh.ticketsky.info.model.vo;

public class SeatData {

	private int seatDataNo;			
	private int seatNum;		//좌석번호
	private String reserved; //예약확인
	private int seatInfoNo; //좌석정보 번호 참조
	
	public SeatData() {}

	public SeatData(int seatDataNo, int seatNum, String reserved, int seatInfoNo) {
		super();
		this.seatDataNo = seatDataNo;
		this.seatNum = seatNum;
		this.reserved = reserved;
		this.seatInfoNo = seatInfoNo;
	}

	public int getSeatDataNo() {
		return seatDataNo;
	}

	public void setSeatDataNo(int seatDataNo) {
		this.seatDataNo = seatDataNo;
	}

	public int getSeatNum() {
		return seatNum;
	}

	public void setSeatNum(int seatNum) {
		this.seatNum = seatNum;
	}

	public String getReserved() {
		return reserved;
	}

	public void setReserved(String reserved) {
		this.reserved = reserved;
	}

	public int getSeatInfoNo() {
		return seatInfoNo;
	}

	public void setSeatInfoNo(int seatInfoNo) {
		this.seatInfoNo = seatInfoNo;
	}
	
	
	
}