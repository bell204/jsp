package com.kh.tc.category.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.tc.category.model.service.CategoryService;

/**
 * Servlet implementation class cateChangeServlet
 */
@WebServlet("/cate1")
public class cateChangeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
    public cateChangeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cate1 = request.getParameter("cate1");
		String msg = request.getParameter("msg");
		
		
		ArrayList<String> list = new CategoryService().selectCate(cate1,msg);
		if(list.size()==0) {
			list = null;
			
		}
		System.out.println(list);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
	      new Gson().toJson(list, response.getWriter());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
