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

@WebServlet("/selectOne.qna")
public class SelectOneQnAServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public SelectOneQnAServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int com_code = Integer.parseInt(request.getParameter("com_code"));
		String com_name = request.getParameter("com_name");
		String QnAPassword = request.getParameter("QnAPassword");
		String fileName = request.getParameter("fileName");
		System.out.println("com_code : " + com_code);
		System.out.println("com_name : " + com_name);
		System.out.println("QnAPassword : " + QnAPassword);
		System.out.println("fileName : " + fileName);

		notice n = new noticeService().selectOneQnA(com_code, com_name, QnAPassword);

		System.out.println("SOQAS n : " + n);
		String page = "";
		if (n != null) {
			System.out.println("성공");
			HttpSession session = request.getSession();
			session.setAttribute("n", n);
			request.setAttribute("n", n);
			// page ="views/community/qnaDetail.jsp";
			page = "/selectOne.qfile?fileName=" + fileName;
		}
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
