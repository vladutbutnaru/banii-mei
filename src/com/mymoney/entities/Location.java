package com.mymoney.entities;

public class Location {
	
	private int ID;
	private String locationName;
	private String locationDescription;
	private int locationCity;
	private int locationCountry;
	private String locationLat;
	private String locationLong;
	private int deleted;

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

	public int getLocationCity() {
		return locationCity;
	}

	public void setLocationCity(int locationCity) {
		this.locationCity = locationCity;
	}

	public int getLocationCountry() {
		return locationCountry;
	}

	public void setLocationCountry(int locationCountry) {
		this.locationCountry = locationCountry;
	}

	public String getLocationLat() {
		return locationLat;
	}

	public void setLocationLat(String locationLat) {
		this.locationLat = locationLat;
	}

	public String getLocationLong() {
		return locationLong;
	}

	public void setLocationLong(String locationLong) {
		this.locationLong = locationLong;
	}

	public int getDeleted() {
		return deleted;
	}

	public void setDeleted(int deleted) {
		this.deleted = deleted;
	}

}
