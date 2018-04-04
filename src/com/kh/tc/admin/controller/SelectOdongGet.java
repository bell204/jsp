package com.kh.tc.admin.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.kh.tc.IncomeRecord.model.vo.IncomeRecord;
import com.kh.tc.admin.model.service.AdminService;

/**
 * Servlet implementation class SelectOdongGet
 */
@WebServlet("/selectOdongGet.ad")
public class SelectOdongGet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectOdongGet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String startdate = request.getParameter("startdate");
		String enddate = request.getParameter("enddate");
		
		System.out.println("약 : "+startdate);
		System.out.println("냑 : "+enddate);
		
		ArrayList<IncomeRecord> cList = new AdminService().selectOdongGet(startdate, enddate);
		
		for(int i =0; i < cList.size(); i++){			
			System.out.println("약 : "+ cList.get(i));
		}
		response.setContentType("application/json");
		new Gson().toJson(cList, response.getWriter());
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
