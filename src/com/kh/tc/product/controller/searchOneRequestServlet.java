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
 
@WebServlet("/searchOneRequest.do")
public class searchOneRequestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public searchOneRequestServlet() {
        super();
    }
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		 
	
		int num = Integer.parseInt(request.getParameter("num"));
		System.out.println(num);
		ArrayList<product> list= (ArrayList<product>) new requestService().selectOneRequest(num);
		 
		 String page="";
			
		 System.out.println(list);
		 
		 
		 if(list!=null){
			 page = "views/category/requestShareDetail.jsp";
			 request.setAttribute("list", list);
			 
		 }else{
			 page="views/common/errorPage.jsp";
			 request.setAttribute("msg", "장바구니 저장실패");
		 }
		
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
	 
	}
		 
	 

 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
