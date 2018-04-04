package com.kh.tc.customer.model.vo;

import java.sql.Date;

public class Customer implements java.io.Serializable {
	private String c_code;
	private String c_id;
	private String c_pwd;
	private String c_email;
	private String c_phone;
	private String c_accout;
	private Date join_date;
	private String end_yn;
	private String certi_name;
	private String token;
	private String logintype;
	private String c_name;
	private String c_type;
	private String mail_alarm;
	private String sms_alarm;
	private String delete_reason;
	private String intro_title;
	private String introduce;
	private String career;
	private String account_yn;
	private int odongCash;
	private int dealingCount;

	public Customer() {
	}

	public String getC_code() {
		return c_code;
	}

	public String getC_id() {
		return c_id;
	}

	public String getC_pwd() {
		return c_pwd;
	}

	public String getC_email() {
		return c_email;
	}

	public String getC_phone() {
		return c_phone;
	}

	public String getC_accout() {
		return c_accout;
	}

	public Date getJoin_date() {
		return join_date;
	}

	public String getEnd_yn() {
		return end_yn;
	}

	public String getCerti_name() {
		return certi_name;
	}

	public String getToken() {
		return token;
	}

	public String getLogintype() {
		return logintype;
	}

	public String getC_name() {
		return c_name;
	}

	public String getC_type() {
		return c_type;
	}

	public String getMail_alarm() {
		return mail_alarm;
	}

	public String getSms_alarm() {
		return sms_alarm;
	}

	public String getDelete_reason() {
		return delete_reason;
	}

	public String getIntro_title() {
		return intro_title;
	}

	public String getIntroduce() {
		return introduce;
	}

	public String getCareer() {
		return career;
	}

	public String getAccount_yn() {
		return account_yn;
	}

	public int getOdongCash() {
		return odongCash;
	}

	public int getDealingCount() {
		return dealingCount;
	}

	public void setC_code(String c_code) {
		this.c_code = c_code;
	}

	public void setC_id(String c_id) {
		this.c_id = c_id;
	}

	public void setC_pwd(String c_pwd) {
		this.c_pwd = c_pwd;
	}

	public void setC_email(String c_email) {
		this.c_email = c_email;
	}

	public void setC_phone(String c_phone) {
		this.c_phone = c_phone;
	}

	public void setC_accout(String c_accout) {
		this.c_accout = c_accout;
	}

	public void setJoin_date(Date join_date) {
		this.join_date = join_date;
	}

	public void setEnd_yn(String end_yn) {
		this.end_yn = end_yn;
	}

	public void setCerti_name(String certi_name) {
		this.certi_name = certi_name;
	}

	public void setToken(String token) {
		this.token = token;
	}

	public void setLogintype(String logintype) {
		this.logintype = logintype;
	}

	public void setC_name(String c_name) {
		this.c_name = c_name;
	}

	public void setC_type(String c_type) {
		this.c_type = c_type;
	}

	public void setMail_alarm(String mail_alarm) {
		this.mail_alarm = mail_alarm;
	}

	public void setSms_alarm(String sms_alarm) {
		this.sms_alarm = sms_alarm;
	}

	public void setDelete_reason(String delete_reason) {
		this.delete_reason = delete_reason;
	}

	public void setIntro_title(String intro_title) {
		this.intro_title = intro_title;
	}

	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}

	public void setCareer(String career) {
		this.career = career;
	}

	public void setAccount_yn(String account_yn) {
		this.account_yn = account_yn;
	}

	public void setOdongCash(int odongCash) {
		this.odongCash = odongCash;
	}

	public void setDealingCount(int dealingCount) {
		this.dealingCount = dealingCount;
	}

	@Override
	public String toString() {
		return "Customer [c_code=" + c_code + ", c_id=" + c_id + ", c_pwd=" + c_pwd + ", c_email=" + c_email
				+ ", c_phone=" + c_phone + ", c_accout=" + c_accout + ", join_date=" + join_date + ", end_yn=" + end_yn
				+ ", certi_name=" + certi_name + ", token=" + token + ", logintype=" + logintype + ", c_name=" + c_name
				+ ", c_type=" + c_type + ", mail_alarm=" + mail_alarm + ", sms_alarm=" + sms_alarm + ", delete_reason="
				+ delete_reason + ", intro_title=" + intro_title + ", introduce=" + introduce + ", career=" + career
				+ ", account_yn=" + account_yn + ", odongCash=" + odongCash + ", dealingCount=" + dealingCount + "]";
	}

}