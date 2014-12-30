package org.imgsearch.vo;

import java.util.Date;

public class SearchLogVO {
	
	private int sl_no;
	private int u_no;
	private int e_no;
	private String e_name;
	private Date sl_searchdate;
	private String sl_keyword;
	private int cnt;
	
	
	public int getSl_no() {
		return sl_no;
	}
	public void setSl_no(int sl_no) {
		this.sl_no = sl_no;
	}
	public int getU_no() {
		return u_no;
	}
	public void setU_no(int u_no) {
		this.u_no = u_no;
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
	public Date getSl_searchdate() {
		return sl_searchdate;
	}
	public void setSl_searchdate(Date sl_searchdate) {
		this.sl_searchdate = sl_searchdate;
	}
	public String getSl_keyword() {
		return sl_keyword;
	}
	public void setSl_keyword(String sl_keyword) {
		this.sl_keyword = sl_keyword;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	@Override
	public String toString() {
		return "SearchLogVO [sl_no=" + sl_no + ", u_no=" + u_no + ", e_no="
				+ e_no + ", e_name=" + e_name + ", sl_searchdate="
				+ sl_searchdate + ", sl_keyword=" + sl_keyword + ", cnt=" + cnt
				+ "]";
	}
	
	
	
	
	

}
