package com.kh.tc.product.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.tc.product.model.vo.Advertise;

/**
 * Servlet implementation class advertiseProductServlet
 */
@WebServlet("/advertiseImport")
public class advertiseProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public advertiseProductServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int totalprice = Integer.parseInt(request.getParameter("totalprice"));
		int p_code =Integer.parseInt(request.getParameter("p_code"));
		String p_time =request.getParameter("p_time");
		int odongcash = Integer.parseInt(request.getParameter("odongcash"));
		int ad_price= Integer.parseInt(request.getParameter("ad_price"));
		String p_name =request.getParameter("p_name");
		int ad_code = Integer.parseInt(request.getParameter("ad_code"));
		
		Advertise ad = new Advertise();
		ad.setTotal_price(totalprice);
		ad.setP_code(p_code);
		ad.setAd_time(p_time);
		ad.setOdongcash(odongcash);
		ad.setAd_price(ad_price);
		ad.setP_name(p_name);
		ad.setAd_code(ad_code);
		
		
		request.setAttribute("ad", ad);
		request.getRequestDispatcher("/views/advertise/importAdvertise.jsp").forward(request, response);
		


	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
