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
 * Servlet implementation class cancelDealServlet
 */
@WebServlet("/cancelDeal")
public class cancelDealServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public cancelDealServlet() {
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
		
		int result =0;
		String complete="";
		
			//판매자
		if(num==1) {
			
			result  = new ProductService().cancelDeal(dealcode,loginUser.getC_code());
			if(result>0) {
				complete="4";
			}else {
				complete="5";
			}
			request.getRequestDispatcher("/myPage?complete="+complete).forward(request, response);
			
			//구매자	
		}else if(num==2) {
			result  = new ProductService().cancelDeal2(dealcode,loginUser.getC_code());
			
			
			if(result>0) {
				complete="6";
			}else {
				complete="7";
			}
			
			request.getRequestDispatcher("/myPage?complete="+complete).forward(request, response);
			
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
