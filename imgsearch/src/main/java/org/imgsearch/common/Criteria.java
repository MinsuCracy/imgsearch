package org.imgsearch.common;

public class Criteria {

	private String type = "";
	private String keyword = "";

	// ���� ������
	private int page;

	// db�� limit ������ �� 10���� // ����Ʈ ��
	private int dbLimit;
	// db�� limit ������ �� 100���� // ����¡ ��
	private int dbLimitTotal;

	// ���κ��� ���� DbLimitTotal ��
	private int totalPage; // ����¡

	// jsp�� ������ ������
	private int startPage;
	private int lastPage;

	// jsp�� ������ ������
	private boolean prePage;
	private boolean nextPage;

	// �������� �Ķ���Ͱ� ������ 1�������� ����
	public Criteria() {
		setPage(1);
	}

	public int getPage() {
		return page;
	}

	// �������� �Ķ���͸� �ް� db�� ���� limit���� ����
	public void setPage(int page) {
		this.page = page;
		setDbLimit(page);
		setStartPage(page);
	}

	public int getDbLimit() {
		return dbLimit;
	}

	// db�κ��� ���������� �����͸� ������ ���� ������������ 1�϶� db���� 0�� ����
	public void setDbLimit(int page) {
		this.dbLimit = (page - 1) * 10;
	}

	public int getTotalPage() {
		return totalPage;
	}

	// ��񿡰� ��û�� 101���� �������� ���Ϲ��� �������� ��
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
		setLastPage(totalPage);
	}

	public int getStartPage() {
		return startPage;
	}

	// ���� ������ �������� ������������ ����
	public void setStartPage(int page) {
		this.startPage = (int) ((Math.floor(page / 10.000001)) * 10 + 1);
		setPrePage();
		setDbLimitTotal();
	}

	public int getLastPage() {
		return lastPage;
	}

	// setTotalPage�� �������� ������������ ����
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