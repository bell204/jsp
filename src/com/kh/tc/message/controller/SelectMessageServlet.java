package com.kh.tc.message.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.tc.message.model.service.MessageService;
import com.kh.tc.message.model.vo.Message;

/**
 * Servlet implementation class SelectMessageServlet
 */
@WebServlet("/selectMessage.me")
public class SelectMessageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectMessageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String msgCode = request.getParameter("msgCode");
		
		Message m = new MessageService().selectMessage(msgCode);
		System.out.println("익익익익 : "+m+msgCode);
		
		response.setContentType("application/json");
		new Gson().toJson(m, response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
