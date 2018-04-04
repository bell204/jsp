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
import com.kh.tc.product.model.vo.product;

/**
 * Servlet implementation class SelectAllProductRequestServlet
 */
@WebServlet("/selectAllProductRequest.ad")
public class SelectAllProductRequestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectAllProductRequestServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<product> prList = new AdminService().selectAllRequestProduct();
			
		request.setAttribute("prList", prList);
		String page = "";
		if(prList != null){
			page="views/adminViews/requestRegisterProduct.jsp";
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
