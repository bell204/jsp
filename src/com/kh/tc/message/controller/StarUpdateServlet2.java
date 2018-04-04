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

@WebServlet("/starUpdate2.me")
public class StarUpdateServlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public StarUpdateServlet2() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("userId");
		String receveId =  URLEncoder.encode(request.getParameter("receveId"),"UTF-8");
		
		int result = new MessageService().updateStarCheck2(userId, receveId);
		
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		 
		new Gson().toJson(result, response.getWriter());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
