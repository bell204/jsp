package com.kh.tc.message.controller;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.tc.message.model.service.MessageService;

/**
 * Servlet implementation class StarUpdateServlet
 */
@WebServlet("/starUpdate1.me")
public class StarUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**    
     * @see HttpServlet#HttpServlet()
     */
    public StarUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String userId = request.getParameter("userId");
		String receveId =  URLEncoder.encode(request.getParameter("receveId"),"UTF-8");
		
		int result = new MessageService().updateStarCheck(userId, receveId); 
		
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8"); 
		 
		new Gson().toJson(result, response.getWriter());
	}

	/** 
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
