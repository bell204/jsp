package com.kh.tc.product.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.tc.customer.model.vo.Customer;
import com.kh.tc.product.model.service.ProductService;
import com.kh.tc.product.model.vo.Advertise;

/**
 * Servlet implementation class adApplyServlet
 */
@WebServlet("/adApply")
public class adApplyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public adApplyServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int p_code = Integer.parseInt(request.getParameter("p_code"));
		String ad_time =request.getParameter("ad_time");
		int ad_price =Integer.parseInt(request.getParameter("ad_price"));
		String p_name =request.getParameter("p_name");
		int odongcash =Integer.parseInt(request.getParameter("odongcash"));
		int total_price =Integer.parseInt(request.getParameter("total_price"));
		int ad_code =Integer.parseInt(request.getParameter("ad_code"));
		String ac_code = request.getParameter("acCode");
		Customer loginUser = (Customer)(request.getSession().getAttribute("loginUser"));

		String c_code = loginUser.getC_code();
		
		Advertise ad = new Advertise();
		ad.setTotal_price(total_price);
		ad.setP_code(p_code);
		ad.setAd_time(ad_time);
		ad.setOdongcash(odongcash);
		ad.setAd_price(ad_price);
		ad.setP_name(p_name);
		ad.setAd_code(ad_code);
		ad.setAc_code(ac_code);
		
		int result = new ProductService().buyAdvertise(ad,c_code);
		System.out.println(result);
		
		
		if(result>0) {
			response.sendRedirect("/p/myPage");
		}else {
			request.setAttribute("msg", "광고신청 결제실패!");
			request.getRequestDispatcher("/views/common/errorPage.jsp").forward(request, response);
		}









	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
