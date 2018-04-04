package com.kh.tc.pay.model.vo;

public class Pay {
	private int pay_code;
	private String ac_code;
	private String c_code;
	private int pay_price;
	private String howToPay;
	private int from_code;
	private String pay_time;
	private String p_code;


	public Pay(){}


	public Pay(int pay_code, String ac_code, String c_code, int pay_price, String howToPay, int from_code,
			String pay_time, String p_code) {
		super();
		this.pay_code = pay_code;
		this.ac_code = ac_code;
		this.c_code = c_code;
		this.pay_price = pay_price;
		this.howToPay = howToPay;
		this.from_code = from_code;
		this.pay_time = pay_time;
		this.p_code = p_code;
	}


	public int getPay_code() {
		return pay_code;
	}


	public String getAc_code() {
		return ac_code;
	}


	public String getC_code() {
		return c_code;
	}


	public int getPay_price() {
		return pay_price;
	}


	public String getHowToPay() {
		return howToPay;
	}


	public int getFrom_code() {
		return from_code;
	}


	public String getPay_time() {
		return pay_time;
	}


	public String getP_code() {
		return p_code;
	}


	public void setPay_code(int pay_code) {
		this.pay_code = pay_code;
	}


	public void setAc_code(String ac_code) {
		this.ac_code = ac_code;
	}


	public void setC_code(String c_code) {
		this.c_code = c_code;
	}


	public void setPay_price(int pay_price) {
		this.pay_price = pay_price;
	}


	public void setHowToPay(String howToPay) {
		this.howToPay = howToPay;
	}


	public void setFrom_code(int from_code) {
		this.from_code = from_code;
	}


	public void setPay_time(String pay_time) {
		this.pay_time = pay_time;
	}


	public void setP_code(String p_code) {
		this.p_code = p_code;
	}


	@Override
	public String toString() {
		return "Pay [pay_code=" + pay_code + ", ac_code=" + ac_code + ", c_code=" + c_code + ", pay_price=" + pay_price
				+ ", howToPay=" + howToPay + ", from_code=" + from_code + ", pay_time=" + pay_time + ", p_code="
				+ p_code + "]";
	}
	
}
