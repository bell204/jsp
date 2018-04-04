package com.kh.tc.notice.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.tc.admin.model.service.AdminService;
import com.kh.tc.notice.model.vo.notice;

/**
 * Servlet implementation class SelectQnaDetailServlet
 */
@WebServlet("/selectQnaDetail.ad")
public class SelectQnaDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectQnaDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String com_code = request.getParameter("c_code");
		
		notice n = new AdminService().selectQnaDetail(com_code);
	
		String page = "";
		
		request.setAttribute("n", n);
		if(n != null){
			page = "views/adminViews/newQnaDetail.jsp";
		}else{
			page = "views/common/errorPage.jsp";
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
