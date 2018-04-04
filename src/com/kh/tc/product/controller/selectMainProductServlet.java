package com.kh.tc.product.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.tc.product.model.service.ProductService;
import com.kh.tc.product.model.vo.product;

/**
 * Servlet implementation class selectMainProductServlet
 */
@WebServlet("/selectMain")
public class selectMainProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public selectMainProductServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int num = Integer.parseInt(request.getParameter("num"));
		String acheck = request.getParameter("acheck");
		
		if(num==1&&acheck==null) {
			ArrayList<product> proList = new ProductService().selectPro(num);
			request.setAttribute("proList", proList);
			request.getRequestDispatcher("/views/main/Realmain.jsp").forward(request, response);
			
			
		}else{
			ArrayList<product> proList = new ProductService().selectPro(num);
			response.setContentType("application/json");
			new Gson().toJson(proList,response.getWriter());
			
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
