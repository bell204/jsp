<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% Customer c1 = (Customer)request.getAttribute("c1"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
body{
	height:600px;
}
.blackArea{
	margin-top:20px;
	margin-right:auto;
	margin-left:auto;
	margin-bottom:50px;
	text-align:center;
}
table{
	border:4px solid black;
	margin-top:20px;
	margin-right:auto;
	margin-left:auto;
	text-align:center;
} 

</style>
</head>
<body>
<%@ include file="../common/header.jsp" %>
<% if(loginUser!= null && loginUser.getC_id().equals("admin")){ %>
			<br><br>
			<h2 align="center">탈퇴요청</h2>
			
			<table class="table11">
				<tr>
					<td>이름</td>
					<td name="title">
						<%= c1.getC_name() %>
					</td>
					<td>작성자</td>
					<td>
						<%= c1.getC_id() %>
					</td>
				</tr>
				
				<tr>
					<td>내용</td>
				</tr>
				<tr>
					<td colspan="4">
						<textarea rows="15" cols="60" readonly><%= c1.getDelete_reason() %></textarea>
					</td>
				</tr>
			</table>







	<div class="blackArea">
  		<input type="text" class="blackUserArea" placeholder="탈퇴 요청회원 아이디" value="<%= c1.getC_id() %>">
  		<button class="talUserBtn">탈퇴시키기</button> 
  	</div>
  	
  	<script>
  	
  	
  	$(function(){
  		$(".talUserBtn").click(function(){
  			var talId = $(".blackUserArea").val();
  			$.ajax({
  				url:"/p/talMember.ad",
  				type:"post",
  				data:{talId:talId},
  				success:function(data){
  					alert(talId+data);
  					location.href="/p/selectAllTalRequestMember.ad";
  				},
  				error:function(data){
  					alert(data);
  				}
  			});
  		});
  	});
</script>
<%}else{ 
	request.setAttribute("msg", "잘못된 경로로 접근하셨습니다.");
	request.getRequestDispatcher("../common/errorPage.jsp").forward(request, response);
}%>
</body>
</html>