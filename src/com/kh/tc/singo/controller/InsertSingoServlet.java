package com.kh.tc.singo.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.tc.notice.model.service.noticeService;

/**
 * Servlet implementation class InsertSingoServlet
 */
@WebServlet("/insertSingo.si")
public class InsertSingoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertSingoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String title = request.getParameter("title");
		String singoId = request.getParameter("singoId");
		String content = request.getParameter("content");
		String cCode = request.getParameter("cCode");
		
		int result = new noticeService().insertSingo(title, singoId, content, cCode);
		
		String alert = "";
		if(result > 0){
			alert="신고 접수 성공";
			
		}else{
			alert="신고 실패";
		}
		response.setContentType("application/json");
		new Gson().toJson(alert, response.getWriter());
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
