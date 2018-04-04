package com.kh.tc.customer.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.tc.customer.model.service.CustomerService;
import com.kh.tc.customer.model.vo.Customer;

/**
 * Servlet implementation class naverLoginServlet
 */
@WebServlet("/naverLogin")
public class naverLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	public naverLoginServlet() {
		super();
		// TODO Auto-generated constructor stub
	}


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		Customer c = null;
		Customer c1 = null;
		String clientId = "jtu5ZnMavJLLrOoY0CYt";//애플리케이션 클라이언트 아이디값";
		String clientSecret = "qhSwrZ8jjH";//애플리케이션 클라이언트 시크릿값";
		String code = request.getParameter("code");
		String state = request.getParameter("state");
		String redirectURI = URLEncoder.encode("http://localhost:8001/p/naverLogin", "UTF-8");
		String apiURL;
		apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&";
		apiURL += "client_id=" + clientId;
		apiURL += "&client_secret=" + clientSecret;
		apiURL += "&redirect_uri=" + redirectURI;
		apiURL += "&code=" + code;
		apiURL += "&state=" + state;
		String token=null;
		String[] arrtoken =null;
		int check1=0;
		try {
			URL url = new URL(apiURL);
			HttpURLConnection con = (HttpURLConnection)url.openConnection();
			con.setRequestMethod("GET");
			int responseCode = con.getResponseCode();
			BufferedReader br;
			check1=responseCode;
			if(responseCode==200) { // 정상 호출
				br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			} else {  // 에러 발생
				br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			}
			String inputLine;
			while ((inputLine = br.readLine()) != null) {
				token+=inputLine;
			}
			br.close();

		} catch (Exception e) {
			System.out.println(e);
		}

		arrtoken = token.split("\"");
		String actoken= arrtoken[3];
		String retoken=  arrtoken[7];



		//1차 로그인 판별
		if(check1==200) {

			String token1 = actoken;// 네이버 로그인 접근 토큰;
			String header = "Bearer " + token1; // Bearer 다음에 공백 추가
			String[] arrprofile = null;
			String profile="";
			try {
				String apiURL1 = "https://openapi.naver.com/v1/nid/me";
				URL url = new URL(apiURL1);
				HttpURLConnection con = (HttpURLConnection)url.openConnection();
				con.setRequestMethod("GET");
				con.setRequestProperty("Authorization", header);
				int responseCode = con.getResponseCode();
				BufferedReader br;
				if(responseCode==200) { // 정상 호출
					br = new BufferedReader(new InputStreamReader(con.getInputStream()));
				} else {  // 에러 발생
					br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
				}
				String inputLine;
				// StringBuffer response1 = new StringBuffer();
				while ((inputLine = br.readLine()) != null) {
					profile+=inputLine;
				}
				br.close();

			} catch (Exception e) {
				System.out.println(e);
			}

			if(!actoken.equals("invalid_request")) {
				arrprofile = profile.split("\"");

				String message=arrprofile[7];
				String id = arrprofile[13];
				String gender =arrprofile[17];
				String email= arrprofile[21];


				if(message.equals("success")) {

					c = new CustomerService().selectOne(id);
					if(c !=null) {
						HttpSession session = request.getSession();
						session.setAttribute("loginUser", c);

					
					}else {
						c1 = new CustomerService().insertNaver(id, email, actoken);
						
						HttpSession session = request.getSession();
						session.setAttribute("loginUser", c1);
					

					}
					
					response.sendRedirect("/p/views/main/Realmain.jsp");


				}else {
					request.setAttribute("msg", "프로필 조회 실패!");
					request.getRequestDispatcher("/views/main/errorPage.jsp").forward(request, response);
				}
		

		}else {
			request.setAttribute("msg", "네이버로그인 실패!");
			request.getRequestDispatcher("/views/main/errorPage.jsp").forward(request, response);
		}
		}







	}











	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
