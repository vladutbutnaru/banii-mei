package com.mymoney.entities;

import java.util.Date;

public class User {
	private int id;
	private String firstName;
	private String lastName;
	protected String password;
	private String dateOfBirth;
	private String email;
	private String phoneNumber;
	private int city;
	private int country;
	private int smoker;
	private int hasDriversLicence;
	private int hasCar;
	private int married;
	private int numberOfKids;
	private int preferredCurrency;
	private int admin;
	private int userType;
	private int agreedWithProcessingTerms;
	private int premium;
	private int numberOfLogins;
	private Date lastLogin;
	private Date dateRegistered;
	private String profileImagePath;

	// getters and setters
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getDateOfBirth() {
		return dateOfBirth;
	}

	public void setDateOfBirth(String dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public int getCity() {
		return city;
	}

	public void setCity(int city) {
		this.city = city;
	}

	public int getCountry() {
		return country;
	}

	public void setCountry(int country) {
		this.country = country;
	}

	public int getSmoker() {
		return smoker;
	}

	public void setSmoker(int smoker) {
		this.smoker = smoker;
	}

	public int getHasDriversLicence() {
		return hasDriversLicence;
	}

	public void setHasDriversLicence(int hasDriversLicence) {
		this.hasDriversLicence = hasDriversLicence;
	}

	public int getHasCar() {
		return hasCar;
	}

	public void setHasCar(int hasCar) {
		this.hasCar = hasCar;
	}

	public int getMarried() {
		return married;
	}

	public void setMarried(int married) {
		this.married = married;
	}

	public int getNumberOfKids() {
		return numberOfKids;
	}

	public void setNumberOfKids(int numberOfKids) {
		this.numberOfKids = numberOfKids;
	}

	public int getPreferredCurrency() {
		return preferredCurrency;
	}

	public void setPreferredCurrency(int preferredCurrency) {
		this.preferredCurrency = preferredCurrency;
	}

	public int getAdmin() {
		return admin;
	}

	public void setAdmin(int admin) {
		this.admin = admin;
	}

	public int getUserType() {
		return userType;
	}

	public void setUserType(int userType) {
		this.userType = userType;
	}

	public int getAgreedWithProcessingTerms() {
		return agreedWithProcessingTerms;
	}

	public void setAgreedWithProcessingTerms(int agreedWithProcessingTerms) {
		this.agreedWithProcessingTerms = agreedWithProcessingTerms;
	}

	public int getPremium() {
		return premium;
	}

	public void setPremium(int premium) {
		this.premium = premium;
	}

	public int getNumberOfLogins() {
		return numberOfLogins;
	}

	public void setNumberOfLogins(int numberOfLogins) {
		this.numberOfLogins = numberOfLogins;
	}

	public Date getLastLogin() {
		return lastLogin;
	}

	public void setLastLogin(Date lastLogin) {
		this.lastLogin = lastLogin;
	}

	public Date getDateRegistered() {
		return dateRegistered;
	}

	public void setDateRegistered(Date dateRegistered) {
		this.dateRegistered = dateRegistered;
	}

	// end getters and setters
	public String getProfileImagePath() {
		return profileImagePath;
	}

	public void setProfileImagePath(String profileImagePath) {
		this.profileImagePath = profileImagePath;
	}
}
