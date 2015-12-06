package com.mymoney.entities;

public class Category {
private int ID;
private String categoryName;
private String categoryDescription;
public int getID() {
	return ID;
}
public void setID(int iD) {
	ID = iD;
}
public String getCategoryName() {
	return categoryName;
}
public void setCategoryName(String categoryName) {
	this.categoryName = categoryName;
}
public String getCategoryDescription() {
	return categoryDescription;
}
public void setCategoryDescription(String categoryDescription) {
	this.categoryDescription = categoryDescription;
}

}
