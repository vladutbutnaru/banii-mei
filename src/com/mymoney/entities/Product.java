package com.mymoney.entities;

import java.sql.Date;

public class Product {
private int ID;
private String productName;
private String productDescription;
private int categoryID;
private Date creationDate;
public int getID() {
	return ID;
}
public void setID(int iD) {
	ID = iD;
}
public String getProductName() {
	return productName;
}
public void setProductName(String productName) {
	this.productName = productName;
}
public String getProductDescription() {
	return productDescription;
}
public void setProductDescription(String productDescription) {
	this.productDescription = productDescription;
}
public int getCategoryID() {
	return categoryID;
}
public void setCategoryID(int categoryID) {
	this.categoryID = categoryID;
}
public Date getCreationDate() {
	return creationDate;
}
public void setCreationDate(Date creationDate) {
	this.creationDate = creationDate;
}



}
