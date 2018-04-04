package com.kh.tc.customer.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.tc.customer.model.service.CustomerService;
import com.kh.tc.customer.model.vo.Customer;

@WebServlet("/profileupdate")
public class ProfileUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ProfileUpdateServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String userId = request.getParameter("userId"); // 일반/기업 회원구분
		System.out.println("userId : " + userId);
		String c_type = request.getParameter("c_type"); // 회원비번
		System.out.println("c_type : " + c_type);
		String userPwd = request.getParameter("userPwd"); // email
		System.out.println("userPwd :" + userPwd);
		String strEmail1 = request.getParameter("strEmail1");
		String strEmail2b = request.getParameter("strEmail2b");
		String email = strEmail1 + "@" + strEmail2b;
		System.out.println("email : " + email);
		// 번호
		String strMobil1 = request.getParameter("strMobil1");
		String strMobil2 = request.getParameter("strMobil2");
		String strMobil3 = request.getParameter("strMobil3");
		String mobile = strMobil1 + "-" + strMobil2 + "-" + strMobil3;
		System.out.println("mobile : " + mobile);
		// 계좌번호
		String bankname = request.getParameter("bankname");
		String bankRealName = "";
		switch (bankname) {
		case "003":
			bankRealName = "기업은행";
			break;
		case "004":
			bankRealName = "국민은행";
			break;
		case "020":
			bankRealName = "우리은행";
			break;
		case "088":
			bankRealName = "신한은행";
			break;
		case "081":
			bankRealName = "KEB하나은행";
			break;
		case "012":
			bankRealName = "농협은행";
			break;
		case "007":
			bankRealName = "수협";
			break;
		case "048":
			bankRealName = "신협";
			break;
		case "034":
			bankRealName = "광주은행";
			break;
		case "032":
			bankRealName = "부산은행";
			break;
		case "031":
			bankRealName = "대구은행";
			break;
		case "071":
			bankRealName = "우체국";
			break;
		}
		String bankaddr = request.getParameter("bankaddr");
		String account = bankRealName + "/" + bankaddr;
		System.out.println("account : " + account);

		String emailAlarm = request.getParameter("emailAlarm");
		System.out.println("emailAlarm : " + emailAlarm);
		String snsAlarm = request.getParameter("snsAlarm");
		System.out.println("snsAlarm : " + snsAlarm);
		// 계좌 인증yn

		Customer c = new Customer();
		c.setC_id(userId);
		c.setC_type(c_type);
		c.setC_pwd(userPwd);
		c.setC_email(email);
		c.setC_phone(mobile);
		c.setC_accout(account);
		c.setMail_alarm(emailAlarm);
		c.setSms_alarm(snsAlarm);
		int result = new CustomerService().profileUpdate(c);
		System.out.println("result : " + result);

		System.out.println(" PUS c :" + c);
		String page = "";
		if (result > 0) {
			HttpSession session = request.getSession();
			session.setAttribute("loginUser", c);
			response.sendRedirect("views/member/myPage.jsp");
		} else {
			page = "views/member/profileupdate.jsp";
			RequestDispatcher view = request.getRequestDispatcher(page);
			view.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
