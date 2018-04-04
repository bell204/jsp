<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.kh.tc.customer.model.vo.Customer" %>   
<% ArrayList<Customer> coList = (ArrayList<Customer>)request.getAttribute("coList"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<style>

</style>
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
.blackArea{
	margin-top:50px;
	margin-bottom:auto;
	margin-left:auto;
	text-align:center;
}
</style>
</head>
<body>
<%@ include file="../common/header.jsp" %>
<% if(loginUser!= null && loginUser.getC_id().equals("admin")){ %>	
	<h2 align="center">탈퇴 신청 회원</h2>
	<table class="table1">
  		<tr>
  			<td><h5>탈퇴신청 회원 아이디</h5></td>
  			<td><h5>탈퇴이유</h5></td>
  			<td><h5>진행중인거래</h5></td>
  			<td><h5>오동캐쉬</h5></td>
  			
  		</tr>
  		<% for(int i =0 ; i < coList.size() ; i++){ %>
  		<tr class="tal">
  			<td class="tal0"><h5><%= coList.get(i).getC_id() %></h5></td>
  			<td id="tal1"><h5><%= coList.get(i).getDelete_reason() %></h5></td>
  			<td id="tal2"><h5><%= coList.get(i).getDealingCount() %></h5></td>
  			<td id="tal3"><h5><%= coList.get(i).getOdongCash() %></h5></td>
  			<input type="hidden" class="talId" value="<%=coList.get(i).getC_code() %>">
  		</tr>
  		<% } %>
  	</table>
	<script>
	/* $(document).on("#tal","click",function(){
		var talId = (this).children("#talId").text();
		location.href="/p/selecttalUserInfo.ad?talId="+talId;
	}); */
		
		$(".tal").click(function(){
			var talId = $(this).children(".talId").val();
			console.log(talId);
			location.href="/p/selecttalUserInfo.ad?talId="+talId;
		});
	</script>

<%}else{ 
	request.setAttribute("msg", "잘못된 경로로 접근하셨습니다.");
	request.getRequestDispatcher("../common/errorPage.jsp").forward(request, response);
}%>



	
	
	
</body>
</html>