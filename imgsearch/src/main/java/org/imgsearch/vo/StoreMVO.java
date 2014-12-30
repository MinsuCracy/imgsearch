package org.imgsearch.vo;

public class StoreMVO {

	
	private int s_no;
	private int sm_no;
	private String sm_menu;
	private String sm_price;
	public int getS_no() {
		return s_no;
	}
	public void setS_no(int s_no) {
		this.s_no = s_no;
	}
	public int getSm_no() {
		return sm_no;
	}
	public void setSm_no(int sm_no) {
		this.sm_no = sm_no;
	}
	public String getSm_menu() {
		return sm_menu;
	}
	public void setSm_menu(String sm_menu) {
		this.sm_menu = sm_menu;
	}
	public String getSm_price() {
		return sm_price;
	}
	public void setSm_price(String sm_price) {
		this.sm_price = sm_price;
	}
	@Override
	public String toString() {
		return "StoreMVO [s_no=" + s_no + ", sm_no=" + sm_no + ", sm_menu="
				+ sm_menu + ", sm_price=" + sm_price + "]";
	}
	
	
	
	
}
