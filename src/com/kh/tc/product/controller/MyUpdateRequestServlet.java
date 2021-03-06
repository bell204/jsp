package com.kh.tc.product.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.tc.customer.model.vo.Customer;
import com.kh.tc.product.model.service.ProductService;
import com.kh.tc.product.model.service.requestService;
import com.kh.tc.product.model.vo.Pay;

 
@WebServlet("/MyUpdateRequest.do")
public class MyUpdateRequestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public MyUpdateRequestServlet() {
        super();
    }
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		//구매자
		String c_code = String.valueOf(((Customer) (request.getSession().getAttribute("loginUser"))).getC_code());
 
		System.out.println(c_code);
		ArrayList<Pay> list3 = new requestService().updateRequest(c_code);
			
		String page="";
		
		System.out.println("서블릿 : "+list3);
		 
		
	 if(list3 != null){
		 page = "views/member/myPage.jsp";
		 request.getSession().setAttribute("list3", list3);
	 }
	 RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
 
	}

 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
