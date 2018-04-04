package com.kh.tc.product.model.vo;

public class IncomeStory {
	private int requestPrice;
	private String requestDate;
	private String requestOk;
	private int requestStatus;
	private int currentPage;
	
	
	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public IncomeStory() {}

	public int getRequestPrice() {
		return requestPrice;
	}

	public void setRequestPrice(int requestPrice) {
		this.requestPrice = requestPrice;
	}

	public String getRequestDate() {
		return requestDate;
	}

	public void setRequestDate(String requestDate) {
		this.requestDate = requestDate;
	}

	public String getRequestOk() {
		return requestOk;
	}

	public void setRequestOk(String requestOk) {
		this.requestOk = requestOk;
	}

	public int getRequestStatus() {
		return requestStatus;
	}

	public void setRequestStatus(int requestStatus) {
		this.requestStatus = requestStatus;
	}

	@Override
	public String toString() {
		return "IncomeStory [requestPrice=" + requestPrice + ", requestDate=" + requestDate + ", requestOk=" + requestOk
				+ ", requestStatus=" + requestStatus + "]";
	}

	public IncomeStory(int requestPrice, String requestDate, String requestOk, int requestStatus) {
		super();
		this.requestPrice = requestPrice;
		this.requestDate = requestDate;
		this.requestOk = requestOk;
		this.requestStatus = requestStatus;
	}
	
	
	

}
