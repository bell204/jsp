package com.kh.tc.product.model.vo;

public class DetailCycle {
	private String pay_time;
	private int p_code;
	private String save_filename;
	private String p_name;
	private int p_price;
	private int p_count;
	private String p_option;
	private int record_status;
	private String howtopay;
	private int pay_price;
	private String sc_name;
	private String bc_name;
	private String bc_code;
	private int record_code;
	
	
	
	
	public int getRecord_code() {
		return record_code;
	}
	public void setRecord_code(int record_code) {
		this.record_code = record_code;
	}
	public String getPay_time() {
		return pay_time;
	}
	public void setPay_time(String pay_time) {
		this.pay_time = pay_time;
	}
	public DetailCycle() {}
	public int getP_code() {
		return p_code;
	}
	public void setP_code(int p_code) {
		this.p_code = p_code;
	}
	public String getSave_filename() {
		return save_filename;
	}
	public void setSave_filename(String save_filename) {
		this.save_filename = save_filename;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public int getP_price() {
		return p_price;
	}
	public void setP_price(int p_price) {
		this.p_price = p_price;
	}
	public int getP_count() {
		return p_count;
	}
	public void setP_count(int p_count) {
		this.p_count = p_count;
	}
	public String getP_option() {
		return p_option;
	}
	public void setP_option(String p_option) {
		this.p_option = p_option;
	}
	public int getRecord_status() {
		return record_status;
	}
	public void setRecord_status(int record_status) {
		this.record_status = record_status;
	}
	public String getHowtopay() {
		return howtopay;
	}
	public void setHowtopay(String howtopay) {
		this.howtopay = howtopay;
	}
	public int getPay_price() {
		return pay_price;
	}
	public void setPay_price(int pay_price) {
		this.pay_price = pay_price;
	}
	public String getSc_name() {
		return sc_name;
	}
	public void setSc_name(String sc_name) {
		this.sc_name = sc_name;
	}
	public String getBc_name() {
		return bc_name;
	}
	public void setBc_name(String bc_name) {
		this.bc_name = bc_name;
	}
	public String getBc_code() {
		return bc_code;
	}
	public void setBc_code(String bc_code) {
		this.bc_code = bc_code;
	}
	@Override
	public String toString() {
		return "DetailCycle [p_code=" + p_code + ", save_filename=" + save_filename + ", p_name=" + p_name
				+ ", p_price=" + p_price + ", p_count=" + p_count + ", p_option=" + p_option + ", record_status="
				+ record_status + ", howtopay=" + howtopay + ", pay_price=" + pay_price + ", sc_name=" + sc_name
				+ ", bc_name=" + bc_name + ", bc_code=" + bc_code + "]";
	}
	public DetailCycle(int p_code, String save_filename, String p_name, int p_price, int p_count, String p_option,
			int record_status, String howtopay, int pay_price, String sc_name, String bc_name, String bc_code) {
		super();
		this.p_code = p_code;
		this.save_filename = save_filename;
		this.p_name = p_name;
		this.p_price = p_price;
		this.p_count = p_count;
		this.p_option = p_option;
		this.record_status = record_status;
		this.howtopay = howtopay;
		this.pay_price = pay_price;
		this.sc_name = sc_name;
		this.bc_name = bc_name;
		this.bc_code = bc_code;
	}
	
	


}
