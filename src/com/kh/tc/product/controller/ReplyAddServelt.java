package com.kh.tc.product.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.tc.product.model.service.ProductService;
import com.kh.tc.product.model.vo.Reply;

/**
 * Servlet implementation class ReplyAddServelt
 */
@WebServlet("/replyadd")
public class ReplyAddServelt extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public ReplyAddServelt() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("userId");
		String replycontent = request.getParameter("replycontent");
		int starpoint = Integer.parseInt(request.getParameter("starpoint"));
		int p_code = Integer.parseInt(request.getParameter("p_code"));
	
		
		Reply r = new Reply();
		r.setC_code(userId);
		r.setReply_content(replycontent);
		r.setStar_point(starpoint);
		r.setReply_from(p_code);
		
		
		
		ArrayList<Reply> replyList  = new ProductService().addReply(r);
		
	
		response.setContentType("application/json");
		new Gson().toJson(replyList,response.getWriter());
	
		
		
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
