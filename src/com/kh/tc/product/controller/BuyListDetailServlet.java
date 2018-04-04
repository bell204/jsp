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

 
@WebServlet("/BuyListDetail.do")
public class BuyListDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public BuyListDetailServlet() {
        super();
    }

	 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		ArrayList<product> list =new ArrayList<product>();
		int record_status=Integer.parseInt(request.getParameter("record_status"));
		System.out.println(record_status);

		String c_code = String.valueOf(((Customer) (request.getSession().getAttribute("loginUser"))).getC_code());
  
		System.out.println(c_code);
		list = new ProductService().buyListDetail(c_code, record_status);


		 System.out.println("서블릿 페이지 조회 성공");
					  
		 System.out.println(list);
				 
		 
					String page="";
					if(list != null) {
						page = "views/mypage/buyDetail.jsp";
						request.setAttribute("list", list);
				 
					}else {
						page="views/common/errorPage.jsp";
						request.setAttribute("msg","fail!");
					}
					RequestDispatcher view =request.getRequestDispatcher(page);
					view.forward(request, response);
				}
 
 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
