package com.kh.tc.notice.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.tc.notice.model.service.noticeService;
import com.kh.tc.notice.model.vo.notice;

@WebServlet("/insertNotice.co")
public class insertNoticeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public insertNoticeServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String title = request.getParameter("title");
		String userCode = request.getParameter("userCode");
		String writer = request.getParameter("writer");
		String date = request.getParameter("date");
		String content = request.getParameter("content");
		System.out.println("userCode : " + userCode);
		notice n = new notice();
		n.setCom_name(title);
		n.setCom_content(content);
		n.setCom_date(date);
		int result = new noticeService().insertNotice(n, userCode);

		if (result > 0) {
			HttpSession session = request.getSession();
			session.setAttribute("notice", n);
			response.sendRedirect("/p/selectList.no");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
