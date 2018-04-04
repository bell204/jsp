package com.kh.tc.product.model.vo;

public class Income {
	private int sumsell;
	private int sumprice;
	private int outtax;
	private int mycash;
	private int outcash;
	private int sumincome;
	private int requestout;
	
	
	
	public int getRequestout() {
		return requestout;
	}

	public void setRequestout(int requestout) {
		this.requestout = requestout;
	}

	public Income() {}

	public int getSumsell() {
		return sumsell;
	}

	public void setSumsell(int sumsell) {
		this.sumsell = sumsell;
	}

	public int getSumprice() {
		return sumprice;
	}

	public void setSumprice(int sumprice) {
		this.sumprice = sumprice;
	}

	public int getOuttax() {
		return outtax;
	}

	public void setOuttax(int outtax) {
		this.outtax = outtax;
	}

	public int getMycash() {
		return mycash;
	}

	public void setMycash(int mycash) {
		this.mycash = mycash;
	}

	public int getOutcash() {
		return outcash;
	}

	public void setOutcash(int outcash) {
		this.outcash = outcash;
	}

	public int getSumincome() {
		return sumincome;
	}

	public void setSumincome(int sumincome) {
		this.sumincome = sumincome;
	}

	public Income(int sumsell, int sumprice, int outtax, int mycash, int outcash, int sumincome) {
		super();
		this.sumsell = sumsell;
		this.sumprice = sumprice;
		this.outtax = outtax;
		this.mycash = mycash;
		this.outcash = outcash;
		this.sumincome = sumincome;
	}

	@Override
	public String toString() {
		return "Income [sumsell=" + sumsell + ", sumprice=" + sumprice + ", outtax=" + outtax + ", mycash=" + mycash
				+ ", outcash=" + outcash + ", sumincome=" + sumincome + "]";
	}
	
	
	
	

}
