<%@page import="com.kh.tc.notice.model.vo.notice"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
notice n = (notice)request.getAttribute("n"); 
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
.table1{
	border:4px solid black;
	width:700px;
	height:400px;
	margin-top:50px;
	margin-bottom:auto;
	margin-left:auto;
	margin-right:auto;
	text-align:center;
}
.table1 td{
	border:1px solid black;
}
</style>
</head>
<body>
<%@ include file="../common/header.jsp" %>
<% if(loginUser!= null && loginUser.getC_id().equals("admin")){ %>
	<br>
	<h2 align="center">신고내용</h2>
	<table class="table1">
  		<tr>
			<td>블랙여부</td>
			<td>
				<span id="black_yn">N</span>
			</td>
			<td>제목</td>
			<td colspan="3">
				<span><%= n.getCom_name() %></span>
			</td>
		</tr>
		<tr>
			<td>신고자</td>
			<td>
				<span><%= n.getC_id() %></span>
			</td>
			<td>신고당한사람</td>
			<td>
				<span><%= n.getQnaPassword() %></span>
			</td>
			<td>작성일</td>
			<td>
				<span><%= n.getCom_date() %></span>
			</td>
		</tr>
		<tr>
			<td colspan="6">내용</td>
		</tr>
		<tr>
			<td colspan="6" rowspan="6">
				<p id="content" ><%= n.getCom_content() %></p>
			</td>
		</tr>
		<tr></tr>
  	</table>
  	<br><br>
  	<div class="blackArea" align="center">
  		<input type="text" class="blackUserArea" placeholder="블랙 회원 아이디" value="<%= n.getQnaPassword() %>">
  		<button class="talUserBtn">블랙시키기</button> 
  	</div>
  	
  	<script>
  		$(function(){
  			$(".talUserBtn").click(function(){
  			var userId = "<%= n.getQnaPassword() %>";
  				$.ajax({
  					url:"/p/Black.ad",
  					type:"post",
  					data:{userId:userId},
  					success:function(data){
  						alert(data);
  						location.href="/p/selectBlackRequest.ad";
  					},
  					error:function(data){
  						alert(data);
  						location.href="/p/selectBlackRequest.ad";
  					}
  				});
  			});
  		});
  	
  	</script>
	
<%
}else{ 
	request.setAttribute("msg", "잘못된 경로로 접근하셨습니다.");
	request.getRequestDispatcher("../common/errorPage.jsp").forward(request, response);
}
%>
</body>
</html>