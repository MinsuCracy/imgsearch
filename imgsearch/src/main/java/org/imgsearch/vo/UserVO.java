package org.imgsearch.vo;

public class UserVO {
	
	private int u_no;
	private String u_id;
	private String u_pw;
	private String u_email;
	private int u_age;
	private String u_gender;
	private String u_job;
	
	
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
	public String getU_pw() {
		return u_pw;
	}
	public void setU_pw(String u_pw) {
		this.u_pw = u_pw;
	}
	public String getU_email() {
		return u_email;
	}
	public void setU_email(String u_email) {
		this.u_email = u_email;
	}
	public int getU_age() {
		return u_age;
	}
	public void setU_age(int u_age) {
		this.u_age = u_age;
	}
	public String getU_gender() {
		return u_gender;
	}
	public void setU_gender(String u_gender) {
		this.u_gender = u_gender;
	}
	public String getU_job() {
		return u_job;
	}
	public void setU_job(String u_job) {
		this.u_job = u_job;
	}
	@Override
	public String toString() {
		return "UserVO [u_no=" + u_no + ", u_id=" + u_id + ", u_pw=" + u_pw
				+ ", u_email=" + u_email + ", u_age=" + u_age + ", u_gender="
				+ u_gender + ", u_job=" + u_job + "]";
	}
	
	
	
	

}
