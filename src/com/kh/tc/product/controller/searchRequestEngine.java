package com.kh.tc.product.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.tc.product.model.service.requestService;
import com.kh.tc.product.model.vo.PageInfo;
import com.kh.tc.product.model.vo.product;

 
@WebServlet("/searchRequestEngine.do")
public class searchRequestEngine extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
    public searchRequestEngine() {
        super();
    }
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<product> list= null;
  	
		String search3=request.getParameter("search3");
		System.out.println(search3);
  
		//페이징 처리 추가
				int currentPage; //현재 페이지를 표시할 변수
				int limit; //한 페이지에 게시글이 몇 개 보여질 것인지
				int maxPage;  //전체 페이지에서 가장 마지막 페이지 
				int startPage;  //한번에 표시될 페이지가 시작할 페이지
				int endPage;   //한번에 표시될 페이지가 끝나는 페이지 
				String req_status="Y";
				
				//게시판은 1페이지부터 시작함
				currentPage = 1;
				if(request.getParameter("currentPage") !=null) {
					currentPage= Integer.parseInt(request.getParameter("currentPage"));
				}
				
				//한페이지에 보여질 목록 갯수
				limit = 10;
				
				//전체 목록 갯수를 리턴받음
				requestService rs = new requestService();
			 
				int listCount = rs.getListCount(req_status);
				
				System.out.println("listCount : "+listCount);
				
				//총 페이지 계산 		 
				//전체 목록 / limit + 0.9 
				maxPage = (int)((double)listCount / limit +0.9);  // 목록이 11인 경우 2임
				
				//현재 페이지에 보여줄 시작 페이지 수 (10개씩 보여지게 될 경우) 
				//아래쪽 페이지 수가 10개씩 보여지게 한다면
				//1, 11, 21, 31...
	 
				//11이 나와야 함. 여기가 틀림/
				startPage = (   (int)   (((double)currentPage / limit +0.9))  -1)   *limit+1 ;
				 
				//목록 아래 보여질 마지막 페이지 수 (10, 20, 30,..)
				endPage = startPage + limit -1;
				
				if(maxPage<endPage) {
					endPage = maxPage;
				}
				
				PageInfo pi = new PageInfo(currentPage, listCount, limit, maxPage,startPage,endPage);
		 
				// 재능 요청 고객 내용만 뜨도록
				
				System.out.println(req_status);
				
			 
		list= (ArrayList<product>) new requestService().searchRequestEngine(search3, currentPage,limit);
			  
		
		
		 String page="";
		 System.out.println("서블릿 복귀");
		 System.out.println(list);
		 
		 
		 if(list!=null){
			 page = "views/category/requestSearch.jsp";
			 request.setAttribute("list", list);
			 
		 }else{
			 page="views/common/errorPage.jsp";
			 request.setAttribute("msg", "장바구니 저장실패");
		 }
		
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
	
	
	
	
	
	
	
	}

	
	
	
	
	
	 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
