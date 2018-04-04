package com.kh.tc.admin.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.tc.admin.model.dao.AdminDao;
import com.kh.tc.admin.model.service.AdminService;

/**
 * Servlet implementation class RequestProductAgreeServlet
 */
@WebServlet("/requestProductAgree.ad")
public class RequestProductAgreeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RequestProductAgreeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String pCode = request.getParameter("pCode");
		
		int result = new AdminService().requestProductAgree(pCode);
		
		String alert = "";
		if(result > 0){
			alert = "등록 요청 상품이 정상 등록되었습니다.";
		}else{
			alert = "등록 요청상품의 등록을 실패했습니다.";
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
