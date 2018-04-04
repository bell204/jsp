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

import com.kh.tc.product.model.vo.product;
 
@WebServlet("/searchProduct.do")
public class searchProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public searchProductServlet() {
        super();
 
        
    }

	 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
 

		
		ArrayList<product> list= new ArrayList<product>();
		product p = new product();
		String c_code = String.valueOf(((Customer) (request.getSession().getAttribute("loginUser"))).getC_code());

		int p_code= Integer.parseInt(request.getParameter("p_code"));
		int qty=Integer.parseInt(request.getParameter("qty"));
		String option =request.getParameter("option");
		 
		int totalPrice = Integer.parseInt(request.getParameter("totalPrice"));
		
		String p_name= request.getParameter("p_name");
		String saveFiles=request.getParameter("c_image");
		int price=Integer.parseInt(request.getParameter("p_price"));
		// 판매자 제품명 수량
		 
	 
		System.out.println(p_code);
		System.out.println(qty);
		System.out.println(option);
		System.out.println(totalPrice);
 
		System.out.println(p_name);
		System.out.println("selldetail에서 보낸"+saveFiles);
		 	 
		
		p= new ProductService().searchCategory(p_code);
		
		
		p.setC_code(c_code);
		p.setP_code(p_code);
		p.setAd_code(qty);
		p.setOption(option);
		p.setCate_code(price);
		p.setTotal_price(totalPrice);
		p.setP_price(price);
		p.setP_name(p_name);
		p.setSaveFiles(saveFiles);
		
		list.add(p);
		String page="";
			
		System.out.println(list);
		
		 if(p!=null){
			 page = "views/mypage/payment1.jsp";
			// request.setAttribute("product", product);
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
