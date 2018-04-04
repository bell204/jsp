package com.kh.tc.customer.controller;

import java.io.IOException;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.tc.customer.model.service.CustomerService;
import com.kh.tc.customer.model.vo.Customer;

@WebServlet("/idCheck.me")
public class IdCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public IdCheckServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("userId");
		System.out.println("얍얍얍 : "+ userId);
		int result = new CustomerService().idCheck(userId);
		
		System.out.println("얍얍얍 : "+result);
		/*PrintWriter out = response.getWriter();
		if(result > 0 ){
			out.append("fail");
		}else{
			out.append("success");
		}
		out.flush();
		out.close();*/
		
		response.setContentType("application/json");
		 new Gson().toJson(result, response.getWriter());
		
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
