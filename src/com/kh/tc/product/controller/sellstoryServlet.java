package com.kh.tc.product.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.tc.customer.model.vo.Customer;
import com.kh.tc.product.model.service.ProductService;
import com.kh.tc.product.model.vo.Dealrecord;

/**
 * Servlet implementation class sellstoryServlet
 */
@WebServlet("/sellstory")
public class sellstoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
    public sellstoryServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Customer loginUser = (Customer)(request.getSession().getAttribute("loginUser"));
		
		Dealrecord dr = new ProductService().recordSum(loginUser.getC_code());
		
		request.setAttribute("dr", dr);
		
		request.getRequestDispatcher("views/mypage/sell.jsp").forward(request, response);
		
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
