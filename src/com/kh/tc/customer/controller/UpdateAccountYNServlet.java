package com.kh.tc.customer.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.tc.customer.model.service.CustomerService;

@WebServlet("/updateAccountYN.cu")
public class UpdateAccountYNServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public UpdateAccountYNServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String userId = request.getParameter("userId");
		System.out.println("userId :" + userId);

		int result = new CustomerService().updateAccountYN(userId);
		String page = "";
		if (result > 0) {
			page = "/views/member/profileupdate.jsp";
		}

		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
