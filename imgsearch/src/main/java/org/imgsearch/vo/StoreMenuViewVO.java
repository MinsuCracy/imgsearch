package org.imgsearch.vo;

public class StoreMenuViewVO {

	private int sv_no;
	private int s_no;
	private int u_no;
	
	public int getS_no() {
		return s_no;
	}
	
	public void setS_no(int s_no) {
		this.s_no = s_no;
	}
	
	public int getSv_no() {
		return sv_no;
	}
	
	public void setSv_no(int sv_no) {
		this.sv_no = sv_no;
	}
	
	public int getU_no() {
		return u_no;
	}
	
	public void setU_no(int u_no) {
		this.u_no = u_no;
	}
	
	@Override
	public String toString() {
		return "StoreMVVO [s_no=" + s_no + ", sv_no=" + sv_no + ", u_no="
				+ u_no + "]";
	}
	
}
