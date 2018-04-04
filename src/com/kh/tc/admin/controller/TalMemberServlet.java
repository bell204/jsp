package com.kh.tc.admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.tc.admin.model.service.AdminService;

/**
 * Servlet implementation class TalMemberServlet
 */
@WebServlet("/talMember.ad")
public class TalMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TalMemberServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String talId = request.getParameter("talId");
		int result = new AdminService().talMember(talId);
		
		String alert = "";
		if(result > 0 ){
			alert = "님의 탈퇴가 정상 처리되었습니다.";
		}else{
			alert = "탈퇴처리 에러";
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
