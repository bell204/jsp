package com.kh.tc.message.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.tc.file.model.vo.File;
import com.kh.tc.message.model.service.MessageService;

@WebServlet("/selectFileMessage.me")
public class SelectFileMessageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SelectFileMessageServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String fileCode = request.getParameter("fileCode");
		
		File file = new MessageService().selectFileMessage(fileCode);
		response.setContentType("application/json");
		new Gson().toJson(file, response.getWriter());
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
