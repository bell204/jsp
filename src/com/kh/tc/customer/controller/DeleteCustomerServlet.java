package com.kh.tc.customer.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.tc.customer.model.service.CustomerService;

@WebServlet("/profiledelete")
public class DeleteCustomerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public DeleteCustomerServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		String deleteReason = request.getParameter("deleteReason");

		int result = new CustomerService().deleteCustomer(userId, deleteReason);

		String page = "";

		if (result > 0) {
			request.getSession().invalidate();
			response.sendRedirect("index.jsp");
		} else {
			page = "/p/views/myPage.jsp";
			RequestDispatcher view = request.getRequestDispatcher(page);
			view.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
