package com.kh.tc.message.model.vo;

import java.sql.Date;

import com.kh.tc.file.model.vo.File;

public class Message {
	private String cCode;
	private String msgCode;
	private String msgContent;
	private String sendTime;
	private String check;
	private String receveCode;
	private String starCheck;
	private String file_code;
	private String receveId;
	
	public Message() {
		super();
	}

	public Message(String cCode, String msgCode, String msgContent, String sendTime, String check, String receveCode,
			String starCheck, String file_code) {
		super();
		this.cCode = cCode;
		this.msgCode = msgCode;
		this.msgContent = msgContent;
		this.sendTime = sendTime;
		this.check = check;
		this.receveCode = receveCode;
		this.starCheck = starCheck;
		this.file_code = file_code;
	}

	public String getcCode() {
		return cCode;
	}

	public String getMsgCode() {
		return msgCode;
	}

	public String getMsgContent() {
		return msgContent;
	}

	public String getSendTime() {
		return sendTime;
	}

	public String getCheck() {
		return check;
	}

	public String getReceveCode() {
		return receveCode;
	}

	public String getStarCheck() {
		return starCheck;
	}

	public String getFile_code() {
		return file_code;
	}

	public void setcCode(String cCode) {
		this.cCode = cCode;
	}

	public void setMsgCode(String msgCode) {
		this.msgCode = msgCode;
	}

	public void setMsgContent(String msgContent) {
		this.msgContent = msgContent;
	}

	public void setSendTime(String sendTime) {
		this.sendTime = sendTime;
	}

	public void setCheck(String check) {
		this.check = check;
	}

	public void setReceveCode(String receveCode) {
		this.receveCode = receveCode;
	}

	public void setStarCheck(String starCheck) {
		this.starCheck = starCheck;
	}

	public void setFile_code(String file_code) {
		this.file_code = file_code;
	}

	@Override
	public String toString() {
		return "Message [cCode=" + cCode + ", msgCode=" + msgCode + ", msgContent=" + msgContent + ", sendTime="
				+ sendTime + ", check=" + check + ", receveCode=" + receveCode + ", starCheck=" + starCheck
				+ ", file_code=" + file_code + "]";
	}

	
	
}
