package com.kh.tc.IncomeRecord.model.vo;

public class IncomeRecord {
	private int in_come;//출금코드
	private String c_code; //출금자코드
	private int out_come;//출금신청금액
	private String out_date; //출금날짜
	private int out_status; //출금상태 1 출금전 2 출금거부 3 출금완료
	private int out_tax; //출금시오동가저가는금액
	private int real_in; //실직적으로가저가는돈
	private String in_date; //출금신청날짜
	
	public  IncomeRecord(){}

	public IncomeRecord(int in_come, String c_code, int out_come, String out_date, int out_status, int out_tax,
			int real_in, String in_date) {
		super();
		this.in_come = in_come;
		this.c_code = c_code;
		this.out_come = out_come;
		this.out_date = out_date;
		this.out_status = out_status;
		this.out_tax = out_tax;
		this.real_in = real_in;
		this.in_date = in_date;
	}

	public int getIn_come() {
		return in_come;
	}

	public String getC_code() {
		return c_code;
	}

	public int getOut_come() {
		return out_come;
	}

	public String getOut_date() {
		return out_date;
	}

	public int getOut_status() {
		return out_status;
	}

	public int getOut_tax() {
		return out_tax;
	}

	public int getReal_in() {
		return real_in;
	}

	public String getIn_date() {
		return in_date;
	}

	public void setIn_come(int in_come) {
		this.in_come = in_come;
	}

	public void setC_code(String c_code) {
		this.c_code = c_code;
	}

	public void setOut_come(int out_come) {
		this.out_come = out_come;
	}

	public void setOut_date(String out_date) {
		this.out_date = out_date;
	}

	public void setOut_status(int out_status) {
		this.out_status = out_status;
	}

	public void setOut_tax(int out_tax) {
		this.out_tax = out_tax;
	}

	public void setReal_in(int real_in) {
		this.real_in = real_in;
	}

	public void setIn_date(String in_date) {
		this.in_date = in_date;
	}

	@Override
	public String toString() {
		return "IncomeRecord [in_come=" + in_come + ", c_code=" + c_code + ", out_come=" + out_come + ", out_date="
				+ out_date + ", out_status=" + out_status + ", out_tax=" + out_tax + ", real_in=" + real_in
				+ ", in_date=" + in_date + "]";
	}
	
}