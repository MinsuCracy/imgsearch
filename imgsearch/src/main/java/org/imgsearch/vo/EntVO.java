package org.imgsearch.vo;

public class EntVO {
	
	private int e_no;
	private String e_name;
	private int e_age;
	private int e_view;
	private int e_kind;
	private int e_intell;
	private int e_face;
	private int e_trouble;
	private int e_rumor;
	private double e_Atype;
	private double e_Btype;
	private double e_Ctype;
	private String e_img;
	
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
	
	public int getE_age() {
		return e_age;
	}
	
	public void setE_age(int e_age) {
		this.e_age = e_age;
	}
	
	public int getE_view() {
		return e_view;
	}
	
	public void setE_view(int e_view) {
		this.e_view = e_view;
	}
	
	public int getE_kind() {
		return e_kind;
	}
	
	public void setE_kind(int e_kind) {
		this.e_kind = e_kind;
	}
	
	public int getE_intell() {
		return e_intell;
	}
	
	public void setE_intell(int e_intell) {
		this.e_intell = e_intell;
	}
	
	public int getE_face() {
		return e_face;
	}
	
	public void setE_face(int e_face) {
		this.e_face = e_face;
	}
	
	public int getE_trouble() {
		return e_trouble;
	}
	
	public void setE_trouble(int e_trouble) {
		this.e_trouble = e_trouble;
	}
	
	public int getE_rumor() {
		return e_rumor;
	}
	
	public void setE_rumor(int e_rumor) {
		this.e_rumor = e_rumor;
	}
	
	public double getE_Atype() {
		return e_Atype;
	}
	
	public void setE_Atype(double e_Atype) {
		this.e_Atype = e_Atype;
	}
	
	public double getE_Btype() {
		return e_Btype;
	}
	
	public void setE_Btype(double e_Btype) {
		this.e_Btype = e_Btype;
	}
	
	public double getE_Ctype() {
		return e_Ctype;
	}
	
	public void setE_Ctype(double e_Ctype) {
		this.e_Ctype = e_Ctype;
	}
	
	public String getE_img() {
		return e_img;
	}
	
	public void setE_img(String e_img) {
		this.e_img = e_img;
	}

	@Override
	public String toString() {
		return "EntVO [e_no=" + e_no + ", e_name=" + e_name + ", e_age="
				+ e_age + ", e_view=" + e_view + ", e_kind=" + e_kind
				+ ", e_intell=" + e_intell + ", e_face=" + e_face
				+ ", e_trouble=" + e_trouble + ", e_rumor=" + e_rumor
				+ ", e_Atype=" + e_Atype + ", e_Btype=" + e_Btype
				+ ", e_Ctype=" + e_Ctype + ", e_img=" + e_img + "]";
	}
	
}
