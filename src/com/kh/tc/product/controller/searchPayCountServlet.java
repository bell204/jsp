package com.kh.tc.product.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.tc.customer.model.vo.Customer;
import com.kh.tc.product.model.service.CartService;
import com.kh.tc.product.model.service.ProductService;
import com.kh.tc.product.model.vo.Pay;
import com.kh.tc.product.model.vo.product;
 
 
@WebServlet("/searchPayCount.do")
public class searchPayCountServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public searchPayCountServlet() {
        super();
 
        
    }

	 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	  
		
		String c_code = String.valueOf(((Customer) (request.getSession().getAttribute("loginUser"))).getC_code());
 
		System.out.println(c_code);
		Pay searchPayCount = new ProductService().searchPayCount(c_code);
			
		String page="";
		
		System.out.println("서블릿searchPayCount : "+searchPayCount);
		
		// 여기서 COUNT를 어떻게 보내느냐가 문제네.
		 
		if (searchPayCount != null){
		 page = "views/mypage/buy.jsp";
		 request.setAttribute("searchPayCount", searchPayCount);
 
	 }else{
		 page = "views/common/errorPage.jsp";
		 request.setAttribute("에러", "count fail");
	 }	
	 
RequestDispatcher view = request.getRequestDispatcher(page);
view.forward(request, response);
  
 
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
