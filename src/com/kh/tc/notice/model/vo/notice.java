package com.kh.tc.notice.model.vo;

public class notice implements java.io.Serializable {
	private int com_code;
	private String com_type;
	private int cate_code;
	private String com_name;
	private String com_content;
	private String com_date;
	private String c_code;
	private int com_count;
	private String com_status;
	private int com_num;
	private String cate_name;
	private String c_id;
	private String qnaPassword;
	private String fileName;

	public notice() {
	}

	public notice(int com_code, String com_type, int cate_code, String com_name, String com_content, String com_date,
			String c_code, int com_count, String com_status, int com_num, String cate_name, String c_id,
			String qnaPassword, String fileName) {
		super();
		this.com_code = com_code;
		this.com_type = com_type;
		this.cate_code = cate_code;
		this.com_name = com_name;
		this.com_content = com_content;
		this.com_date = com_date;
		this.c_code = c_code;
		this.com_count = com_count;
		this.com_status = com_status;
		this.com_num = com_num;
		this.cate_name = cate_name;
		this.c_id = c_id;
		this.qnaPassword = qnaPassword;
		this.fileName = fileName;
	}

	public int getCom_code() {
		return com_code;
	}

	public void setCom_code(int com_code) {
		this.com_code = com_code;
	}

	public String getCom_type() {
		return com_type;
	}

	public void setCom_type(String com_type) {
		this.com_type = com_type;
	}

	public int getCate_code() {
		return cate_code;
	}

	public void setCate_code(int cate_code) {
		this.cate_code = cate_code;
	}

	public String getCom_name() {
		return com_name;
	}

	public void setCom_name(String com_name) {
		this.com_name = com_name;
	}

	public String getCom_content() {
		return com_content;
	}

	public void setCom_content(String com_content) {
		this.com_content = com_content;
	}

	public String getCom_date() {
		return com_date;
	}

	public void setCom_date(String com_date) {
		this.com_date = com_date;
	}

	public String getC_code() {
		return c_code;
	}

	public void setC_code(String c_code) {
		this.c_code = c_code;
	}

	public int getCom_count() {
		return com_count;
	}

	public void setCom_count(int com_count) {
		this.com_count = com_count;
	}

	public String getCom_status() {
		return com_status;
	}

	public void setCom_status(String com_status) {
		this.com_status = com_status;
	}

	public int getCom_num() {
		return com_num;
	}

	public void setCom_num(int com_num) {
		this.com_num = com_num;
	}

	public String getCate_name() {
		return cate_name;
	}

	public void setCate_name(String cate_name) {
		this.cate_name = cate_name;
	}

	public String getC_id() {
		return c_id;
	}

	public void setC_id(String c_id) {
		this.c_id = c_id;
	}

	public String getQnaPassword() {
		return qnaPassword;
	}

	public void setQnaPassword(String qnaPassword) {
		this.qnaPassword = qnaPassword;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	@Override
	public String toString() {
		return "notice [com_code=" + com_code + ", com_type=" + com_type + ", cate_code=" + cate_code + ", com_name="
				+ com_name + ", com_content=" + com_content + ", com_date=" + com_date + ", c_code=" + c_code
				+ ", com_count=" + com_count + ", com_status=" + com_status + ", com_num=" + com_num + ", cate_name="
				+ cate_name + ", c_id=" + c_id + ", qnaPassword=" + qnaPassword + ", fileName=" + fileName + "]";
	}

}
