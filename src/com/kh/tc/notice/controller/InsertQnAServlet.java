package com.kh.tc.notice.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.tc.common.MyFileRenamePolicy;
import com.kh.tc.file.model.service.fileService;
import com.kh.tc.file.model.vo.File;
import com.kh.tc.notice.model.service.noticeService;
import com.kh.tc.notice.model.vo.notice;
import com.oreilly.servlet.MultipartRequest;

@WebServlet("/insertQnA")
public class InsertQnAServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public InsertQnAServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (ServletFileUpload.isMultipartContent(request)) {
			int maxSize = 1024 * 1024 * 10;

			String fileRoot = request.getSession().getServletContext().getRealPath("/");
			System.out.println("fileRoot : " + fileRoot);

			String savePath = fileRoot + "QnA_UploadFiles/";
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8",
					new MyFileRenamePolicy());
			ArrayList<String> saveFiles = new ArrayList<String>();
			ArrayList<String> originFiles = new ArrayList<String>();
			Enumeration<String> files = multiRequest.getFileNames();

			String sec_file_name = "";// 보안
			String or_file_name = "";// 오리지날
			while (files.hasMoreElements()) {
				String name = files.nextElement();

				saveFiles.add(multiRequest.getFilesystemName(name));
				originFiles.add(multiRequest.getOriginalFileName(name));

				sec_file_name = saveFiles.get(0);
				or_file_name = originFiles.get(0);

				System.out.println("fileSystem : " + sec_file_name);
				System.out.println("originFile : " + or_file_name);

			}
			// 둘다 필요한 값들
			String userId = multiRequest.getParameter("userId");
			String QnApassword = multiRequest.getParameter("QnApassword");
			// 파일 DB INsert부분시작
			File qnaFile = new File();
			qnaFile.setFile_root(savePath);
			qnaFile.setSec_file_name(sec_file_name);
			qnaFile.setOr_file_name(or_file_name);
			qnaFile.setC_id(userId);
			qnaFile.setQnaPassword(QnApassword);
			ArrayList<File> fileList = new ArrayList<File>();
			for (int i = originFiles.size() - 1; i >= 0; i--) {
				File qnaFileList = new File();
				qnaFileList.setFile_root(savePath);
				qnaFileList.setSec_file_name(sec_file_name);
				qnaFileList.setOr_file_name(or_file_name);
				qnaFileList.setC_id(userId);
				qnaFile.setQnaPassword(QnApassword);
				fileList.add(qnaFileList);
			}
			int result = new fileService().insertQnAFile(qnaFile);

			if (result > 0) {
				HttpSession session = request.getSession();
				session.setAttribute("qnaFile", qnaFile);
				System.out.println("파일 넣기 성공");
			}
			// 파일 외부분
			String title = multiRequest.getParameter("title");
			String content = multiRequest.getParameter("content");
			String userCode = multiRequest.getParameter("userCode");
			notice n = new notice();
			n.setCom_name(title);
			n.setC_id(userId);
			n.setCom_content(content);
			n.setQnaPassword(QnApassword);
			n.setFileName(sec_file_name);
			// 파일 DB INsert부분 끝
			int insert = new noticeService().insertQnA(n, userCode);
			if (insert > 0) {
				System.out.println("qna 넣기 성공");
				HttpSession session = request.getSession();
				session.setAttribute("n", n);
				response.sendRedirect("/p/selectQnAList");
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
