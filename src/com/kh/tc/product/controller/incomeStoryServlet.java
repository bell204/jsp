package com.kh.tc.product.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.tc.customer.model.vo.Customer;
import com.kh.tc.product.model.service.ProductService;
import com.kh.tc.product.model.vo.IncomeStory;

/**
 * Servlet implementation class incomeStoryServlet
 */
@WebServlet("/incomeStory")
public class incomeStoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public incomeStoryServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int getmoney =0;
		Customer loginUser = (Customer)(request.getSession().getAttribute("loginUser"));
		
		if(request.getParameter("getmoney") != null) {
			getmoney=	Integer.parseInt(request.getParameter("getmoney"));
		int result = new ProductService().requestIncome(getmoney,loginUser.getC_code());
		System.out.println(result);
		}
		
		
		//페이징
				
		String ajax = request.getParameter("ajax");
		
		int currentPage; //현재 페이지를 표시할 변수
		int limit;       //한 페이지에 게시글이 몇개 보여질 것인지
		int maxPage;     //전체 페이지에서 가장 마지막 페이지
		int startPage;   //한번에 표시될 페이지가 시작할 페이지
		int endPage;	 //한번에 표시될 페이지가 끝나는 페이지
		

		currentPage =1;
		if(request.getParameter("currentPage")!=null){
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		if(currentPage <1) {
			currentPage=1;
		}

		limit = 10;
	
		ProductService ps = new ProductService();
		int listCount = ps.getIncomeListCount(loginUser.getC_code());
		

		
		maxPage = (int)((double)listCount/limit + 0.99);
		
		if(currentPage>maxPage) {
			currentPage=maxPage;
		}
	
		startPage =(int)((double)currentPage/limit + 0.99-1)*limit+1;
		
		endPage = startPage + limit -1;
		
		if(maxPage < endPage){
			endPage = maxPage;
		}
		
		
		ArrayList<IncomeStory> incomeList = new ProductService().selectIncomeStory(loginUser.getC_code(),currentPage,limit);
		
		if(ajax != null) {
			
			response.setContentType("application/json");
			new Gson().toJson(incomeList,response.getWriter());
			
		}else {
		
		request.getSession().setAttribute("incomeList", incomeList);
		response.sendRedirect("/p/views/mypage/outsellstory.jsp");
		}
		 
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
