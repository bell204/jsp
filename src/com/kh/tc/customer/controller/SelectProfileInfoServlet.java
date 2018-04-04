package com.kh.tc.customer.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.tc.customer.model.service.CustomerService;
import com.kh.tc.customer.model.vo.Customer;
import com.kh.tc.file.model.service.fileService;
import com.kh.tc.file.model.vo.File;

/**
 * Servlet implementation class SelectProfileInfoServlet
 */
@WebServlet("/selectProfileInfo.me")
public class SelectProfileInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectProfileInfoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String pId = request.getParameter("pId");
		System.out.println("으악"+pId);
		Customer c = new CustomerService().selectOne(pId);
		System.out.println("으악"+c);
		File file = null;
		if(c != null){
			file = new fileService().selectProfilImg(pId);
		}
		String page="";
		System.out.println("으악"+file);
		request.setAttribute("c", c);
		request.setAttribute("file", file);
		if(file != null){
			page = "views/member/profile.jsp";
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
