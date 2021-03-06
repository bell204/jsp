package com.kh.tc.notice.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.tc.notice.model.service.noticeService;
import com.kh.tc.notice.model.vo.notice;

@WebServlet("/selectOne.bo")
public class SelectOneFreeBoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public SelectOneFreeBoardServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int num = Integer.parseInt(request.getParameter("num"));

		notice n = new noticeService().selectOneFreeBoard(num);
		System.out.println("SOFBS n : " + n);
		String page = "";
		if (n != null) {
			HttpSession session = request.getSession();
			session.setAttribute("n", n);
			session.setAttribute("num", num);
			page = "views/community/freeBoardDetail.jsp";
			request.setAttribute("n", n);
		}

		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
