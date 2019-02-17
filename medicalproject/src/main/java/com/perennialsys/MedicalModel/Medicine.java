package com.perennialsys.MedicalModel;

public class Medicine {
	private int medicine_id;
	private String name;
	private String composition;
	
	public int getMedicine_id() {
		return medicine_id;
	}
	public void setMedicine_id(int medicine_id) {
		this.medicine_id = medicine_id;
	}
	private int genericsCategoryId;

	public String getComposition() {
		return composition;
	}
	public void setComposition(String composition) {
		this.composition = composition;
	}
	public int getGenericsCategoryId() {
		return genericsCategoryId;
	}
	public void setGenericsCategoryId(int genericsCategoryId) {
		this.genericsCategoryId = genericsCategoryId;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@Override
	public String toString() {
		return "Medicine [medicine_id=" + medicine_id + ", name=" + name + ", composition=" + composition
				+ ", genericsCategoryId=" + genericsCategoryId + "]";
	}


}
