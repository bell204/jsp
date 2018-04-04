package com.kh.tc.product.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.tc.customer.model.vo.Customer;
import com.kh.tc.product.model.service.ProductService;
import com.kh.tc.product.model.vo.Income;

/**
 * Servlet implementation class selectIncomeServlet
 */
@WebServlet("/selectIncome")
public class selectIncomeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
    public selectIncomeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Customer loginUser = (Customer)(request.getSession().getAttribute("loginUser"));
		
		int num = Integer.parseInt(request.getParameter("num"));
		
		System.out.println(loginUser.getC_code());
		String nofromDate = request.getParameter("fromDate");
		String notoDate = request.getParameter("toDate");
		
		
		String date = "1993-08-06";
		Date fromDate = Date.valueOf(date);
		Date toDate= new Date(new java.util.Date().getTime());

		if(nofromDate!=null && notoDate!=null) {
			fromDate   = Date.valueOf(nofromDate);
			toDate = Date.valueOf(notoDate);
			Income in = new  ProductService().sumIncome(loginUser.getC_code(),fromDate,toDate);
			
			
			System.out.println(in);
			
			response.setContentType("application/json");
			new Gson().toJson(in,response.getWriter());
		
		
		}else {
			if(num==1) {
		
		Income in = new  ProductService().sumIncome(loginUser.getC_code(),fromDate,toDate);
		
		
	
		request.setAttribute("income", in);
		
		request.getRequestDispatcher("/views/mypage/sumsell.jsp").forward(request, response);
			}else {
				Income in = new  ProductService().sumIncome(loginUser.getC_code(),fromDate,toDate);
		
				
				request.setAttribute("income", in);
				
				request.getRequestDispatcher("/views/mypage/outsell.jsp").forward(request, response);
			}
		
		}
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
