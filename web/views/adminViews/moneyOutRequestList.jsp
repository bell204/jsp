<%@page import="com.kh.tc.IncomeRecord.model.vo.IncomeRecord"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% ArrayList<IncomeRecord> cList = (ArrayList<IncomeRecord>)request.getAttribute("cList"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>

body{
height:800px;
}
table{
	border:1px solid black;
	width:700px;
	height:auto;
	margin-top:50px;
	margin-bottom:auto;
	margin-left:auto;
	margin-right:auto;
	text-align:center;
}
table tr{
	border:1px solid black;
	height:30px;
}

</style>
</head>
<body>
<%@ include file="../common/header.jsp" %>
<% if(loginUser!= null && loginUser.getC_id().equals("admin")){ %>
<h2 align="center">출금신청</h2>
<table align="center">
	<tr>
		<td>신청자</td>
		<td>신청금액</td>
		<td>신청날짜</td>
		<td>출금수수료</td>
		<td></td>
		<td></td>		
	</tr>
	<% for(int i = 0; i < cList.size(); i++){ %>
	<tr>
		<td><%= cList.get(i).getC_code() %></td>
		<td><%= cList.get(i).getOut_come() %></td>
		<td><%= cList.get(i).getIn_date() %></td>
		<td><%= cList.get(i).getOut_tax() %></td>
		<td><button class="cg">출금해주기</button></td>
		<td><input type="hidden" id="inC" value="<%= cList.get(i).getIn_come() %>"></td>
	</tr>
	<% }%>
</table>

<script>
$(".cg").click(function(){
	var inCode = $(this).parent().parent().children().children("#inC").val();
	console.log(inCode);
	$.ajax({
		url:"/p/outMoney.ad",
		type:"get",
		data:{inCode:inCode},
		success:function(data){
			alert(data);
			location.href="/p/selectAllMoneyOutRequest.ad";
		},
		error:function(data){
			alert(data);
		} 
	});
});
</script>
<%}else{ 
	request.setAttribute("msg", "잘못된 경로로 접근하셨습니다.");
	request.getRequestDispatcher("../common/errorPage.jsp").forward(request, response);
}%>
</body>
</html>