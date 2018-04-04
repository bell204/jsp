package com.kh.tc.product.controller;

import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.sql.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.tc.customer.model.vo.Customer;
import com.kh.tc.product.model.service.requestService;
import com.kh.tc.product.model.vo.product;

@WebServlet("/insertRequest.do")
public class insertRequestShareServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public insertRequestShareServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		product p = new product();
		String p_name = request.getParameter("p_name");
		String p_date = request.getParameter("p_date");	
  
		String c_code = String.valueOf(((Customer) (request.getSession().getAttribute("loginUser"))).getC_code());

		
		int p_price = Integer.parseInt(request.getParameter("p_price")); //
		String p_simplecontent = request.getParameter("p_simplecontent"); //
		String req_status = request.getParameter("req_status"); //
 
		
		p.setP_name(p_name);
    	p.setP_price(p_price);
    	p.setC_code(c_code);
		p.setP_simplecontent(p_simplecontent);
		p.setP_content(p_date);
		p.setReq_status(req_status);
 
		System.out.println(p_name);
		System.out.println(p_date);
		System.out.println(p_price);
		System.out.println(p_simplecontent);
		System.out.println(req_status);

		int result= new requestService().insertRequest(p);

		System.out.println("insertRequest서블릿"+result);
		 
		String page = "";
		 if (result > 0 ) {
			 page= "/searchRequest.do?req_status=Y";
 
		 } else {
		request.setAttribute("msg", "fail");
		request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		
		 }
		 
		 
		 RequestDispatcher view = request.getRequestDispatcher(page);
		 view.include(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
