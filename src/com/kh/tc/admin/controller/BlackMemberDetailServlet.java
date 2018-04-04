package com.kh.tc.admin.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.tc.admin.model.service.AdminService;
import com.kh.tc.customer.model.vo.Customer;
import com.kh.tc.notice.model.vo.notice;

/**
 * Servlet implementation class BlackMemberDetailServlet
 */
@WebServlet("/blackMember.ad")
public class BlackMemberDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BlackMemberDetailServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int comCode = Integer.parseInt(request.getParameter("comCode"));
		String badUserId = request.getParameter("badUserId");
		notice n =	new AdminService().selectBlackMember(comCode); 
		
	
		request.setAttribute("n", n);
		String page ="";
		if(n != null){
			page = "/views/adminViews/BlackAreaDetail.jsp";
		}else{
			page = "/views/common/errorPage.jsp";
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
