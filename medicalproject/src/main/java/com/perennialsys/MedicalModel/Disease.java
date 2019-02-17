package com.perennialsys.MedicalModel;

public class Disease {
	private int id;
	private String  dis_name;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getDis_name() {
		return dis_name;
	}
	public void setDis_name(String dis_name) {
		this.dis_name = dis_name;
	}
	@Override
	public String toString() {
		return "Disease [id=" + id + ", dis_name=" + dis_name + "]";
	}
	
}
