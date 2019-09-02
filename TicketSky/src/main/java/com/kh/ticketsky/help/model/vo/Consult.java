package com.kh.ticketsky.help.model.vo;

import java.sql.Date;

public class Consult {
	private int consult_No;
	private int cate_No;
	private String userId;
	private String title;
	private String content;
	private Date cDate;
	
	public Consult() {}

	public Consult(int consult_No, int cate_No, String userId, String title, String content, Date cDate) {
		super();
		this.consult_No = consult_No;
		this.cate_No = cate_No;
		this.userId = userId;
		this.title = title;
		this.content = content;
		this.cDate = cDate;
	}

	public int getConsult_No() {
		return consult_No;
	}

	public void setConsult_No(int consult_No) {
		this.consult_No = consult_No;
	}

	public int getCate_No() {
		return cate_No;
	}

	public void setCate_No(int cate_No) {
		this.cate_No = cate_No;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
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

	public Date getcDate() {
		return cDate;
	}

	public void setcDate(Date cDate) {
		this.cDate = cDate;
	}

	@Override
	public String toString() {
		return "Consult [consult_No=" + consult_No + ", cate_No=" + cate_No + ", userId=" + userId + ", title=" + title
				+ ", content=" + content + ", cDate=" + cDate + "]";
	}
	
}
