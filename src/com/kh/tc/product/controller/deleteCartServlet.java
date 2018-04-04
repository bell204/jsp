package com.kh.tc.product.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 
import com.kh.tc.product.model.service.CartService;
import com.kh.tc.product.model.vo.Cart;
import com.kh.tc.product.model.vo.product;

 
@WebServlet("/deleteCart.do")
public class deleteCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public deleteCartServlet() {
        super();
    }
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int cart_code= Integer.parseInt(request.getParameter("cart_code"));
	 
		System.out.println(cart_code);
	 
		ArrayList<Cart> list= new CartService().deleteCart(cart_code);

		String page = "";
 
		if(list != null){
			page = "views/mypage/wishbuy2.jsp";
			request.setAttribute("list", list);
		}
		
		
		
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
  
	}
		
	 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
