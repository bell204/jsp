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
 * Servlet implementation class sellPagingServlet
 */
@WebServlet("/sellPaging")
public class sellPagingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
    public sellPagingServlet() {
        super();
        
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int page = Integer.parseInt(request.getParameter("page"));
		int minPage = page*8;
		int maxPage = (page+1)*8+1;
		
		String cate1 = request.getParameter("cate1");
		String cate2 = request.getParameter("cate2");
		String cate3 = request.getParameter("cate3");
		String cate4 = request.getParameter("cate4");
		String keyword= request.getParameter("keyword");

		
		if(keyword== null) {
			System.out.println("키워드가 널이다 "+keyword);
			ArrayList<product> proList = new ProductService().selectProPage(minPage,maxPage,cate1,cate2,cate3,cate4);
		
		
			response.setContentType("application/json");
			new Gson().toJson(proList,response.getWriter());
		}else {
			System.out.println(keyword);
			ArrayList<product> proList = new ProductService().selectProPage(minPage,maxPage,keyword);
			
			
			response.setContentType("application/json");
			new Gson().toJson(proList,response.getWriter());
			
		}
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
