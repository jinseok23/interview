package com.kh.ticketsky.info.model.vo;

public class PerformContent {
	
	private int contentNo;
	private String oriContentImg;
	private String reContentImg;
	private String performContent;
	private int performNo; 
	
	public PerformContent() {}

	public PerformContent(int contentNo, String oriContentImg, String reContentImg, String performContent,
			int performNo) {
		super();
		this.contentNo = contentNo;
		this.oriContentImg = oriContentImg;
		this.reContentImg = reContentImg;
		this.performContent = performContent;
		this.performNo = performNo;
	}

	public int getContentNo() {
		return contentNo;
	}

	public void setContentNo(int contentNo) {
		this.contentNo = contentNo;
	}

	public String getOriContentImg() {
		return oriContentImg;
	}

	public void setOriContentImg(String oriContentImg) {
		this.oriContentImg = oriContentImg;
	}

	public String getReContentImg() {
		return reContentImg;
	}

	public void setReContentImg(String reContentImg) {
		this.reContentImg = reContentImg;
	}

	public String getPerformContent() {
		return performContent;
	}

	public void setPerformContent(String performContent) {
		this.performContent = performContent;
	}

	public int getPerformNo() {
		return performNo;
	}

	public void setPerformNo(int performNo) {
		this.performNo = performNo;
	}

	
	
	
}
