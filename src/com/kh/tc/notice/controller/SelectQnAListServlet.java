package com.kh.tc.notice.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.tc.notice.model.service.noticeService;
import com.kh.tc.notice.model.vo.PageInfo;
import com.kh.tc.notice.model.vo.notice;

@WebServlet("/selectQnAList")
public class SelectQnAListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public SelectQnAListServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 페이징 시작
		int currentPage;
		int limit;
		int maxPage;
		int startPage;
		int endPage;
		currentPage = 1;
		if (request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}

		limit = 10;

		noticeService ns = new noticeService();
		int listCount = ns.getQnAListCount();
		maxPage = (int) ((double) listCount / limit + 0.9);
		startPage = ((int) ((double) currentPage / limit + 0.9) - 1) * limit + 1;

		endPage = startPage + limit - 1;

		if (maxPage < endPage) {
			endPage = maxPage;
		}

		PageInfo pi = new PageInfo(currentPage, listCount, limit, maxPage, startPage, endPage);
		// 페이징 끝

		ArrayList<notice> list = new noticeService().selectQnAList(currentPage, limit);
		System.out.println("SQALS list : " + list);
		String page = "";
		if (list != null) {
			page = "views/community/qna.jsp";
			request.setAttribute("list", list);
			request.setAttribute("pi", pi);
			HttpSession session = request.getSession();
			session.setAttribute("pi", pi);
		} else {
			page = "views/main/Realmain.jsp";
		}
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
