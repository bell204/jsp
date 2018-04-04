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
 * Servlet implementation class GoogleChartServlet
 */
@WebServlet("/GoogleChart.ad")
public class GoogleChartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GoogleChartServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String startdate = request.getParameter("startdate");
		String enddate = request.getParameter("enddate");
		//
		long gwanggoSuick = new AdminService().allGwanggoSuick(startdate,enddate);
		long susuSuick = new AdminService().allsusuSuick(startdate, enddate);
		
		long[] suick = {gwanggoSuick, susuSuick};
		System.out.println("ss :" +gwanggoSuick);
		System.out.println("ss :" +susuSuick);
		System.out.println("ss :" +suick);
		System.out.println("ss :" +suick[0]);
		System.out.println("ss :" +suick[1]);
		response.setContentType("application/json");
		new Gson().toJson(suick, response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
