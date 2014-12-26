package org.imgsearch.vo;

public class StoreVO {
	
	private int s_no;
	private String s_name;
	private String s_homepage;
	private double s_lat;
	private double s_lng;
	private String s_address;
	
	public int getS_no() {
		return s_no;
	}
	
	public void setS_no(int s_no) {
		this.s_no = s_no;
	}
	
	public String getS_name() {
		return s_name;
	}
	
	public void setS_name(String s_name) {
		this.s_name = s_name;
	}
	
	public String getS_homepage() {
		return s_homepage;
	}
	
	public void setS_homepage(String s_homepage) {
		this.s_homepage = s_homepage;
	}
	
	public double getS_lat() {
		return s_lat;
	}
	
	public void setS_lat(double s_lat) {
		this.s_lat = s_lat;
	}
	
	public double getS_lng() {
		return s_lng;
	}
	
	public void setS_lng(double s_lng) {
		this.s_lng = s_lng;
	}
	
	public String getS_address() {
		return s_address;
	}
	
	public void setS_address(String s_address) {
		this.s_address = s_address;
	}

	@Override
	public String toString() {
		return "StoreVO [s_no=" + s_no + ", s_name=" + s_name + ", s_homepage="
				+ s_homepage + ", s_lat=" + s_lat + ", s_lng=" + s_lng
				+ ", s_address=" + s_address + "]";
	}

}
