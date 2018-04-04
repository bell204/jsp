package com.kh.tc.product.model.vo;

import java.sql.Date;

public class product {
	private int p_code;
	private String p_type;
	private int cate_code;
	private String p_name;
	private String p_content;
	private String p_simplecontent;
	private int p_share_count;
	private String phone;
	private String p_status;
	private int p_price;
	private int total_price;
	private String c_code;
	private Date p_date;
	private int ad_code;
	private float star_point;
	private String option;
	private String p_deadline;
	private String savePath;
	private String originFiles;
	private String saveFiles;
	private String req_status;
	private String reply_content ;
	private String cate1;
	private String cate2;
	private String cate3;
	private String cate4;
	private int dealingCount;
	
	private int people;
	
	
	public int getDealingCount() {
		return dealingCount;
	}
	public void setDealingCount(int dealingCount) {
		this.dealingCount = dealingCount;
	}
	public int getTotal_price() {
		return total_price;
	}
	public void setTotal_price(int total_price) {
		this.total_price = total_price;
	}
	public int getPeople() {
		return people;
	}
	public void setPeople(int people) {
		this.people = people;
	}
	public String getCate1() {
		return cate1;
	}
	public void setCate1(String cate1) {
		this.cate1 = cate1;
	}
	public String getCate2() {
		return cate2;
	}
	public void setCate2(String cate2) {
		this.cate2 = cate2;
	}
	public String getCate3() {
		return cate3;
	}
	public void setCate3(String cate3) {
		this.cate3 = cate3;
	}
	public String getCate4() {
		return cate4;
	}
	public void setCate4(String cate4) {
		this.cate4 = cate4;
	}
	public int getP_code() {
		
		return p_code;
	}
	public void setP_code(int p_code) {
		
		this.p_code = p_code;
	}
	public String getP_type() {
		return p_type;
	}
	public void setP_type(String p_type) {
		this.p_type = p_type;
	}
	public int getCate_code() {
		return cate_code;
	}
	public void setCate_code(int cate_code) {
		this.cate_code = cate_code;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public String getP_content() {
		return p_content;
	}
	public void setP_content(String p_content) {
		this.p_content = p_content;
	}
	public String getP_simplecontent() {
		return p_simplecontent;
	}
	public void setP_simplecontent(String p_simplecontent) {
		this.p_simplecontent = p_simplecontent;
	}
	public int getP_share_count() {
		return p_share_count;
	}
	public void setP_share_count(int p_share_count) {
		this.p_share_count = p_share_count;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getP_status() {
		return p_status;
	}
	public void setP_status(String p_status) {
		this.p_status = p_status;
	}
	public int getP_price() {
		return p_price;
	}
	public void setP_price(int p_price) {
		this.p_price = p_price;
	}
	public String getC_code() {
		return c_code;
	}
	public void setC_code(String c_code) {
		this.c_code = c_code;
	}
	public Date getP_date() {
		return p_date;
	}
	public void setP_date(Date p_date) {
		this.p_date = p_date;
	}
	public int getAd_code() {
		return ad_code;
	}
	public void setAd_code(int ad_code) {
		this.ad_code = ad_code;
	}
	public float getStar_point() {
		return star_point;
	}
	public void setStar_point(float star_point) {
		this.star_point = star_point;
	}
	public String getOption() {
		return option;
	}
	public void setOption(String option) {
		this.option = option;
	}
	public String getP_deadline() {
		return p_deadline;
	}
	public void setP_deadline(String p_deadline) {
		this.p_deadline = p_deadline;
	}
	public String getSavePath() {
		return savePath;
	}
	public void setSavePath(String savePath) {
		this.savePath = savePath;
	}
	public String getOriginFiles() {
		return originFiles;
	}
	public void setOriginFiles(String originFiles) {
		this.originFiles = originFiles;
	}
	public String getSaveFiles() {
		return saveFiles;
	}
	public void setSaveFiles(String saveFiles) {
		this.saveFiles = saveFiles;
	}
	public String getReq_status() {
		return req_status;
	}
	public void setReq_status(String req_status) {
		this.req_status = req_status;
	}
	public String getReply_content() {
		return reply_content;
	}
	public void setReply_content(String reply_content) {
		this.reply_content = reply_content;
	}
	
	
	
	
	
	public product(int p_code, String p_type, int cate_code, String p_name, String p_content, String p_simplecontent,
			int p_share_count, String phone, String p_status, int p_price, String c_code, Date p_date, int ad_code,
			float star_point, String option, String p_deadline, String savePath, String originFiles, String saveFiles,
			String req_status, String reply_content) {
		super();
		this.p_code = p_code;
		this.p_type = p_type;
		this.cate_code = cate_code;
		this.p_name = p_name;
		this.p_content = p_content;
		this.p_simplecontent = p_simplecontent;
		this.p_share_count = p_share_count;
		this.phone = phone;
		this.p_status = p_status;
		this.p_price = p_price;
		this.c_code = c_code;
		this.p_date = p_date;
		this.ad_code = ad_code;
		this.star_point = star_point;
		this.option = option;
		this.p_deadline = p_deadline;
		this.savePath = savePath;
		this.originFiles = originFiles;
		this.saveFiles = saveFiles;
		this.req_status = req_status;
		this.reply_content = reply_content;
	}
	public product() {
	}
	@Override
	public String toString() {
		return "product [p_code=" + p_code + ", p_type=" + p_type + ", cate_code=" + cate_code + ", p_name=" + p_name
				+ ", p_content=" + p_content + ", p_simplecontent=" + p_simplecontent + ", p_share_count="
				+ p_share_count + ", phone=" + phone + ", p_status=" + p_status + ", p_price=" + p_price + ", c_code="
				+ c_code + ", p_date=" + p_date + ", ad_code=" + ad_code + ", star_point=" + star_point + ", option="
				+ option + ", p_deadline=" + p_deadline + ", savePath=" + savePath + ", originFiles=" + originFiles
				+ ", saveFiles=" + saveFiles + ", req_status=" + req_status + ", reply_content=" + reply_content + "]";
	}
 
	
	
	 

	



	
	

	
	
	
	

}
