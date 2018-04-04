package com.kh.tc.product.model.vo;

import java.sql.Date;

public class Pay {
	
	private int pay_code;
	private String ac_code;
	private String c_code;
	
	private int pay_price;
	private String howtopay;
	private int from_code;

	private Date pay_time;
	private int p_code;
	private String p_name;
	private int p_count;
	private int p_count2;
	private int p_count3;
	private String p_option;
	private int total_price;
	 

	public Pay(int total_price, String p_option, int pay_code, String ac_code, String c_code, int pay_price, String howtopay, int from_code,
			Date pay_time, int p_code, String p_name, int p_count, int p_count2, int p_count3) {
		super();
		this.p_option=p_option;
		this.pay_code = pay_code;
		this.ac_code = ac_code;
		this.c_code = c_code;
		this.pay_price = pay_price;
		this.howtopay = howtopay;
		this.from_code = from_code;
		this.pay_time = pay_time;
		this.p_code = p_code;
		this.p_name = p_name;
		this.p_count = p_count;
		this.p_count2 = p_count2;
		this.p_count3 = p_count3;
		
		//주석
		this.setTotal_price(total_price);
	}

	public Pay() {
	}
	
	public String getP_option() {
		return p_option;
	}

	public void setP_option(String p_option) {
		this.p_option = p_option;
	}
	
	public int getP_count2() {
		return p_count2;
	}

	public void setP_count2(int p_count2) {
		this.p_count2 = p_count2;
	}

	public int getP_count3() {
		return p_count3;
	}

	public void setP_count3(int p_count3) {
		this.p_count3 = p_count3;
	}
	

	public int getPay_code() {
		return pay_code;
	}
	public void setPay_code(int pay_code) {
		this.pay_code = pay_code;
	}
	public String getAc_code() {
		return ac_code;
	}
	public void setAc_code(String ac_code) {
		this.ac_code = ac_code;
	}
	public String getC_code() {
		return c_code;
	}
	public void setC_code(String c_code) {
		this.c_code = c_code;
	}
	public int getPay_price() {
		return pay_price;
	}
	public void setPay_price(int pay_price) {
		this.pay_price = pay_price;
	}
	public String getHowtopay() {
		return howtopay;
	}
	public void setHowtopay(String howtopay) {
		this.howtopay = howtopay;
	}
	public int getFrom_code() {
		return from_code;
	}
	public void setFrom_code(int from_code) {
		this.from_code = from_code;
	}
	public Date getPay_time() {
		return pay_time;
	}
	public void setPay_time(Date pay_time) {
		this.pay_time = pay_time;
	}
	public int getP_code() {
		return p_code;
	}
	public void setP_code(int p_code) {
		this.p_code = p_code;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public int getP_count() {
		return p_count;
	}
	
	public void setP_count(int p_count) {
		this.p_count = p_count;
	}

	public int getTotal_price() {
		return total_price;
	}

	public void setTotal_price(int total_price) {
		this.total_price = total_price;
	}
	
	
}
