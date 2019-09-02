package com.kh.ticketsky.info.model.vo;

public class Category {

	private int categoryNo;
	private String majorCategory;
	private String subCategory;
	
	public Category() {}

	public Category(int categoryNo, String majorCategory, String subCategory) {
		super();
		this.categoryNo = categoryNo;
		this.majorCategory = majorCategory;
		this.subCategory = subCategory;
	}	

	public Category(String majorCategory, String subCategory) {
		super();
		this.majorCategory = majorCategory;
		this.subCategory = subCategory;
	}

	public int getCategoryNo() {
		return categoryNo;
	}

	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
	}

	public String getMajorCategory() {
		return majorCategory;
	}

	public void setMajorCategory(String majorCategory) {
		this.majorCategory = majorCategory;
	}

	public String getSubCategory() {
		return subCategory;
	}

	public void setSubCategory(String subCategory) {
		this.subCategory = subCategory;
	}
	
	
}
