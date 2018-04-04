package com.kh.tc.product.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.tc.product.model.service.ProductService;
import com.kh.tc.product.model.vo.product;

/**
 * Servlet implementation class selectProductServlet
 */
@WebServlet("/select.po")
public class selectProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public selectProductServlet() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String cate1 = request.getParameter("cate1");
		String cate2 = request.getParameter("cate2");
		String cate3 = request.getParameter("cate3");
		String cate4 = request.getParameter("cate4");
		String keyword = request.getParameter("keyword");
		System.out.println(keyword);
		if(keyword==null) {

		ArrayList<String> cateList = new ProductService().selectCategory(cate1, cate2, cate3, cate4);
		ArrayList<product> proList = new ProductService().selectPro(cate1, cate2, cate3, cate4);

		String page = "";
		if (cateList != null && cate3 == null) {
			request.setAttribute("cateList", cateList);
			request.setAttribute("proList", proList);

			page = "/views/product/sellpage.jsp";

		} else if (cateList != null && cate3 != null) {

			request.setAttribute("cateList", cateList);
			request.setAttribute("proList", proList);
			request.setAttribute("cate4", cate4);

			page = "/views/product/sellpage2.jsp";

		} else {
			request.setAttribute("msg", "카테고리 셀페이지이동불가!!");
			page = "/views/common/errorPage.jsp";
		}
	

		request.getRequestDispatcher(page).forward(request, response);
		}else {
			
			
			ArrayList<String> cateList = new ArrayList<String>();
			ArrayList<product> proList = new ProductService().searchProduct(keyword);
			System.out.println(proList.size());
			
			request.setAttribute("proList", proList);
			request.setAttribute("cateList", cateList);
			request.setAttribute("keyword", keyword);
			
			request.getRequestDispatcher("/views/product/sellpage.jsp").forward(request, response);
			
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
