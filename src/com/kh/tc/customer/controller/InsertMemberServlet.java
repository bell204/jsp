package com.kh.tc.customer.controller;

import static com.kh.tc.common.JDBCTemplet.getSha512;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.tc.customer.model.service.CustomerService;
import com.kh.tc.customer.model.vo.Customer;

@WebServlet("/insertMember.me")
public class InsertMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public InsertMemberServlet() {
		super();
	}

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String mType = request.getParameter("mType");
		String mName = request.getParameter("mName");
		String userId = request.getParameter("userId");
		String firstPwd = request.getParameter("password");
		String email = request.getParameter("email");
		
		String password = getSha512(firstPwd);
 
		Customer c = new Customer();
		c.setC_type(mType);
		c.setC_name(mName);
		c.setC_id(userId);
		c.setC_pwd(password);
		c.setC_email(email);
		
		int result = new CustomerService().insertmember(c);
		
		String name = c.getC_name();
		if (result > 0) {
			response.setContentType("application/json");
			response.setCharacterEncoding("utf-8");
			new Gson().toJson(name, response.getWriter());

		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
