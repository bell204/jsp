package com.kh.tc.product.model.vo;

import java.sql.Date;

public class Reply {
	private String c_code;
	private String reply_content;
	private String reply_time;
	private int reply_from;
	private int reply_type;
	private int star_point;
	private int currentPage;
	private float AVGstar;
	
	
	public float getAVGstar() {
		return AVGstar;
	}

	public void setAVGstar(float aVGstar) {
		AVGstar = aVGstar;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public Reply() {}

	public String getC_code() {
		return c_code;
	}

	public void setC_code(String c_code) {
		this.c_code = c_code;
	}

	public String getReply_content() {
		return reply_content;
	}

	public void setReply_content(String reply_content) {
		this.reply_content = reply_content;
	}

	public String getReply_time() {
		return reply_time;
	}

	public void setReply_time(String reply_time) {
		this.reply_time = reply_time;
	}

	public int getReply_from() {
		return reply_from;
	}

	public void setReply_from(int reply_from) {
		this.reply_from = reply_from;
	}

	public int getReply_type() {
		return reply_type;
	}

	public void setReply_type(int reply_type) {
		this.reply_type = reply_type;
	}

	public int getStar_point() {
		return star_point;
	}

	public void setStar_point(int star_point) {
		this.star_point = star_point;
	}

	@Override
	public String toString() {
		return "P_Option [c_code=" + c_code + ", reply_content=" + reply_content + ", reply_time=" + reply_time
				+ ", reply_from=" + reply_from + ", reply_type=" + reply_type + ", star_point=" + star_point + "]";
	}

	public Reply(String c_code, String reply_content, String reply_time, int reply_from, int reply_type,
			int star_point) {
		super();
		this.c_code = c_code;
		this.reply_content = reply_content;
		this.reply_time = reply_time;
		this.reply_from = reply_from;
		this.reply_type = reply_type;
		this.star_point = star_point;
	}
}
