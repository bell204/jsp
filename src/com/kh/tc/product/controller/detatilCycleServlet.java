package com.kh.tc.product.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.tc.customer.model.vo.Customer;
import com.kh.tc.product.model.service.ProductService;
import com.kh.tc.product.model.vo.DetailCycle;

/**
 * Servlet implementation class detatilCycleServlet
 */
@WebServlet("/detailCycle")
public class detatilCycleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public detatilCycleServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cate  = request.getParameter("cate");
		int p_code = Integer.parseInt(request.getParameter("p_code"));
		int status = Integer.parseInt(request.getParameter("status"));
		int num =  Integer.parseInt(request.getParameter("num"));
		
		Customer loginUser = (Customer)(request.getSession().getAttribute("loginUser"));

		System.out.println(cate);
		System.out.println(p_code);
		System.out.println(status);
		
				
		DetailCycle dc = new ProductService().detailCycle(p_code,status,loginUser.getC_code(),num);
		
		request.setAttribute("dc", dc);
		request.setAttribute("cate", cate);
		request.setAttribute("num", num);
		request.getRequestDispatcher("/views/mypage/detailCycle.jsp").forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
