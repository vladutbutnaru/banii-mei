package com.mymoney.entities;

public class Location {
private int ID;
private String locationName;
private String locationDescription;
private String locationCity;
public int getID() {
	return ID;
}
public void setID(int iD) {
	ID = iD;
}
public String getLocationName() {
	return locationName;
}
public void setLocationName(String locationName) {
	this.locationName = locationName;
}
public String getLocationDescription() {
	return locationDescription;
}
public void setLocationDescription(String locationDescription) {
	this.locationDescription = locationDescription;
}
public String getLocationCity() {
	return locationCity;
}
public void setLocationCity(String locationCity) {
	this.locationCity = locationCity;
}

}
