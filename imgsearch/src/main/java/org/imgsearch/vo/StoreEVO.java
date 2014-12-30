package org.imgsearch.vo;

public class StoreEVO {

	private int s_no;
	private int se_no;
	private int e_no;
	private String e_name;
	private String e_img;
	public int getS_no() {
		return s_no;
	}
	public void setS_no(int s_no) {
		this.s_no = s_no;
	}
	public int getSe_no() {
		return se_no;
	}
	public void setSe_no(int se_no) {
		this.se_no = se_no;
	}
	public int getE_no() {
		return e_no;
	}
	public void setE_no(int e_no) {
		this.e_no = e_no;
	}
	public String getE_name() {
		return e_name;
	}
	public void setE_name(String e_name) {
		this.e_name = e_name;
	}
	public String getE_img() {
		return e_img;
	}
	public void setE_img(String e_img) {
		this.e_img = e_img;
	}
	@Override
	public String toString() {
		return "StoreEVO [s_no=" + s_no + ", se_no=" + se_no + ", e_no=" + e_no
				+ ", e_name=" + e_name + ", e_img=" + e_img + "]";
	}
	
	
}
