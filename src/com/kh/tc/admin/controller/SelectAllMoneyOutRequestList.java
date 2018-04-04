package com.kh.tc.admin.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.tc.IncomeRecord.model.vo.IncomeRecord;
import com.kh.tc.admin.model.service.AdminService;

/**
 * Servlet implementation class SelectAllMoneyOutRequestList
 */
@WebServlet("/selectAllMoneyOutRequest.ad")
public class SelectAllMoneyOutRequestList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectAllMoneyOutRequestList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ArrayList<IncomeRecord> cList = new AdminService().selectAllMoneyOutRequestList();
		
		request.setAttribute("cList", cList);
		String page = "";
		if(cList != null){
			page = "/views/adminViews/moneyOutRequestList.jsp";
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
