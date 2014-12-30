package org.imgsearch.vo;

public class StoreKVO {

	private int s_no;
	private int k_no;
	private int sk_no;
	private String k_keyword;
	public int getS_no() {
		return s_no;
	}
	public void setS_no(int s_no) {
		this.s_no = s_no;
	}
	public int getK_no() {
		return k_no;
	}
	public void setK_no(int k_no) {
		this.k_no = k_no;
	}
	
	public int getSk_no() {
		return sk_no;
	}
	public void setSk_no(int sk_no) {
		this.sk_no = sk_no;
	}
	public String getK_keyword() {
		return k_keyword;
	}
	public void setK_keyword(String k_keyword) {
		this.k_keyword = k_keyword;
	}
	@Override
	public String toString() {
		return "StoreKVO [s_no=" + s_no + ", k_no=" + k_no + ", sk_no=" + sk_no
				+ ", k_keyword=" + k_keyword + "]";
	}
	
	
	
	
	
	
}
