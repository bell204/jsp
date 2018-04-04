package com.kh.tc.message.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.google.gson.Gson;
import com.kh.tc.common.MyFileRenamePolicy;
import com.kh.tc.file.model.vo.File;
import com.kh.tc.message.model.service.MessageService;
import com.kh.tc.message.model.vo.Message;
import com.oreilly.servlet.MultipartRequest;

@WebServlet("/insertFileMessage.me")
public class InsertFileMessage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public InsertFileMessage() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		if(ServletFileUpload.isMultipartContent(request)){
			int maxSize = 1024 * 1024 * 10;
			
			String root = request.getSession().getServletContext().getRealPath("/");
			String savePath = root + "thumbnail_uploadFiles/";
			
			//객체 생성시 파일을 저장하고 그레 대한 정보를 가져오는 형태
			//즉, 파일의 정보를 검사하여 저장하는 형태가 아닌
			//저장한 다음 검사 후 삭제를 해야한다.
			
			//사용자가 올린 파일명을 그대로 저장하지 않는 것이 일반적이다.
			//1. 같은 파일명이 있는 경우 이전 파일을 덮어 쓸 수 있음
			//2. 한글로 된 파일명, 특수 기호나 띄어쓰기 등은 서버에 따라서 문제가 생길 수 도 있다.
			//DefaultFileRenamePolicy는 cos.jar안에 존재하는 클래스
			//같은 파일명이 존재하는지를 검사하고 있는 경우에는
			//파일명 뒤에 숫자를 붙여준다.
			//ex : aaa.zip, aaa1.zip, aaa2.zip
			
			//DefaultFileRenamePolicy
			//MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new DefaultFileRenamePolicy());
			
			//FileRenamePolicy상속 후 오버라이딩
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			//다중 파일을 묶어서 업로드를 하기 위해 컬렉션을 사용한다.
			//저장한 파일 이름을 저장할 ArrayList 생성
			ArrayList<String> saveFiles = new ArrayList<String>();
			
			//원본 파일의 이름을 저장할 ArrayList 를 생성
			ArrayList<String> originFiles = new ArrayList<String>();
			
			//파일이 전송된 폼의 이름을 반환한다.
			Enumeration<String> files = multiRequest.getFileNames();
			
			while(files.hasMoreElements()){
				String name = files.nextElement();
				
				//지정한 경로에 저장된 파일 시스템의 이름을 가져와서
				//ArrayList에 담는다.
				saveFiles.add(multiRequest.getFilesystemName(name));
				originFiles.add(multiRequest.getOriginalFileName(name));
			}
			//multipartRequest객체에서 파일 외의 값도 꺼내온다.
			String userId = multiRequest.getParameter("userId");
			String receveId = multiRequest.getParameter("receveId");
			
			//Board 객체생성
			Message m = new Message();
			m.setcCode(userId);
			m.setReceveCode(receveId);
			/*HttpSession session = request.getSession();
			Member m = (Member)(session.getAttribute("loginUser"));
			String uno =  String.valueOf(m.getUno());
			b.setbWriter(uno);*/
			String msgContent = originFiles.get(0);
			
			m.setMsgContent(msgContent);//
			
			//첨부파일 정보를 저장할 ArrayList 객체 생성
			File file1 = new File();
			
			file1.setFile_root(savePath);
			file1.setOr_file_name(originFiles.get(0));
			file1.setSec_file_name(saveFiles.get(0));
	
			//Sevice로 전송
			File file = new MessageService().insertFileMessage(m, file1);
			m.setFile_code(file.getFile_code());
			int result = new MessageService().insertMsg(m);

			if(file != null){
				System.out.println("insertFileMessageServlet 6");
				response.setContentType("application/json");
				new Gson().toJson(file, response.getWriter());
				
			}else{
				//실패시 저장된 사진을 삭제
				for(int i = 0 ; i < saveFiles.size();i++){
					//파일시스템에 저장된 이름으로 파일 객체 생성
					java.io.File failedFile = new java.io.File(savePath + saveFiles.get(i));
					//failedFile.delete();
					//true or false 리턴함
				}
			}	
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
