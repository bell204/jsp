package com.kh.tc.message.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.tc.message.model.service.MessageService;
import com.sun.org.apache.bcel.internal.generic.NEWARRAY;

@WebServlet("/deleteMessage.me")
public class DeleteMessageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DeleteMessageServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//System.out.println("queryString : " + request.getQueryString());
		String userId = request.getParameter("userId");
		String[] receve = request.getParameterValues("receveId");
		//System.out.println(receve.length);
		String receveI = receve[0].replace("\"", "");
		String[] receveId = receveI.substring(1,receveI.length()-1).split(",");
		/*for(int i = 0; i < receveId.length; i++){
			System.out.println("iii : "+receveId[i]);
		}*/
		
		
		int result = new MessageService().deleteMessage(userId, receveId);
		
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8"); 
		 
		new Gson().toJson(result, response.getWriter());
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
