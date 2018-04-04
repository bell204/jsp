package com.kh.tc.file.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.tc.common.MyFileRenamePolicy;
import com.kh.tc.customer.model.service.CustomerService;
import com.kh.tc.customer.model.vo.Customer;
import com.kh.tc.file.model.service.fileService;
import com.kh.tc.file.model.vo.File;
import com.oreilly.servlet.MultipartRequest;

@WebServlet("/insertProfileImg")
public class InsertProfileImgServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public InsertProfileImgServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (ServletFileUpload.isMultipartContent(request)) {
			int maxSize = 1024 * 1024 * 10;
			String root = request.getSession().getServletContext().getRealPath("/");
			System.out.println("root : " + root);

			// 저장된 파일 루트
			String savePath = root + "profile_Images/";
			System.out.println("savePath : " + savePath);
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8",
					new MyFileRenamePolicy());
			ArrayList<String> saveFiles = new ArrayList<String>();
			ArrayList<String> originFiles = new ArrayList<String>();
			Enumeration<String> files = multiRequest.getFileNames();

			String sec_file_name = "";
			String or_file_name = "";
			while (files.hasMoreElements()) {
				String name = files.nextElement();

				System.out.println("name : " + name);
				// 지정한 경로에 저장된 파일 시스템의 이름을 가져와서
				// arrayList에 담는다.
				saveFiles.add(multiRequest.getFilesystemName(name));

				originFiles.add(multiRequest.getOriginalFileName(name));

				sec_file_name = multiRequest.getFilesystemName(name);
				System.out.println("보안된 파일명 : " + sec_file_name);
				or_file_name = multiRequest.getOriginalFileName(name);
				System.out.println("원래 파일명 : " + or_file_name);
				/*
				 * System.out.println("파일명(보안된) : " + multiRequest.getFilesystemName(name));
				 * System.out.println("원래파일명 : " + multiRequest.getOriginalFileName(name));
				 */
			}

			String userId = multiRequest.getParameter("userId");

			File profileFile = new File();
			profileFile.setFile_root(savePath);
			profileFile.setSec_file_name(sec_file_name);
			profileFile.setOr_file_name(or_file_name);
			profileFile.setC_id(userId);

			System.out.println("profileFile 따로 넣은것만 : " + profileFile);
			// 파일 받아오기 가능 디비에 넣기만 하면됨
			ArrayList<File> fileList = new ArrayList<File>();
			for (int i = originFiles.size() - 1; i >= 0; i--) {
				File profileFileList = new File();
				profileFileList.setFile_root(savePath);
				profileFileList.setSec_file_name(sec_file_name);
				profileFileList.setOr_file_name(or_file_name);
				profileFileList.setC_id(userId);
				fileList.add(profileFile);
			}

			System.out.println(fileList);
			int result = new fileService().insertProfilImg(profileFile, userId);
			if (result > 0) {
				HttpSession session = request.getSession();
				session.setAttribute("profileFile", profileFile);
			} else {
				System.out.println("실패됨 짜증");
			}

			// 자격증/경력사항등 넣기

			String intro_title = multiRequest.getParameter("intro_title");
			System.out.println("뀨");
			String certifi_name = multiRequest.getParameter("certifi_name");
			String career = multiRequest.getParameter("career");
			String introduce = multiRequest.getParameter("introduce");

			Customer c = new Customer();
			c.setC_id(userId);
			c.setIntro_title(intro_title);
			c.setCerti_name(certifi_name);
			c.setCareer(career);
			c.setIntroduce(introduce);
			int update = new CustomerService().updateOtherInfo(c);
			int i = 2;
			String page = "";
			if (update > 0) {
				// response.sendRedirect("views/member/myPage.jsp");
				page = "/login?num=" + i;
			} else {
				request.getRequestDispatcher("views/member/profilechange.jsp").forward(request, response);
			}
			RequestDispatcher view = request.getRequestDispatcher(page);
			view.forward(request, response);
			// 여기까지

		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
