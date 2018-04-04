package com.kh.tc.product.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.tc.product.model.service.requestService;
import com.kh.tc.product.model.vo.Pay;
import com.kh.tc.product.model.vo.product;

 
@WebServlet("/InsertImport.do")
public class InsertImport extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
    public InsertImport() {
        super();
    }

	 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		int p_code=Integer.parseInt(request.getParameter("p_code")); 
		String p_name=request.getParameter("p_name");
		int p_count=Integer.parseInt(request.getParameter("p_count"));
		String howtopay=request.getParameter("o_pay_status");
		String p_option = request.getParameter("p_option");
		int totalPrice=Integer.parseInt(request.getParameter("totalPrice"));

		System.out.println(totalPrice); // totalprice
		System.out.println(p_code);
		System.out.println(p_name);
		System.out.println(p_count);
		
		System.out.println(howtopay);
		System.out.println("import에서 보낸"+p_option);
		

		int p_price=Integer.parseInt(request.getParameter("p_price"));
		System.out.println(p_price);
		String page = "";
		 
		Pay pay = new Pay(); 
		pay.setP_code(p_code);
		pay.setP_name(p_name);
		pay.setP_count(p_count);
		pay.setPay_price(p_price);
		pay.setHowtopay(howtopay);
		pay.setP_option(p_option);
		pay.setTotal_price(totalPrice);
	 
		 if(pay!=null){
			 page = "views/pay/import.jsp";
			 request.setAttribute("pay", pay);
		 }
 
		 
		 RequestDispatcher view = request.getRequestDispatcher(page);
		 view.forward(request, response);


	
	}

	 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
