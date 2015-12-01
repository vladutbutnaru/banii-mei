package com.mymoney.entities;

import java.util.Date;

public class Transaction {
private int ID;
private String transactionName;
private String transactionDescription;
private double amount;
private int transactionType;
private int accountID;
private int productID;
private int isRecurrent;
private String currency;
private Date transactionTime;
private int deleted;
public int getID() {
	return ID;
}
public void setID(int iD) {
	ID = iD;
}
public String getTransactionName() {
	return transactionName;
}
public void setTransactionName(String transactionName) {
	this.transactionName = transactionName;
}
public String getTransactionDescription() {
	return transactionDescription;
}
public void setTransactionDescription(String transactionDescription) {
	this.transactionDescription = transactionDescription;
}
public double getAmount() {
	return amount;
}
public void setAmount(double amount) {
	this.amount = amount;
}
public int getTransactionType() {
	return transactionType;
}
public void setTransactionType(int transactionType) {
	this.transactionType = transactionType;
}
public int getAccountID() {
	return accountID;
}
public void setAccountID(int accountID) {
	this.accountID = accountID;
}
public int getProductID() {
	return productID;
}
public void setProductID(int productID) {
	this.productID = productID;
}
public int getIsRecurrent() {
	return isRecurrent;
}
public void setIsRecurrent(int isRecurrent) {
	this.isRecurrent = isRecurrent;
}
public String getCurrency() {
	return currency;
}
public void setCurrency(String currency) {
	this.currency = currency;
}
public Date getTransactionTime() {
	return transactionTime;
}
public void setTransactionTime(Date transactionTime) {
	this.transactionTime = transactionTime;
}
public int getDeleted() {
	return deleted;
}
public void setDeleted(int deleted) {
	this.deleted = deleted;
}

}
