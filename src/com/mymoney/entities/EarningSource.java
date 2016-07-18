package com.mymoney.entities;

public class EarningSource {
	
private int id;
private String earningName;
private String earningDescription;
private int userID;
private int deleted;

public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public String getEarningName() {
	return earningName;
}
public void setEarningName(String earningName) {
	this.earningName = earningName;
}
public String getEarningDescription() {
	return earningDescription;
}
public void setEarningDescription(String earningDescription) {
	this.earningDescription = earningDescription;
}
public int getUserID() {
	return userID;
}
public void setUserID(int userID) {
	this.userID = userID;
}
public int getDeleted() {
	return deleted;
}
public void setDeleted(int deleted) {
	this.deleted = deleted;
}

}
