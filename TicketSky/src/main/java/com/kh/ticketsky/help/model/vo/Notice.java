package com.kh.ticketsky.help.model.vo;

import java.sql.Date;

public class Notice{

	private int noticeNo;
	private int cateNo;
	private String title;
	private String content;
	private Date openDate;
	private Date nDate;
	private int count;
	
	
	public Notice() {}


	public int getNoticeNo() {
		return noticeNo;
	}


	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}


	public int getCateNo() {
		return cateNo;
	}


	public void setCateNo(int cateNo) {
		this.cateNo = cateNo;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}


	public Date getOpenDate() {
		return openDate;
	}


	public void setOpenDate(Date openDate) {
		this.openDate = openDate;
	}


	public Date getnDate() {
		return nDate;
	}


	public void setnDate(Date nDate) {
		this.nDate = nDate;
	}


	public int getCount() {
		return count;
	}


	public void setCount(int count) {
		this.count = count;
	}


	@Override
	public String toString() {
		return "Notice [noticeNo=" + noticeNo + ", cateNo=" + cateNo + ", title=" + title + ", content=" + content
				+ ", openDate=" + openDate + ", nDate=" + nDate + ", count=" + count + "]";
	}


	public Notice(int noticeNo, int cateNo, String title, String content, Date openDate, Date nDate, int count) {
		super();
		this.noticeNo = noticeNo;
		this.cateNo = cateNo;
		this.title = title;
		this.content = content;
		this.openDate = openDate;
		this.nDate = nDate;
		this.count = count;
	}
}
