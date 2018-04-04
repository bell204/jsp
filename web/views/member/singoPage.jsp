<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String singoId = String.valueOf(request.getAttribute("singoId")); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
#A_Container_L {
	float: left;
	width: 200px;
}
#A_Container_C {
	width: 770px;
	float: left;
	overflow: hidden;
}
#A_Container {
	width: 1000px;
	margin: 0 auto;
	margin-top: 50px;
	margin-bottom: 20px;
	clear: both;
	overflow: hidden;
	min-height: 500px;
}
#A_Container_Wrap {
	width: 100%;
	clear: both;
	height: 100%;
}
table{
}
table td{
	border:4px solid black;
	padding:7px;
}
.boxbox{
	margin-left:auto;
	margin-right:auto;	
	text-align:center;
	text-align:center;
}
#TB_1{
	width: 510px;
	margin-left:auto;
	margin-right:auto;
	border:4px solid black;
	whidth:auto;
}
</style>
</head>
<body>
	<%@ include file="../common/header.jsp"%>
	<div id='A_Container_Wrap'>
		<div id='A_Container'>
			<%@ include file="../mypage/mypageleft.jsp"%>
			<div class="boxbox">
				<h2>신고하기</h2>
			<!-- <form action="p/singohagi.si" method="post"> -->
				<h4>신고할 회원 : <%= singoId %></h4>
			</div>
				<br><br>
				<div>
				<table id="TB_1">
					<tr>
						<td>제목</td>
						<td >
							<input type="text" size="30" id="title11" name="title">
						</td>
					</tr>
					<tr>
						<td>내용</td>
						<td colspan="3">
							<textarea rows="15" cols="60" id="content11" name="content" style="resize:none"></textarea>
						</td>
					</tr>
				</table>
				</div>
				<br>
			<!-- </form>	 -->
				<div align="center">
					<button type="reset">취소하기</button>
					<button type="submit" onclick="singo();">신고하기</button>
				</div>
		</div>
	</div>
	<%@ include file="../common/footer.jsp"%>
	<script>
	$(function(){
		var singoId="<%= singoId %>";
		console.log(singoId);
	});
	$(function(){
		var count = 0;
		if(count != 0){
			return true;
		}else{
			return false;
		}
	});
	function singo(){
		var singoId="<%= singoId %>";
		var content = $("#content11").val();
		var title = $("#title11").val();
		var cCode = "<%= loginUser.getC_code() %>";
		console.log(singoId);
		console.log(content);
		console.log(title);
		$.ajax({
			url:"/p/insertSingo.si",
			type:"post",
			data:{singoId:singoId,content:content,title:title, cCode:cCode},
			success:function(data){
				alert(data);
				location.href="/p/views/main/Realmain.jsp";
			},
			error:function(data){
				alert(data);
				location.href="/p/views/main/Realmain.jsp";
			}
		});
	}
	</script>
</body>
</html>