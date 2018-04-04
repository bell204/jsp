package com.kh.tc.product.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.tc.customer.model.vo.Customer;
import com.kh.tc.product.model.service.ProductService;

/**
 * Servlet implementation class requestDealServlet
 */
@WebServlet("/requestDeal")
public class requestDealServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public requestDealServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int dealcode= Integer.parseInt(request.getParameter("dealcode"));
		int num = Integer.parseInt(request.getParameter("num"));
		Customer loginUser = (Customer)(request.getSession().getAttribute("loginUser"));
		int result = 0;
		
		if(num==2) {
			result = new ProductService().requestDeal(dealcode,loginUser.getC_code());
			
		}
		
		request.getRequestDispatcher("/myPage?complete=3").forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
