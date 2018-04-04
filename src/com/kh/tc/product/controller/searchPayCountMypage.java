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
import com.kh.tc.product.model.service.CartService;
import com.kh.tc.product.model.service.ProductService;
import com.kh.tc.product.model.vo.Pay;
import com.kh.tc.product.model.vo.product;
 
 
@WebServlet("/MypagePayCount.do")
public class searchPayCountMypage extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public searchPayCountMypage() {
        super();
 
        
    }

	 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	  
		
		String c_code = String.valueOf(((Customer) (request.getSession().getAttribute("loginUser"))).getC_code());
 
		System.out.println(c_code);
		ArrayList<Pay> list2 = new ProductService().searchMyPayCount(c_code);
			
		String page="";
		
		System.out.println("서블릿 : "+list2);
		 
		
	 if(list2 != null){
		 page = "views/member/myPage.jsp";
		 request.setAttribute("list2", list2);
	 }
	 RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
 
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
