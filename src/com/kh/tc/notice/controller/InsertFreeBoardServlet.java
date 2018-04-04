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

@WebServlet("/insertFreeBoard.bo")
public class InsertFreeBoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public InsertFreeBoardServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String title = request.getParameter("title");
		String userCode = request.getParameter("userCode");
		String content = request.getParameter("content");
		String date = request.getParameter("date");
		String category_name = request.getParameter("category_name");
		int cate_code = 0;
		switch (category_name) {
		case "시간":
			cate_code = 1;
			break;
		case "재능":
			cate_code = 2;
			break;
		case "물건":
			cate_code = 3;
			break;
		case "공간":
			cate_code = 4;
			break;
		case "차량":
			cate_code = 5;
			break;
		}

		notice n = new notice();
		n.setCom_name(title);
		n.setCom_content(content);
		n.setCom_date(date);
		n.setCate_code(cate_code);
		n.setCate_name(category_name);
		int result = new noticeService().insertFreeBoard(n, userCode);
		if (result > 0) {
			HttpSession session = request.getSession();
			session.setAttribute("n", n);
			response.sendRedirect("/p/selectList.bo");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
