package com.kh.tc.product.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.tc.customer.model.vo.Customer;
import com.kh.tc.product.model.service.ProductService;
import com.kh.tc.product.model.vo.Pay;

 
@WebServlet("/insertPay.do")
public class insertPayServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
    public insertPayServlet() {
        super();
    }

 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		 Pay pay = new Pay();
	   
		String c_code = String.valueOf(((Customer) (request.getSession().getAttribute("loginUser"))).getC_code()); 
		String ac_code = request.getParameter("acCode"); 
		String p_name = request.getParameter("pName");		
		int p_code = Integer.parseInt(request.getParameter("p_code"));
		int pay_price = Integer.parseInt(request.getParameter("pPrice"));
		String howtopay = request.getParameter("howtopay");
		int p_count =  Integer.parseInt(request.getParameter("pCount"));
		String p_option = request.getParameter("p_option");
		int Total_price=Integer.parseInt(request.getParameter("Total_price"));
		
	System.out.println(ac_code);
		System.out.println(p_name);
		System.out.println(pay_price);
		System.out.println(howtopay);
	System.out.println(p_count);
	System.out.println(p_code);
	System.out.println(p_option);
	System.out.println(Total_price);	
	
		 pay.setC_code(c_code);
		 pay.setPay_price(pay_price);
		 pay.setHowtopay(howtopay);
		 pay.setP_name(p_name);
		 pay.setP_count(p_count);
		 pay.setP_code(p_code);
		 pay.setP_option(p_option);
		 pay.setTotal_price(Total_price);
		// arrayList에 결제 정보 담아 보냄
	 	
		 ArrayList<Pay> list=new ArrayList<Pay>();
	 //int result = new ProductService().insertPay(pay, ac_code);
		pay= new ProductService().insertPay(pay, ac_code);
	 
		 String page="";
		 
		 pay.setTotal_price(Total_price);
		 list.add(pay);
		 System.out.println(list);
		 
		if(list !=null) {
		request.getSession().removeAttribute("list");
		 page=request.getContextPath()+"/views/pay/payment3.jsp";
		 request.getSession().setAttribute("list", list);
		 
	}else {
		request.setAttribute("msg", "결제 실패!");
		page=request.getContextPath()+"/views/common/errorPage.jsp";
	}
		// 세션
		response.sendRedirect(page);
		
		 
//			if(result>0) {
//				 page="/views/pay/payment3.jsp";
//			}else {
//				request.setAttribute("msg", "결제 실패!");
//				page="/views/common/errorPage.jsp";
//			}
//			response.sendRedirect(page);
	 
	}

 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
