package com.kh.tc.notice.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.tc.notice.model.service.noticeService;
import com.kh.tc.notice.model.vo.notice;

@WebServlet("/getIn")
public class GetInPasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public GetInPasswordServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int com_code = Integer.parseInt(request.getParameter("com_code"));
		String com_name = request.getParameter("com_name");
		System.out.println("com_code :" + com_code);
		notice n = new noticeService().getOneQnA(com_name, com_code);
		System.out.println("getP n : " + n);
		String page = "";
		if (n != null) {
			request.setAttribute("n", n);
			page = "/views/community/QnAPassword.jsp";
		}
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
