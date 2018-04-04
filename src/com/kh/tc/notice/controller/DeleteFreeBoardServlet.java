package com.kh.tc.notice.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.tc.notice.model.service.noticeService;
import com.kh.tc.notice.model.vo.notice;

@WebServlet("/deleteFreeBoard")
public class DeleteFreeBoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public DeleteFreeBoardServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String com_code = request.getParameter("com_code");
		System.out.println("com_code : " + com_code);
		ArrayList<notice> list = new noticeService().deleteNotice(com_code);
		String page = "";

		if (list != null) {
			page = "views/community/freeBoard.jsp";
			request.setAttribute("list", list);
		} else {
			page = "views/main/Realmain.jsp";
		}
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
