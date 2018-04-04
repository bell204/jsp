package com.kh.tc.admin.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.tc.admin.model.service.AdminService;
import com.kh.tc.notice.model.service.noticeService;
import com.kh.tc.notice.model.vo.notice;

/**
 * Servlet implementation class SelectBlackMemberRequest
 */
@WebServlet("/selectBlackRequest.ad")
public class SelectBlackMemberRequest extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectBlackMemberRequest() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<notice> noList = new AdminService().selectBlackRequest();
	
		String page = "";
		request.setAttribute("noList",noList);
		if(noList != null){
			page = "/views/adminViews/BlackMemberArea.jsp";
		}else{
			page= "/views/common/errorPage.jsp";
		}
		
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
