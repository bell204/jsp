package com.kh.tc.product.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.tc.product.model.service.ProductService;

/**
 * Servlet implementation class checkProductServlet
 */
@WebServlet("/checkProduct")
public class checkProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public checkProductServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int p_code = Integer.parseInt(request.getParameter("p_code"));
		
		int result = new ProductService().checkProduct(p_code);
		
		response.setContentType("application/json");
		new Gson().toJson(result,response.getWriter());
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
