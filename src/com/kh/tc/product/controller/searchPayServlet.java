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
 
 
@WebServlet("/searchPay.do")
public class searchPayServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public searchPayServlet() {
        super();
 
        
    }

	 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String c_code = String.valueOf(((Customer) (request.getSession().getAttribute("loginUser"))).getC_code());

		Pay pay = new ProductService().selectfinishPay(c_code);
 
		System.out.println(pay);
		response.setContentType("application/json");
		new Gson().toJson(pay, response.getWriter());
		}
		
	  

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
