package com.kh.tc.product.model.vo;

public class Dealrecord {
	
	private int totalprice;
	private int sumsell;
	private int sumsell1;
	private int sumsell2;
	private int sumsell3;
	private int sumsell4;
	private int sumsell5;
	private int sumbuy;
	private int sumbuy1;
	private int sumbuy2;
	private int sumbuy3;
	private int sumbuy4;
	private int sumbuy5;
	
	private int buycancel;
	private int sellcancel;
	
	
	
	public int getBuycancel() {
		return buycancel;
	}
	public void setBuycancel(int buycancel) {
		this.buycancel = buycancel;
	}
	public int getSellcancel() {
		return sellcancel;
	}
	public void setSellcancel(int sellcancel) {
		this.sellcancel = sellcancel;
	}
	public Dealrecord() {}
	public int getTotalprice() {
		return totalprice;
	}
	public void setTotalprice(int totalprice) {
		this.totalprice = totalprice;
	}
	public int getSumsell() {
		return sumsell;
	}
	public void setSumsell(int sumsell) {
		this.sumsell = sumsell;
	}
	public int getSumsell1() {
		return sumsell1;
	}
	public void setSumsell1(int sumsell1) {
		this.sumsell1 = sumsell1;
	}
	public int getSumsell2() {
		return sumsell2;
	}
	public void setSumsell2(int sumsell2) {
		this.sumsell2 = sumsell2;
	}
	public int getSumsell3() {
		return sumsell3;
	}
	public void setSumsell3(int sumsell3) {
		this.sumsell3 = sumsell3;
	}
	public int getSumsell4() {
		return sumsell4;
	}
	public void setSumsell4(int sumsell4) {
		this.sumsell4 = sumsell4;
	}
	public int getSumsell5() {
		return sumsell5;
	}
	public void setSumsell5(int sumsell5) {
		this.sumsell5 = sumsell5;
	}
	public int getSumbuy() {
		return sumbuy;
	}
	public void setSumbuy(int sumbuy) {
		this.sumbuy = sumbuy;
	}
	public int getSumbuy1() {
		return sumbuy1;
	}
	public void setSumbuy1(int sumbuy1) {
		this.sumbuy1 = sumbuy1;
	}
	public int getSumbuy2() {
		return sumbuy2;
	}
	public void setSumbuy2(int sumbuy2) {
		this.sumbuy2 = sumbuy2;
	}
	public int getSumbuy3() {
		return sumbuy3;
	}
	public void setSumbuy3(int sumbuy3) {
		this.sumbuy3 = sumbuy3;
	}
	public int getSumbuy4() {
		return sumbuy4;
	}
	public void setSumbuy4(int sumbuy4) {
		this.sumbuy4 = sumbuy4;
	}
	public int getSumbuy5() {
		return sumbuy5;
	}
	public void setSumbuy5(int sumbuy5) {
		this.sumbuy5 = sumbuy5;
	}
	@Override
	public String toString() {
		return "Dealrecord [totalprice=" + totalprice + ", sumsell=" + sumsell + ", sumsell1=" + sumsell1
				+ ", sumsell2=" + sumsell2 + ", sumsell3=" + sumsell3 + ", sumsell4=" + sumsell4 + ", sumsell5="
				+ sumsell5 + ", sumbuy=" + sumbuy + ", sumbuy1=" + sumbuy1 + ", sumbuy2=" + sumbuy2 + ", sumbuy3="
				+ sumbuy3 + ", sumbuy4=" + sumbuy4 + ", sumbuy5=" + sumbuy5 + "]";
	}
	public Dealrecord(int totalprice, int sumsell, int sumsell1, int sumsell2, int sumsell3, int sumsell4, int sumsell5,
			int sumbuy, int sumbuy1, int sumbuy2, int sumbuy3, int sumbuy4, int sumbuy5) {
		super();
		this.totalprice = totalprice;
		this.sumsell = sumsell;
		this.sumsell1 = sumsell1;
		this.sumsell2 = sumsell2;
		this.sumsell3 = sumsell3;
		this.sumsell4 = sumsell4;
		this.sumsell5 = sumsell5;
		this.sumbuy = sumbuy;
		this.sumbuy1 = sumbuy1;
		this.sumbuy2 = sumbuy2;
		this.sumbuy3 = sumbuy3;
		this.sumbuy4 = sumbuy4;
		this.sumbuy5 = sumbuy5;
	}
	
	

	
}
