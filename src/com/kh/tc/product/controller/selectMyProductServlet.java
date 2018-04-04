package com.kh.tc.product.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.tc.customer.model.vo.Customer;
import com.kh.tc.product.model.service.ProductService;
import com.kh.tc.product.model.vo.product;

/**
 * Servlet implementation class selectMyProductServlet
 */
@WebServlet("/selectMyProduct")
public class selectMyProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	public selectMyProductServlet() {
		super();
		// TODO Auto-generated constructor stub
	}


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Customer loginUser = (Customer)(request.getSession().getAttribute("loginUser"));
		String keyword = request.getParameter("keyword");
		String status = "0";
		
		if(request.getParameter("status") !=null) {
		 status =request.getParameter("status");
		 }
		
		
		if(keyword == null) {

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
			int listCount = ps.getMyProductListCount(loginUser.getC_code(),status);
			
			
			

			maxPage = (int)((double)listCount/limit + 0.99);

			startPage =(int)((double)currentPage/limit + 0.99-1)*limit+1;

			endPage = startPage + limit -1;

			if(maxPage < endPage){
				endPage = maxPage;
			}
			
			System.out.println("키워드 없음 리스트카운트 : "+listCount);
			System.out.println(" 키워드 없음maxPage: "+maxPage);
			System.out.println(" 키워드 없음currentPage :"+currentPage);

			ArrayList<product> myList = new ProductService().selectMyProduct(currentPage,limit,loginUser.getC_code(),status);
			request.setAttribute("maxPage", maxPage);
			request.setAttribute("status", status);
			request.setAttribute("myList", myList);
			
			request.getRequestDispatcher("/views/mypage/sellList.jsp").forward(request, response);
		}else {
			
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
			int listCount = ps.getMyProductListCount(loginUser.getC_code(),keyword,status);


			maxPage = (int)((double)listCount/limit + 0.99);

			if(currentPage>maxPage) {
				currentPage=maxPage;
			}
			

			startPage =(int)((double)currentPage/limit + 0.99-1)*limit+1;

			endPage = startPage + limit -1;

			if(maxPage < endPage){
				endPage = maxPage;
			}

			
			

			System.out.println(" 키워드 있음 리스트카운트 : "+listCount);
			System.out.println(" 키워드 있음   maxPage: "+maxPage);
			System.out.println("키워드 있음   currentPage :"+currentPage);
			ArrayList<product> myList = new ProductService().selectMyProduct(currentPage,limit,loginUser.getC_code(),keyword,status);
			request.setAttribute("maxPage", maxPage);
			request.setAttribute("keyword", keyword);
			request.setAttribute("status", status);
			

			request.setAttribute("myList", myList);
			request.getRequestDispatcher("/views/mypage/sellList.jsp").forward(request, response);

		}


	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
