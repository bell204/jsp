package com.kh.tc.product.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.tc.product.model.service.ProductService;
import com.kh.tc.product.model.vo.product;

/**
 * Servlet implementation class sellDetailServlet
 */
@WebServlet("/selldetail")
public class sellDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public sellDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(request.getParameter("p_code"));
		
		int p_code = Integer.parseInt(request.getParameter("p_code"));
		
		 System.out.println("selldatail : "+ p_code);
		
		ArrayList detail = new ProductService().searchProduct(p_code);
		request.setAttribute("detail", detail);
		
		
		request.getRequestDispatcher("/views/product/selldetail.jsp").forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
