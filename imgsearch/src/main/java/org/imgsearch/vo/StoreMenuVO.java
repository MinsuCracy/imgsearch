package org.imgsearch.vo;

public class StoreMenuVO {

	private int sm_no;
	private int s_no;
	private String sm_menu;
	private int sm_price;
	
	public int getSm_no() {
		return sm_no;
	}
	
	public void setSm_no(int sm_no) {
		this.sm_no = sm_no;
	}
	
	public int getS_no() {
		return s_no;
	}
	
	public void setS_no(int s_no) {
		this.s_no = s_no;
	}
	
	public String getSm_menu() {
		return sm_menu;
	}
	
	public void setSm_menu(String sm_menu) {
		this.sm_menu = sm_menu;
	}
	
	public int getSm_price() {
		return sm_price;
	}
	
	public void setSm_price(int sm_price) {
		this.sm_price = sm_price;
	}
	
	@Override
	public String toString() {
		return "StoreMenuVO [sm_no=" + sm_no + ", s_no=" + s_no + ", sm_menu="
				+ sm_menu + ", sm_price=" + sm_price + "]";
	}

}
