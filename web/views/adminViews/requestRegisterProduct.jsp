<%@page import="java.util.ArrayList"%>
<%@page import="com.kh.tc.product.model.vo.product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% ArrayList<product> prList = (ArrayList<product>)request.getAttribute("prList"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
body{
height:800px;
}

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
</style>
</head>
<body>
<%@ include file="../common/header.jsp" %>
<% if(loginUser!= null && loginUser.getC_id().equals("admin")){ %>
<table class="table1">
  		<tr>
  			<td><h5>등록유저</h5></td>
  			<td><h5>상품제목</h5></td>
  			<td><h5>상품타입</h5></td>
  			<td><h5>등록일자</h5></td>
  		</tr>
  		<% for(int i =0 ; i < prList.size() ; i++){ %>
  		<tr class="tal">
  			<td id="tal"><h5 id="talId"><%= prList.get(i).getC_code() %></h5></td>
  			<td id="tal1"><h5><%= prList.get(i).getP_name() %></h5></td>
  			<td id="tal2"><h5><%= prList.get(i).getP_type() %></h5></td>
  			<td id="tal3"><h5><%= prList.get(i).getP_date() %></h5></td>
			<input type="hidden" id="pCode" value="<%= prList.get(i).getP_code() %>">
  		</tr>
  		<% } %>
  	</table>
  	<script>
  		$(".tal").click(function pA(){
  			var p_code = $(this).children("#pCode").val();
  			console.log(p_code);
  			location.href="/p/selldetail?p_code="+p_code;//상품 상세페이지 (버튼 만들고 admin_yn = 'n'로 만들어주기)
  		});
  	</script>

<%}else{ 
	request.setAttribute("msg", "잘못된 경로로 접근하셨습니다.");
	request.getRequestDispatcher("../common/errorPage.jsp").forward(request, response);
}%>
</body>
</html>