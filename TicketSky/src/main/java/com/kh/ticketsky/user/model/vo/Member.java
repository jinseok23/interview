package com.kh.ticketsky.user.model.vo;

import java.util.Date;

public class Member {
	private String userId;
	private String password;
	private String userName;
	private String email;
	private String gender;
	private String birthdate;
	private String address;
	private String phone;
	private int categoryNo;
	private Date enrollDate;
	private String ratingCode;
	private String ratingName;
	private String separator;
	private String snsLogin;
	
	public Member(String userId, String password, String userName, String email, String gender, String birthdate,
			String address, String phone, int categoryNo, Date enrollDate, String ratingCode, String ratingName,
			String separator, String snsLogin) {
		super();
		this.userId = userId;
		this.password = password;
		this.userName = userName;
		this.email = email;
		this.gender = gender;
		this.birthdate = birthdate;
		this.address = address;
		this.phone = phone;
		this.categoryNo = categoryNo;
		this.enrollDate = enrollDate;
		this.ratingCode = ratingCode;
		this.ratingName = ratingName;
		this.separator = separator;
		this.snsLogin = snsLogin;
	}

	public String getSnsLogin() {
		return snsLogin;
	}

	public void setSnsLogin(String snsLogin) {
		this.snsLogin = snsLogin;
	}

	public Member(String userId, String password, String userName, String email, String gender, String birthdate,
			String address, String phone, int categoryNo, Date enrollDate, String ratingCode, String ratingName,
			String separator) {
		super();
		this.userId = userId;
		this.password = password;
		this.userName = userName;
		this.email = email;
		this.gender = gender;
		this.birthdate = birthdate;
		this.address = address;
		this.phone = phone;
		this.categoryNo = categoryNo;
		this.enrollDate = enrollDate;
		this.ratingCode = ratingCode;
		this.ratingName = ratingName;
		this.separator = separator;
	}

	public Member() {}

	public String getRatingName() {
		return ratingName;
	}

	public void setRatingName(String ratingName) {
		this.ratingName = ratingName;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getBirthdate() {
		return birthdate;
	}

	public void setBirthdate(String birthdate) {
		this.birthdate = birthdate;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public int getCategoryNo() {
		return categoryNo;
	}

	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	public String getRatingCode() {
		return ratingCode;
	}

	public void setRatingCode(String ratingCode) {
		this.ratingCode = ratingCode;
	}

	public String getSeparator() {
		return separator;
	}

	public void setSeparator(String separator) {
		this.separator = separator;
	}

	@Override
	public String toString() {
		return "Member [userId=" + userId + ", password=" + password + ", userName=" + userName + ", email=" + email
				+ ", gender=" + gender + ", birthdate=" + birthdate + ", address=" + address + ", phone=" + phone
				+ ", categoryNo=" + categoryNo + ", enrollDate=" + enrollDate + ", ratingCode=" + ratingCode
				+ ", separator=" + separator + "]";
	}
			
}
