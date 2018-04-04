package com.kh.tc.customer.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.tc.customer.model.service.CustomerService;

@WebServlet("/searchId")
public class SearchIdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public SearchIdServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String userName = request.getParameter("userName");
		String PersonalDate = request.getParameter("PersonalDate");
		String email1 = request.getParameter("email1");
		String strEmail2b = request.getParameter("strEmail2b");
		String email = email1 + "@" + strEmail2b;
		System.out.println("email : " + email);

		String userId = new CustomerService().selectUserId(userName, email);
		System.out.println("userId : " + userId);
		String page = "";
		if (userId != null) {
			page = "/views/member/showId.jsp";
			request.setAttribute("userId", userId);
		} else {
			page = "/views/member/searchIdPwd.jsp";
		}
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
