package com.kh.tc.product.controller;

import java.io.IOException;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.tc.customer.model.vo.Customer;
import com.kh.tc.product.model.service.ProductService;
import com.kh.tc.product.model.vo.Pay;
 
@WebServlet("/InsertBank.do")
public class InsertBankServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public InsertBankServlet() {
        super();
    }

	 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
  
		int pay_price=Integer.parseInt(request.getParameter("p_price"));
		int p_code=Integer.parseInt(request.getParameter("p_code")); 
		String p_name=request.getParameter("p_name");
		
		int p_count=Integer.parseInt(request.getParameter("p_count"));
		String p_option=request.getParameter("p_option");
		int totalPrice=Integer.parseInt(request.getParameter("totalPrice"));
	 
		String howtopay=request.getParameter("o_pay_status");
		String ac_code="merchant_"+ new Date().getTime();
		String c_code = String.valueOf(((Customer) (request.getSession().getAttribute("loginUser"))).getC_code());
		 
		System.out.println(pay_price);
		System.out.println(p_code);
		System.out.println(p_name);
		
		System.out.println(p_count);
		System.out.println(p_option);
		System.out.println(totalPrice);
	
		System.out.println(howtopay);
		System.out.println(ac_code);
		System.out.println(c_code);
		
		String page = "";
		  
		
		Pay pay = new Pay(); 
		
		pay.setAc_code(ac_code);
		pay.setC_code(c_code);
		pay.setPay_price(pay_price);
		pay.setHowtopay(howtopay);
		
		pay.setP_code(p_code);
		pay.setP_name(p_name);
		pay.setP_count(p_count);
		pay.setP_option(p_option);
		
		int result= new ProductService().insertBank(pay);
 
		System.out.println("무통장 서블릿 돌아옴");
		 if(result>0){
			 page = "views/pay/payment4.jsp";
			  
		 }else{
			 page = "views/common/errorPage.jsp";
		 }
 
		 
		 RequestDispatcher view = request.getRequestDispatcher(page);
		 view.forward(request, response);
		
		
	 
	}

 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
