package org.imgsearch.vo;

public class KeywordVO {
	
	private int k_no;
	private String k_keyword;
	
	public int getK_no() {
		return k_no;
	}
	public void setK_no(int k_no) {
		this.k_no = k_no;
	}
	public String getK_keyword() {
		return k_keyword;
	}
	public void setK_keyword(String k_keyword) {
		this.k_keyword = k_keyword;
	}
	@Override
	public String toString() {
		return "KeywordVO [k_no=" + k_no + ", k_keyword=" + k_keyword + "]";
	} 
	
}
