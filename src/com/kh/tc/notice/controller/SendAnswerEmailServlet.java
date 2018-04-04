package com.kh.tc.notice.controller;

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

@WebServlet("/sendAnswerEmail")
public class SendAnswerEmailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public SendAnswerEmailServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String c_code = request.getParameter("c_code");
		String email = new CustomerService().getEmail(c_code);
		String key = "pwd";
		String answer = connectEmail(email);
		String page = "";
		if (answer == "답변 완료") {
			page = "views/community/qnaDetail.jsp";
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
		String subject = "문의사항 답변입니다.";
		String fromName = "관리자";
		String from = "ekdbs1220@naver.com";
		String content = "이렇게 저렇게 하시면 됩니다 감자힙니다";

		// SMTP이용하기 위해 설정해주는 설정값들
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
					return new PasswordAuthentication("ekdbs1220@naver.com", "dan2353"); // naver계정
				}
			});

			Message msg = new MimeMessage(mailSession);
			InternetAddress[] address1 = { new InternetAddress(to1) };
			msg.setFrom(new InternetAddress(from, MimeUtility.encodeText(fromName, "utf-8", "B")));
			msg.setRecipients(Message.RecipientType.TO, address1); // 받는사람 설정
			msg.setSubject(subject); // 제목설정
			msg.setSentDate(new java.util.Date()); // 보내는 날짜 설정
			msg.setContent(content, "text/html; charset=utf-8"); // 내용설정

			Transport.send(msg); // 메일보내기
		} catch (MessagingException e) {
			e.printStackTrace();
		} catch (Exception e1) {
			e1.printStackTrace();
		}

		return "답변 완료";
	}
}
