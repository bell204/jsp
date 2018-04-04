package com.kh.tc.file.model.vo;

public class File implements java.io.Serializable {
	private String file_code;
	private String f_from;
	private String c_id;
	private String file_root;
	private String or_file_name;
	private String sec_file_name;
	private String update_time;
	private String receveId;

	public File() {
	}

	public File(String file_code, String f_from, String c_id, String file_root, String or_file_name,
			String sec_file_name, String update_time, String receveId) {
		super();
		this.file_code = file_code;
		this.f_from = f_from;
		this.c_id = c_id;
		this.file_root = file_root;
		this.or_file_name = or_file_name;
		this.sec_file_name = sec_file_name;
		this.update_time = update_time;
		this.receveId = receveId;
	}

	public String getFile_code() {
		return file_code;
	}

	public void setFile_code(String file_code) {
		this.file_code = file_code;
	}

	public String getF_from() {
		return f_from;
	}

	public void setF_from(String f_from) {
		this.f_from = f_from;
	}

	public String getC_id() {
		return c_id;
	}

	public void setC_id(String c_id) {
		this.c_id = c_id;
	}

	public String getFile_root() {
		return file_root;
	}

	public void setFile_root(String file_root) {
		this.file_root = file_root;
	}

	public String getOr_file_name() {
		return or_file_name;
	}

	public void setOr_file_name(String or_file_name) {
		this.or_file_name = or_file_name;
	}

	public String getSec_file_name() {
		return sec_file_name;
	}

	public void setSec_file_name(String sec_file_name) {
		this.sec_file_name = sec_file_name;
	}

	public String getUpdate_time() {
		return update_time;
	}

	public void setUpdate_time(String update_time) {
		this.update_time = update_time;
	}

	public String getReceveId() {
		return receveId;
	}

	public void setReceveId(String receveId) {
		this.receveId = receveId;
	}

	@Override
	public String toString() {
		return "File [file_code=" + file_code + ", f_from=" + f_from + ", c_id=" + c_id + ", file_root=" + file_root
				+ ", or_file_name=" + or_file_name + ", sec_file_name=" + sec_file_name + ", update_time=" + update_time
				+ ", receveId=" + receveId + "]";
	}

}
