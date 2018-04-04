package com.kh.tc.customer.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.MalformedURLException;
import java.net.ProtocolException;
import java.net.URL;
import java.net.URLConnection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.kh.tc.customer.model.service.CustomerService;
import com.kh.tc.customer.model.vo.Customer;
import com.kh.tc.customer.model.vo.GooglePojo;
import com.kh.tc.customer.model.vo.GsonUtility;

/**
 * Servlet implementation class googleLoginServlet
 */
@WebServlet("/googleLogin")
public class googleLoginServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;

   public googleLoginServlet() {
      super();
      // TODO Auto-generated constructor stub
   }

   protected void doGet(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
      String code = request.getParameter("code");
      if (code != null) {
         System.out.println("code : " + code);
         try {

            String urlParameters = "code=" + code + "&client_id="
                  + "587645688652-0msja98f50i52bm9178eleus8gk6uafs.apps.googleusercontent.com" + "&client_secret="
                  + "Co4lEqZPBcK1C7Nvz5kEahbH" + "&redirect_uri=" + "http://localhost:8001/p/googleLogin"
                  + "&grant_type=authorization_code";
            URL url = new URL("https://accounts.google.com/o/oauth2/token");

            URLConnection conn = url.openConnection();
            conn.setDoOutput(true);

            OutputStreamWriter writer = new OutputStreamWriter(conn.getOutputStream());
            writer.write(urlParameters);
            writer.flush();
            String line1 = "";
            BufferedReader reader = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            String line;
            while ((line = reader.readLine()) != null) {
               line1 = line1 + line;
            }
            String actoken = GsonUtility.getJsonElementString("access_token", line1);
            System.out.println(actoken);
            url = new URL("https://www.googleapis.com/oauth2/v1/userinfo?access_token=" + actoken);
            conn = url.openConnection();
            line1 = "";
            reader = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            while ((line = reader.readLine()) != null) {
               line1 = line1 + line;
            }
            GooglePojo data = (GooglePojo) new Gson().fromJson(line1, GooglePojo.class);
            writer.close();
            reader.close();

            Customer c = new CustomerService().selectOne(data.getId() + "g");
            String page = "";
            if (c != null) {
               HttpSession session = request.getSession();
               session.setAttribute("loginUser", c);
            } else {
               Customer c1 = new CustomerService().insertGoogle(data.getId(), data.getName(), data.getEmail(),
                     actoken);
               HttpSession session = request.getSession();
               session.setAttribute("loginUser", c1);

            }
            page = "/p/selectMain?num=1";
            response.sendRedirect(page);

         } catch (MalformedURLException e) {
            e.printStackTrace();
         } catch (ProtocolException e) {
            e.printStackTrace();
         } catch (IOException e) {
            e.printStackTrace();
         }

      } else {
         request.setAttribute("msg", "구글로그인실패!");
         request.getRequestDispatcher("/p/veiws/errorPage.jsp").forward(request, response);
      }

   }

   protected void doPost(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
   }
}