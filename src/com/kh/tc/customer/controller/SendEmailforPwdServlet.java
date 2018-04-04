package com.kh.tc.customer.controller;

import java.io.IOException;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.tc.customer.model.service.CustomerService;

@WebServlet("/sendEmailforPwd")
public class SendEmailforPwdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public SendEmailforPwdServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String email = request.getParameter("email");
		String userId = request.getParameter("userId");
		System.out.println("email : " + email);
		String key = "pwd";
		String number = connectEmail(email);
		// String shaPwd = JDBCTemplet.getSha512(number);
		int result = new CustomerService().updatePwd(number, userId);
		String page = "";
		if (result > 0) {
			page = "/views/member/changePwd.jsp";
			request.setAttribute("number", number);
			request.setAttribute("userId", userId);
		} else {
			System.out.println("실패해떠");
		}
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	public String connectEmail(String email) {
		String to1 = email;
		String host = "smtp.naver.com";
		String subject = "발급된 임시비밀번호입니다.";
		String fromName = "오늘의 동료 관리자";
		String from = "ekdbs1220@naver.com";
		String authNum = authNum();
		String content = "임시비밀번호는 [" + authNum + "]입니다. 사이트로 돌아가서 변경해주세요";

		try {
			Properties props = new Properties();
			props.put("mail.smtp.starttls.enable", "true");
			props.put("mail.transport.protocol", "smtp");
			props.put("mail.smtp.host", host);
			props.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
			props.put("mail.smtp.port", "465");
			props.put("mail.smtp.user", from);
			props.put("mail.smtp.auth", "true");

			Session mailSession = Session.getInstance(props, new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication("ekdbs1220@naver.com", "dan2353"); // gmail계정
				}
			});

			Message msg = new MimeMessage(mailSession);

			InternetAddress[] address1 = { new InternetAddress(to1) };
			msg.setFrom(new InternetAddress(from, MimeUtility.encodeText(fromName, "utf-8", "B")));
			msg.setRecipients(Message.RecipientType.TO, address1); // 받는사람 설정
			msg.setSubject(subject); // 제목설정
			msg.setSentDate(new java.util.Date());
			msg.setContent(content, "text/html; charset=utf-8"); // 내용설정

			Transport.send(msg); // 메일보내기
		} catch (MessagingException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return authNum;

	}

	public static String authNum() {
		StringBuffer buffer = new StringBuffer();
		for (int i = 0; i <= 4; i++) {
			int num = (int) (Math.random() * 9 + 1);
			buffer.append(num);
		}
		return buffer.toString();
	}

}
