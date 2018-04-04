package com.kh.tc.file.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.tc.file.model.service.fileService;
import com.kh.tc.file.model.vo.File;

@WebServlet("/selectFileImg")
public class SelectFileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public SelectFileServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String userId = request.getParameter("userId");
		System.out.println("userId = " + userId);
		File profilImg = new fileService().selectProfilImg(userId);

		System.out.println("profileFile : " + profilImg);

		String page = "";
		/*
		 * String num = request.getParameter("num"); if (num.equals("2")) { page =
		 * "/views/member/myPage.jsp"; }
		 *
		 * RequestDispatcher view = request.getRequestDispatcher(page);
		 * view.forward(request, response);
		 */
		if (profilImg != null) {
			HttpSession session = request.getSession();
			session.setAttribute("profilImg", profilImg);
			response.sendRedirect("views/main/Realmain.jsp");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
