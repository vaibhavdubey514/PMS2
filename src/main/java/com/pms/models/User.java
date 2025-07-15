package com.pms.models;

public class User {
	private String name, email, countryCode, mobileNumber, address, userId, password, role, salt;
	private int emailNotifications;

	public User(String name, String email, String countryCode, String mobileNumber, String address, String userId,
			String password, int emailNotifications, String role, String salt) {
		this.name = name;
		this.email = email;
		this.countryCode = countryCode;
		this.mobileNumber = mobileNumber;
		this.address = address;
		this.userId = userId;
		this.password = password;
		this.emailNotifications = emailNotifications;
		this.role = role;
		this.salt = salt;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getCountryCode() {
		return countryCode;
	}

	public void setCountryCode(String countryCode) {
		this.countryCode = countryCode;
	}

	public String getMobileNumber() {
		return mobileNumber;
	}

	public void setMobileNumber(String mobileNumber) {
		this.mobileNumber = mobileNumber;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
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

	public int getEmailNotifications() {
		return emailNotifications;
	}

	public void setEmailNotifications(int emailNotifications) {
		this.emailNotifications = emailNotifications;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getSalt() {
		return salt;
	}

	public void setSalt(String salt) {
		this.salt = salt;
	}
}
