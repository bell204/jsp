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
 * Servlet implementation class OutMoneyServlet
 */
@WebServlet("/outMoney.ad")
public class OutMoneyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OutMoneyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int inCode = Integer.parseInt(request.getParameter("inCode"));
		
		int result = new AdminService().outMoney(inCode);
		System.out.println("으악 : "+result);
		String alert="";
		if(result > 0){
			alert = "출금완료";
		}else{
			alert = "출금실패";
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
