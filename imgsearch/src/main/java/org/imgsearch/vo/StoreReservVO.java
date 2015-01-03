package org.imgsearch.vo;

import java.sql.Date;

public class StoreReservVO {
	
	private int sr_no;
	private int s_no;
	private int u_no;
	private String u_id;
	private String sr_nick;
	private String sr_person;
	private Date sr_date;
	private String sr_state;
	
	public int getS_no() {
		return s_no;
	}
	
	public void setS_no(int s_no) {
		this.s_no = s_no;
	}
	
	public int getSr_no() {
		return sr_no;
	}
	
	public void setSr_no(int sr_no) {
		this.sr_no = sr_no;
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
	
	public String getSr_nick() {
		return sr_nick;
	}
	
	public void setSr_nick(String sr_nick) {
		this.sr_nick = sr_nick;
	}
	
	public String getSr_person() {
		return sr_person;
	}
	
	public void setSr_person(String sr_person) {
		this.sr_person = sr_person;
	}
	
	public Date getSr_date() {
		return sr_date;
	}
	
	public void setSr_date(Date sr_date) {
		this.sr_date = sr_date;
	}
	
	public String getSr_state() {
		return sr_state;
	}
	
	public void setSr_state(String sr_state) {
		this.sr_state = sr_state;
	}
	
	@Override
	public String toString() {
		return "StoreRVO [s_no=" + s_no + ", sr_no=" + sr_no + ", u_no=" + u_no
				+ ", u_id=" + u_id + ", sr_nick=" + sr_nick + ", sr_person="
				+ sr_person + ", sr_date=" + sr_date + ", sr_state=" + sr_state
				+ "]";
	}
	
}
