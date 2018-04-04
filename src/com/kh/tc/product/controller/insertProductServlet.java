package com.kh.tc.product.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.tc.common.MyFileRenamePolicy;
import com.kh.tc.product.model.service.ProductService;
import com.kh.tc.product.model.vo.product;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class insertProductServlet
 */
@WebServlet("/insertProduct")
public class insertProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public insertProductServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(ServletFileUpload.isMultipartContent(request)){
			//전송 파일 용량 제한 : 10M
			int maxSize = 1024 * 1024 * 10;
			
			//컨테이너의 루트 경로 추출
			String root = request.getSession().getServletContext().getRealPath("/");
			
			//파일을 저장할 경로 지정
			String savePath = root +"thumbnail_uploadFiles/";
			
		
			MultipartRequest multiRequest 
			= new MultipartRequest(request,savePath,maxSize,"UTF-8",
					new MyFileRenamePolicy());
			
		
			ArrayList<String> saveFiles = new ArrayList<String>();
			
	
			ArrayList<String> originFiles = new ArrayList<String>();
			
		
			Enumeration<String> files = multiRequest.getFileNames();
			
			while(files.hasMoreElements()){
				String name = files.nextElement();
			
				saveFiles.add(multiRequest.getFilesystemName(name));
				originFiles.add(multiRequest.getOriginalFileName(name));
		
			}
		
		
		
		String content = multiRequest.getParameter("content");
		String delivery = multiRequest.getParameter("delivery");
		String[] category = multiRequest.getParameterValues("category");
		String title = multiRequest.getParameter("title");
		String simplecontent = multiRequest.getParameter("simplecontent");
		String[] tell = multiRequest.getParameterValues("tell");
		String  g_date  = multiRequest.getParameter("g_date");
		String  g_time  = multiRequest.getParameter("g_time");
		String sellstate= multiRequest.getParameter("sellstate");
		String option1 = multiRequest.getParameter("option1");
		String c_code = multiRequest.getParameter("c_code");
		int price = Integer.parseInt(multiRequest.getParameter("price"));
		int sharecount = Integer.parseInt(multiRequest.getParameter("sharecount"));
		
		String[] arrOption = option1.split(",");
		
		String option = "";
		
		if(arrOption.length>1) {
		 for(int i=1;i<arrOption.length;i++) {
			 if(i==1) {
				 option+=arrOption[i];
			 }else {
				 option+=","+arrOption[i];
			 }
		 }
		}
		
		
		System.out.println(g_date);
		System.out.println(g_time);
		String p_deadline = g_date+" "+g_time;
		
		product p = new product();
		int cate_code = new ProductService().selectCate(category[0],category[1],category[2],category[3]);
		System.out.println(cate_code);
		
		if(cate_code>0) {
			p.setP_type(delivery);
			p.setCate_code(cate_code);
			p.setP_name(title);
			p.setP_simplecontent(simplecontent);
			p.setP_content(content);
			p.setP_share_count(sharecount);
			p.setPhone(tell[0]+tell[1]+tell[2]);
			p.setP_status(sellstate);
			p.setP_price(price);
			p.setC_code(c_code);
			p.setOption(option);
			p.setP_deadline(p_deadline);
			p.setSavePath(savePath);
			p.setOriginFiles(originFiles.get(0));
			p.setSaveFiles(saveFiles.get(0));
			
			int result = new ProductService().insertProduct(p,option);
			String page ="";
			if(result>0) {
				 page="/p/myPage";
			}else {
				request.setAttribute("msg", "상품등록 실패!");
				page="/views/common/errorPage.jsp";
			}
			response.sendRedirect(page);
			
		}else {
			System.out.println("카테고리코드 오류!");
		}
		
		/*System.out.println(content);
		System.out.println(delivery);
		System.out.println(category[0]+category[1]+category[2]+category[3]);
		System.out.println(title);
		System.out.println(simplecontent);
		System.out.println(tell[0]+tell[1]+tell[2]);
		System.out.println(g_date);
		System.out.println(g_time);
		System.out.println(sellstate);
		System.out.println(option);
		System.out.println("c_code :"+c_code);*/
	
		
	}else {
		System.out.println("안되");
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
