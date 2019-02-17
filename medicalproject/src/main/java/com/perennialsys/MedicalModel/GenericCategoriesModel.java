package com.perennialsys.MedicalModel;

public class GenericCategoriesModel {

	private int genericCategoryId;
	private String description;
	public int getGenericCategoryId() {
		return genericCategoryId;
	}
	public void setGenericCategoryId(int genericCategoryId) {
		this.genericCategoryId = genericCategoryId;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	@Override
	public String toString() {
		return "GenericCategoriesModel [genericCategoryId=" + genericCategoryId + ", description=" + description + "]";
	}
}
