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
import com.kh.tc.product.model.service.CartService;
import com.kh.tc.product.model.service.ProductService;
import com.kh.tc.product.model.vo.Cart;
import com.kh.tc.product.model.vo.Pay;
 
@WebServlet(name = "selectCart.do", urlPatterns = { "/selectCart.do" })
public class selectCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public selectCartServlet() {
        super();
    }

 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	  
		String c_code = String.valueOf(((Customer) (request.getSession().getAttribute("loginUser"))).getC_code());
		
		   
		ArrayList<Cart> list= new CartService().selectCartList(c_code);

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
