package com.kh.tc.product.model.vo;

public class Advertise {
	private int p_code;
	private String ad_time;
	private int ad_price;
	private String p_name;
	private int odongcash;
	private int total_price;
	private int ad_code;
	private String ac_code;
	
	
	
	public String getAc_code() {
		return ac_code;
	}
	public void setAc_code(String ac_code) {
		this.ac_code = ac_code;
	}
	public Advertise() {}
	public int getP_code() {
		return p_code;
	}
	public void setP_code(int p_code) {
		this.p_code = p_code;
	}
	public String getAd_time() {
		return ad_time;
	}
	public void setAd_time(String ad_time) {
		this.ad_time = ad_time;
	}
	public int getAd_price() {
		return ad_price;
	}
	public void setAd_price(int ad_price) {
		this.ad_price = ad_price;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public int getOdongcash() {
		return odongcash;
	}
	public void setOdongcash(int odongcash) {
		this.odongcash = odongcash;
	}
	public int getTotal_price() {
		return total_price;
	}
	public void setTotal_price(int total_price) {
		this.total_price = total_price;
	}
	public int getAd_code() {
		return ad_code;
	}
	public void setAd_code(int ad_code) {
		this.ad_code = ad_code;
	}
	public Advertise(int p_code, String ad_time, int ad_price, String p_name, int odongcash, int total_price,
			int ad_code) {
		super();
		this.p_code = p_code;
		this.ad_time = ad_time;
		this.ad_price = ad_price;
		this.p_name = p_name;
		this.odongcash = odongcash;
		this.total_price = total_price;
		this.ad_code = ad_code;
	}
	@Override
	public String toString() {
		return "Advertise [p_code=" + p_code + ", ad_time=" + ad_time + ", ad_price=" + ad_price + ", p_name=" + p_name
				+ ", odongcash=" + odongcash + ", total_price=" + total_price + ", ad_code=" + ad_code + "]";
	}
	
	
	

}
