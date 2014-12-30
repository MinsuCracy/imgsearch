package org.imgsearch.common;

public class Criteria {

	private String type = "default";
	private String keyword = "";

	
	// 가게번호
	private int s_no;	
	// 유저번호
	private int u_no;
	// 연예인번호
	private int e_no;
	
	private int page;

	private int dbLimit;
	private int dbLimitTotal;

	private int totalPage;
	
	private int startPage;
	private int lastPage;

	private boolean prePage;
	private boolean nextPage;
	
	

	public int getS_no() {
		return s_no;
	}

	public void setS_no(int s_no) {
		this.s_no = s_no;
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

	public Criteria() {
		setPage(1);
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
		setDbLimit(page);
		setStartPage(page);
	}

	public int getDbLimit() {
		return dbLimit;
	}

	public void setDbLimit(int page) {
		this.dbLimit = (page - 1) * 10;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
		setLastPage(totalPage);
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int page) {
		this.startPage = (int) ((Math.floor(page / 10.000001)) * 10 + 1);
		setPrePage();
		setDbLimitTotal();
	}

	public int getLastPage() {
		return lastPage;
	}

	public void setLastPage(int totalPage) {
		this.lastPage = (int) (Math.ceil((totalPage - 1) / 10.0000001))
				+ (int) ((Math.floor(startPage / 10.0000001))) * 10;
		setNextPage(totalPage);
	}

	public boolean isPrePage() {
		return prePage;
	}

	public void setPrePage() {
		if (startPage > 10) {
			this.prePage = true;
		} else {
			this.prePage = false;
		}
	}

	public boolean isNextPage() {
		return nextPage;
	}

	public void setNextPage(int totalPage) {
		if (totalPage == 101) {
			this.nextPage = true;
		} else {
			this.nextPage = false;
		}
	}

	public int getDbLimitTotal() {
		return dbLimitTotal;
	}

	public void setDbLimitTotal() {
		this.dbLimitTotal = (getStartPage() - 1) * 10;

	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	@Override
	public String toString() {
		return "Criteria [page=" + page + ", DbLimit=" + dbLimit
				+ ", DbLimitTotal=" + dbLimitTotal + ", totalPage=" + totalPage
				+ ", startPage=" + startPage + ", lastPage=" + lastPage
				+ ", prePage=" + prePage + ", nextPage=" + nextPage + "]";
	}

}