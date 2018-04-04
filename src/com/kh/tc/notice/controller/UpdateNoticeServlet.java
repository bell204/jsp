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

@WebServlet("/updateNotice")
public class UpdateNoticeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public UpdateNoticeServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int com_code = Integer.parseInt(request.getParameter("com_code"));
		String title = request.getParameter("title");
		String updateDate = request.getParameter("updateDate");
		String content = request.getParameter("content");
		int num = Integer.parseInt(request.getParameter("num"));
		/*
		 * System.out.println("com_code : " + com_code); System.out.println("title : " +
		 * title); System.out.println("updateDate : " + updateDate);
		 * System.out.println("content : " + content);
		 */
		System.out.println("UNS num : " + num);
		notice n = new notice();
		n.setCom_code(com_code);
		n.setCom_name(title);
		n.setCom_date(updateDate);
		n.setCom_content(content);
		int result = new noticeService().updateNotice(n);

		ArrayList<notice> list = new noticeService().selectList();
		String page = "";
		if (result > 0) {
			page = "views/community/notice.jsp";
			request.setAttribute("list", list);
		}

		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
