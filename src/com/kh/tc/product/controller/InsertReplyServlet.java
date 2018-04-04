package com.kh.tc.product.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.tc.customer.model.vo.Customer;
import com.kh.tc.product.model.service.ProductService;
import com.kh.tc.product.model.vo.Reply;
import com.kh.tc.product.model.vo.product;
 

@WebServlet("/insertReply.do")
public class InsertReplyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public InsertReplyServlet() { }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
 
		int p_code= Integer.parseInt(request.getParameter("p_code"));
		String content = request.getParameter("content");
		String c_code = String.valueOf(((Customer) (request.getSession().getAttribute("loginUser"))).getC_code());

 		//System.out.println(content);
		Reply r= new Reply();
		r.setReply_content(content);
		r.setC_code(c_code);
 
		
		System.out.println(p_code);
		System.out.println("서블릿"+content);
		System.out.println(c_code);
		
		ArrayList<Reply> replyList =  new ProductService().insertReply(r, p_code);
		System.out.println(replyList);
		
		response.setContentType("application/json");
		new Gson().toJson(replyList, response.getWriter());
		
		
	}
 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
