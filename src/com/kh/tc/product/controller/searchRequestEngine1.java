package com.kh.tc.product.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.tc.product.model.service.requestService;
import com.kh.tc.product.model.vo.product;

 
@WebServlet("/searchRequestEngine1.do")
public class searchRequestEngine1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
    public searchRequestEngine1() {
        super();
    }
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<product> list= null;
  	
		String search3=request.getParameter("search3");
	 
		System.out.println(search3);
  
		list= (ArrayList<product>) new requestService().searchRequestEngine1(search3);
	 
		 String page="";
		 System.out.println("서블릿 복귀");
		 System.out.println(list);
		 
		 
		 if(list!=null){
			 page = "views/category/requestSearch.jsp";
			 request.setAttribute("list", list);
			 
		 }else{
			 page="views/common/errorPage.jsp";
			 request.setAttribute("msg", "장바구니 저장실패");
		 }
		
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
	
	
	
	
	
	
	
	}

	
	
	
	
	
	 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
