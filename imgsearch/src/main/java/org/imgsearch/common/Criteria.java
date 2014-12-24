package org.imgsearch.common;

public class Criteria {

	private String type = "";
	private String keyword = "";

	// 현재 페이지
	private int page;

	// db의 limit 페이지 중 10단위 // 리스트 뷰
	private int dbLimit;
	// db의 limit 페이지 중 100단위 // 페이징 뷰
	private int dbLimitTotal;

	// 디비로부터 받은 DbLimitTotal 값
	private int totalPage; // 페이징

	// jsp로 보내줄 페이지
	private int startPage;
	private int lastPage;

	// jsp로 보내줄 페이지
	private boolean prePage;
	private boolean nextPage;

	// 페이지의 파라미터가 없을때 1페이지로 고정
	public Criteria() {
		setPage(1);
	}

	public int getPage() {
		return page;
	}

	// 페이지의 파라미터를 받고 db로 보낼 limit값을 설정
	public void setPage(int page) {
		this.page = page;
		setDbLimit(page);
		setStartPage(page);
	}

	public int getDbLimit() {
		return dbLimit;
	}

	// db로부터 몇페이지의 데이터를 받을지 설정 현재페이지가 1일때 db에게 0을 전달
	public void setDbLimit(int page) {
		this.dbLimit = (page - 1) * 10;
	}

	public int getTotalPage() {
		return totalPage;
	}

	// 디비에게 요청한 101개의 데이터중 리턴받은 데이터의 수
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
		setLastPage(totalPage);
	}

	public int getStartPage() {
		return startPage;
	}

	// 현재 페이지 기준으로 시작페이지를 설정
	public void setStartPage(int page) {
		this.startPage = (int) ((Math.floor(page / 10.000001)) * 10 + 1);
		setPrePage();
		setDbLimitTotal();
	}

	public int getLastPage() {
		return lastPage;
	}

	// setTotalPage을 기준으로 마지막페이지 설정
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