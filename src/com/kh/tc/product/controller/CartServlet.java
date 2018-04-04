package com.kh.tc.product.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.tc.customer.model.vo.Customer;
import com.kh.tc.product.model.service.CartService;
 
import com.kh.tc.product.model.vo.Cart;
 
 
@WebServlet("/wishbuy.do")
public class CartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CartServlet() {
    	
        super();
 
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
   
		    String page="";
		     
		   	Cart cart = new Cart();
		      String c_code = String.valueOf(((Customer) (request.getSession().getAttribute("loginUser"))).getC_code()); 
		       
		      
		      int p_code = Integer.parseInt(request.getParameter("num"));
		      
		      
		      System.out.println(p_code);
		    
		      ArrayList<Cart> list = new CartService().wishbuy(c_code, p_code);
	
		 
		      System.out.println("카트list"+ list.size()); 
		 
		 if(list!=null){
			 page="views/mypage/wishbuy2.jsp";
			 request.setAttribute("list", list);
			 
		 }else{
			 page="views/common/errorPage.jsp";
			 request.setAttribute("msg", "fail");
		 }
		 
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
