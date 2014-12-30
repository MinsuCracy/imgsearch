package org.imgsearch.vo;

public class StoreCVO {

	private int s_no;
	private int c_no;
	private int sc_no;
	private String c_category;
	
	private int c_parent;
	
	
	
	
	
	public int getC_parent() {
		return c_parent;
	}
	public void setC_parent(int c_parent) {
		this.c_parent = c_parent;
	}
	public int getS_no() {
		return s_no;
	}
	public void setS_no(int s_no) {
		this.s_no = s_no;
	}
	public int getC_no() {
		return c_no;
	}
	public void setC_no(int c_no) {
		this.c_no = c_no;
	}
	public String getC_category() {
		return c_category;
	}
	public void setC_category(String c_category) {
		this.c_category = c_category;
	}
	public int getSc_no() {
		return sc_no;
	}
	public void setSc_no(int sc_no) {
		this.sc_no = sc_no;
	}
	@Override
	public String toString() {
		return "StoreCVO [s_no=" + s_no + ", c_no=" + c_no + ", sc_no=" + sc_no
				+ ", c_category=" + c_category + ", c_parent=" + c_parent + "]";
	}
	
	
	
}
