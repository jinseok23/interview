package com.kh.ticketsky.help.model.vo;

public class Faq {

	private int faq_no;
	private int cate_no;
	private String faq_q;
	private String faq_a;
	
	public Faq() {}

	@Override
	public String toString() {
		return "Faq [faq_no=" + faq_no + ", cate_no=" + cate_no + ", faq_q=" + faq_q + ", faq_a=" + faq_a + "]";
	}

	public int getFaq_no() {
		return faq_no;
	}

	public void setFaq_no(int faq_no) {
		this.faq_no = faq_no;
	}

	public int getCate_no() {
		return cate_no;
	}

	public void setCate_no(int cate_no) {
		this.cate_no = cate_no;
	}

	public String getFaq_q() {
		return faq_q;
	}

	public void setFaq_q(String faq_q) {
		this.faq_q = faq_q;
	}

	public String getFaq_a() {
		return faq_a;
	}

	public void setFaq_a(String faq_a) {
		this.faq_a = faq_a;
	}

	public Faq(int faq_no, int cate_no, String faq_q, String faq_a) {
		super();
		this.faq_no = faq_no;
		this.cate_no = cate_no;
		this.faq_q = faq_q;
		this.faq_a = faq_a;
	}
}
