package com.kh.tc.message.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.tc.customer.model.vo.Customer;
import com.kh.tc.message.model.service.MessageService;

/**
 * Servlet implementation class GotoMessageServlet
 */
@WebServlet("/gotoMessage.me")
public class GotoMessageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GotoMessageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String c_code = request.getParameter("cId");
		String receveId = new MessageService().selectCustomer(c_code);
		System.out.println("앙제발 : "+c_code);
		request.setAttribute("receveId", receveId);
		System.out.println("앙 제발 : "+receveId);
		String page= "";
		if(receveId != null){
			page="views/message/messageDetail.jsp";
		}else{
			page="views/common/errorPage.jsp";
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
