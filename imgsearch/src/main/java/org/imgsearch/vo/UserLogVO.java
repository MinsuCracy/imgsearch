package org.imgsearch.vo;

import java.util.Date;

public class UserLogVO {
	
	private int l_no;
	private int u_no;
	private String u_id;
	private Date l_logindate;
	private Date l_logoutdate;
	private int cnt;
	public int getL_no() {
		return l_no;
	}
	public void setL_no(int l_no) {
		this.l_no = l_no;
	}
	public int getU_no() {
		return u_no;
	}
	public void setU_no(int u_no) {
		this.u_no = u_no;
	}
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	public Date getL_logindate() {
		return l_logindate;
	}
	public void setL_logindate(Date l_logindate) {
		this.l_logindate = l_logindate;
	}
	public Date getL_logoutdate() {
		return l_logoutdate;
	}
	public void setL_logoutdate(Date l_logoutdate) {
		this.l_logoutdate = l_logoutdate;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	@Override
	public String toString() {
		return "UserLogVO [l_no=" + l_no + ", u_no=" + u_no + ", u_id=" + u_id
				+ ", l_logindate=" + l_logindate + ", l_logoutdate="
				+ l_logoutdate + ", cnt=" + cnt + "]";
	}
	
	
	
}
