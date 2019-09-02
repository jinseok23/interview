package com.kh.ticketsky.reserve.model.vo;

public class Purchase {
	private int purchaseCode;
	private String userId;
	private int performNo;
	private String performName;
	private int oriPrice;
	private int actualPrice;
	private String cancel;
	private String status;
	private String paymentMethod;
	private String watchDate;
	private String purchaseDate;
	private String purchaseSeat;
	private int seatDataNo;
	
	
	
	public Purchase() {}

	public Purchase(int purchaseCode, String userId, int performNo, String performName, int oriPrice, int actualPrice,
			String cancel, String status, String paymentMethod, String watchDate, String purchaseDate,
			String purchaseSeat, int seatDataNo) {
		super();
		this.purchaseCode = purchaseCode;
		this.userId = userId;
		this.performNo = performNo;
		this.performName = performName;
		this.oriPrice = oriPrice;
		this.actualPrice = actualPrice;
		this.cancel = cancel;
		this.status = status;
		this.paymentMethod = paymentMethod;
		this.watchDate = watchDate;
		this.purchaseDate = purchaseDate;
		this.purchaseSeat = purchaseSeat;
		this.seatDataNo = seatDataNo;
	}

	public int getPurchaseCode() {
		return purchaseCode;
	}

	public void setPurchaseCode(int purchaseCode) {
		this.purchaseCode = purchaseCode;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
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

	public int getOriPrice() {
		return oriPrice;
	}

	public void setOriPrice(int oriPrice) {
		this.oriPrice = oriPrice;
	}

	public int getActualPrice() {
		return actualPrice;
	}

	public void setActualPrice(int actualPrice) {
		this.actualPrice = actualPrice;
	}

	public String getCancel() {
		return cancel;
	}

	public void setCancel(String cancel) {
		this.cancel = cancel;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getPaymentMethod() {
		return paymentMethod;
	}

	public void setPaymentMethod(String paymentMethod) {
		this.paymentMethod = paymentMethod;
	}

	public String getWatchDate() {
		return watchDate;
	}

	public void setWatchDate(String watchDate) {
		this.watchDate = watchDate;
	}

	public String getPurchaseDate() {
		return purchaseDate;
	}

	public void setPurchaseDate(String purchaseDate) {
		this.purchaseDate = purchaseDate;
	}

	public String getPurchaseSeat() {
		return purchaseSeat;
	}

	public void setPurchaseSeat(String purchaseSeat) {
		this.purchaseSeat = purchaseSeat;
	}

	public int getSeatDataNo() {
		return seatDataNo;
	}

	public void setSeatDataNo(int seatDataNo) {
		this.seatDataNo = seatDataNo;
	}

	@Override
	public String toString() {
		return "Purchase [purchaseCode=" + purchaseCode + ", userId=" + userId + ", performNo=" + performNo
				+ ", performName=" + performName + ", oriPrice=" + oriPrice + ", actualPrice=" + actualPrice
				+ ", cancel=" + cancel + ", status=" + status + ", paymentMethod=" + paymentMethod + ", watchDate="
				+ watchDate + ", purchaseDate=" + purchaseDate + ", purchaseSeat=" + purchaseSeat + ", seatDataNo="
				+ seatDataNo + "]";
	}

	
	
	
}
