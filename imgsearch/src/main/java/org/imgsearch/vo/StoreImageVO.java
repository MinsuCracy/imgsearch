package org.imgsearch.vo;

public class StoreImageVO {

	private int s_no;
	private int si_no;
	private String si_img;
	
	public int getS_no() {
		return s_no;
	}
	public void setS_no(int s_no) {
		this.s_no = s_no;
	}
	public int getSi_no() {
		return si_no;
	}
	public void setSi_no(int si_no) {
		this.si_no = si_no;
	}
	public String getSi_img() {
		return si_img;
	}
	public void setSi_img(String si_img) {
		this.si_img = si_img;
	}
	@Override
	public String toString() {
		return "StoreIVO [s_no=" + s_no + ", si_no=" + si_no + ", si_img="
				+ si_img + "]";
	}
	
	
	
	
}
