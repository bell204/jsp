package com.kh.tc.product.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.tc.product.model.service.ProductService;

 
@WebServlet("/updateDealer.do")
public class UpdateDealerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
    public UpdateDealerServlet() {
        super();
    }

	 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {

		String record_code= request.getParameter("record_code");
		
		System.out.println(record_code);
		 
		int result = new ProductService().updateRequest(record_code);
		
		
		System.out.println(result);
		String page="";
		 
		if(result>0){
			page= "/BuyList.do";
		}else{
			page="views/common/errorPage.jsp";
			request.setAttribute("에러", "update fail");
		}
		
 
		RequestDispatcher view =request.getRequestDispatcher(page);
		view.forward(request, response);
	}
 
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
