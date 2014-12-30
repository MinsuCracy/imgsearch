package org.imgsearch.vo;

import java.sql.Date;

public class StoreReviewVO {

	private int s_no;
	private int r_no;
	private String u_id;
	private String r_comment;
	private Date r_regdate;
	private int r_score;
	
	
	public int getR_score() {
		return r_score;
	}
	public void setR_score(int r_score) {
		this.r_score = r_score;
	}
	public int getS_no() {
		return s_no;
	}
	public void setS_no(int s_no) {
		this.s_no = s_no;
	}
	public int getR_no() {
		return r_no;
	}
	public void setR_no(int r_no) {
		this.r_no = r_no;
	}
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	public String getR_comment() {
		return r_comment;
	}
	public void setR_comment(String r_comment) {
		this.r_comment = r_comment;
	}
	public Date getR_regdate() {
		return r_regdate;
	}
	public void setR_regdate(Date r_regdate) {
		this.r_regdate = r_regdate;
	}
	@Override
	public String toString() {
		return "StoreRVVO [s_no=" + s_no + ", r_no=" + r_no + ", u_id=" + u_id
				+ ", r_comment=" + r_comment + ", r_regdate=" + r_regdate
				+ ", r_score=" + r_score + "]";
	}
	
	
	
	
	
}
