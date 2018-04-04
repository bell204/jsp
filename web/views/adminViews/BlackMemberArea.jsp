<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.kh.tc.notice.model.vo.notice"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% ArrayList<notice> list  = (ArrayList<notice>)request.getAttribute("noList"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style>
.table1{
	border:1px solid black;
	width:700px;
	height:auto;
	margin-top:50px;
	margin-bottom:auto;
	margin-left:auto;
	margin-right:auto;
	text-align:center;
}

.table1 td{
	border:1px solid black;
	height:30px;
}	
.blackArea{
	margin-top:50px;
	margin-bottom:auto;
	margin-left:auto;
	text-align:center;
}
</style>
<body>
<%@ include file="../common/header.jsp" %>
<% if(loginUser!= null && loginUser.getC_id().equals("admin")){ %>
<h2 align="center">신고 회원 리스트</h2>
	<table class="table1">
  		<tr>
  			<td><h5>신고한유저</h5></td>
  			<td><h5>신고제목</h5></td>
  			<td><h5>신고날짜</h5></td>
  			<td><h5>신고당항유저</h5></td>
  		</tr>
  		<% for(int i =0; i < list.size(); i++){%>
  		<tr class="detail11">
  			<td><h5><%= list.get(i).getC_code() %></h5></td>
  			<td><h5><%= list.get(i).getCom_name() %></h5></td>
  			<td><h5><%= list.get(i).getCom_date() %></h5></td>
  			<td><h5 id="singo"><%= list.get(i).getQnaPassword() %></h5></td>
  			<td><input type="hidden" class="com_num" value="<%= list.get(i).getCom_code() %>"></td>
  		</tr>
  		<% } %>
  	</table>

 	<script>
 		$(".detail11").click(function detail(){
 			var comCode = $(this).children().children(".com_num").val();
 			console.log(comCode);
 			location.href="/p//blackMember.ad?comCode="+comCode;
 		});
 	</script>
  	
<%}else{ 
	request.setAttribute("msg", "잘못된 경로로 접근하셨습니다.");
	request.getRequestDispatcher("../common/errorPage.jsp").forward(request, response);
}%>
</body>
</html>