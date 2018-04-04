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

@WebServlet("/selectOne.me")
public class SelectOneMessageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SelectOneMessageServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("userId");
		String receveId = request.getParameter("receveId");
		
		System.out.println("user"+ userId);
		System.out.println("receve"+ receveId);
		
		Message m = new Message();
		m.setcCode(userId);
		m.setReceveCode(receveId);
		ArrayList<Message> meList = new MessageService().selectAllMessage(m);
	     
		request.setAttribute("meList", meList);
		request.setAttribute("receveId", receveId);
		String page = null;
		if(meList != null){
			page = "views/message/messageDetail.jsp";
		}else{
			page= "views/common/errorPage.jsp";
			request.setAttribute("msg", "메세지 조회 실패");
		}
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
		
		/*response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8"); 
		  
		  
		new Gson().toJson(meList, response.getWriter());*/
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
