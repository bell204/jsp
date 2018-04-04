package com.kh.tc.file.controller;

import java.io.BufferedInputStream;
import java.io.FileInputStream;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.tc.file.model.service.fileService;

@WebServlet("/downloadQnAFile")
public class DownloadQnAFileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public DownloadQnAFileServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String fileName = request.getParameter("fileName");
		System.out.println("down 파일 이름 : " + fileName);
		com.kh.tc.file.model.vo.File qnaFile = new fileService().selectQnAFile(fileName);
		BufferedInputStream buf = null;
		ServletOutputStream downOut = null;
		downOut = response.getOutputStream(); //
		java.io.File downFile = new java.io.File(qnaFile.getFile_root() + qnaFile.getSec_file_name());

		response.setContentType("text/plane; charset=UTF-8");
		response.setHeader("Content-Disposition",
				"File; filename=\"" + new String(qnaFile.getOr_file_name().getBytes("UTF-8"), "ISO-8859-1") + "\"");
		response.setContentLength((int) (downFile.length()));
		FileInputStream fin = new FileInputStream(downFile);
		buf = new BufferedInputStream(fin);

		int readBytes = 0;
		while ((readBytes = buf.read()) != -1) {
			downOut.write(readBytes);
		}

		downOut.close();
		buf.close();

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
