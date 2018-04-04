package com.kh.tc.customer.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.tc.common.JDBCTemplet;
import com.kh.tc.customer.model.service.CustomerService;

@WebServlet("/changePwd")
public class ChangePwdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ChangePwdServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String newPwd = request.getParameter("newPwd");
		String userId = request.getParameter("userId");
		String password = JDBCTemplet.getSha512(newPwd);
		int result = new CustomerService().updatePwd(newPwd, userId);
		System.out.println("result : " + result);
		response.setContentType("application/json");
		response.setCharacterEncoding("utf-8");
		new Gson().toJson(result, response.getWriter());

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
