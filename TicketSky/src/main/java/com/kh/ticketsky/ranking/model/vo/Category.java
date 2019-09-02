package com.kh.ticketsky.ranking.model.vo;

public class Category 
{

	private int CategoryNo;
	private String majorCategory;
	private String subCategory;
	
	
	
	public Category() {}
	
	
	public Category(int categoryNo, String majorCategory, String subCategory) 
	{
		super();
		CategoryNo = categoryNo;
		this.majorCategory = majorCategory;
		this.subCategory = subCategory;
	}


	public int getCategoryNo() {
		return CategoryNo;
	}


	public void setCategoryNo(int categoryNo) {
		CategoryNo = categoryNo;
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


	@Override
	public String toString() {
		return "Category [CategoryNo=" + CategoryNo + ", majorCategory=" + majorCategory + ", subCategory="
				+ subCategory + "]";
	}  
	
	
	
	
	
	
}
