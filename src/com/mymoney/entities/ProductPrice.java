package com.mymoney.entities;

public class ProductPrice {
private int id;
private int productID;
private int locationID;
private int transactionID;
private float price;
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public int getProductID() {
	return productID;
}
public void setProductID(int productID) {
	this.productID = productID;
}
public int getLocationID() {
	return locationID;
}
public void setLocationID(int locationID) {
	this.locationID = locationID;
}
public int getTransactionID() {
	return transactionID;
}
public void setTransactionID(int transactionID) {
	this.transactionID = transactionID;
}
public float getPrice() {
	return price;
}
public void setPrice(float price) {
	this.price = price;
}

}
