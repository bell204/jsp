<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String userId= (String)request.getAttribute("userId"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디</title>
<style>
.showIdContainer{
	width:800px;
	height:400px;
	margin-left:auto;
	margin-right:auto;
}
.searchIdTitle{
	font-family: 'LotteMartDream';
	font-size:25px;
	border-bottom:2px solid #336699;
}
.showId{
	width:780px;
	height:100px;
	border:1px solid lightgray;
}
.id{
	width:600px;
	height:80px;
	margin-left:auto;
	margin-right:auto;
	margin-top:20px;
}
#Id{
	font-family: 'LotteMartDream';
	font-size:15px;
}
.bottomBtns{
	text-align:center;
}
.gobtn{
	width:130px;
	height:30px;
	background:#336699;
	color:white;
	border:none;
	
	border-radius:10px;
}
</style>
</head>
<body>
<%@ include file="../common/header.jsp" %>
<br>
<div class="showIdContainer">
<label class="searchIdTitle">아이디 찾기</label><br><br>
<label style="font-family: 'LotteMartDream';">고객님의 정보와 일치하는 아이디입니다.</label>
<br><br>
<div class="showId">
<div class="id">
<br>
	<label id="Id">*고객님의 아이디는 "<span style="color:#ff1a1a"><%= userId %></span>" 입니다.</label>
</div>
</div>
<br><br>
<div class="bottomBtns">
<button class="gobtn" onclick="location.href='/p/views/member/login.jsp'">로그인하러가기</button>
<button class="gobtn" onclick="location.href='/p/views/member/searchIdPwd.jsp'">비밀번호 찾기</button>
</div>
</div>

<%@ include file="../common/footer.jsp" %>
</body>
</html>