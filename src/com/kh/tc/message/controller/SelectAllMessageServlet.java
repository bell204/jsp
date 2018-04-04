package com.kh.tc.message.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.tc.message.model.service.MessageService;
import com.kh.tc.message.model.vo.Message;

@WebServlet("/selectAllMsg.me")
public class SelectAllMessageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SelectAllMessageServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("userId");
		String receveId = request.getParameter("receveId");
		
		Message m  = new Message();
		m.setcCode(userId);
		m.setReceveCode(receveId);
		ArrayList<Message> meList = new MessageService().selectAllMessage(m);
		 
		System.out.println("yaya : "+ meList);
	    response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8"); 
		  
		new Gson().toJson(meList, response.getWriter());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
