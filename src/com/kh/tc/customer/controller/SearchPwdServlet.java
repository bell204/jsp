package com.kh.tc.customer.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.tc.customer.model.service.CustomerService;

@WebServlet("/searchPwd")
public class SearchPwdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public SearchPwdServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String strId = request.getParameter("strId");
		String strname = request.getParameter("strname");
		String email1 = request.getParameter("email1");
		String strEmail2b = request.getParameter("strEmail2b");
		String email = email1 + "@" + strEmail2b;
		System.out.println("strId : " + strId);
		// userId불러오기
		String userId = new CustomerService().selectUserId(strname, email);
		System.out.println("userId : " + userId);
		String page = "";
		if (userId.equals(strId)) {
			page = "/sendEmailforPwd?email=" + email + "&userId=" + userId;
		}
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
