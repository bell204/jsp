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

/**
 * Servlet implementation class SelectTaluserinfoServlet
 */
@WebServlet("/selecttalUserInfo.ad")
public class SelectTaluserinfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectTaluserinfoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String talId = request.getParameter("talId");
		System.out.println(talId);
		Customer c1 = new AdminService().selectTalUser(talId);
		
		request.setAttribute("c1", c1);
		String page = "";
		if(c1 != null){
			page = "/views/adminViews/talDetail.jsp";
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
