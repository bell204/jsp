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
 * Servlet implementation class complteDealServlet
 */
@WebServlet("/complteDeal")
public class complteDealServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public complteDealServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int record_code = Integer.parseInt(request.getParameter("dealcode"));
		Customer loginUser = (Customer)(request.getSession().getAttribute("loginUser"));
		int num = Integer.parseInt(request.getParameter("num"));
		

		int result = new ProductService().complteDeal(record_code,num);
		
		if(result==8) {
			response.sendRedirect("/p/myPage?complete=1");
		}else if(result==6) {
			response.sendRedirect("/p/myPage?complete=2");
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
