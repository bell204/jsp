<%@page import="com.kh.tc.notice.model.vo.notice"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% notice n =(notice)request.getAttribute("n");%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>

#A_Container_L {
	float: left;
	width: 200px;
}

#A_Container_C {
	width: 770px;
	float: left;
	overflow: hidden;
	margin-left:40px;
}

#A_Container {
	width: 1100px;
	margin: 0 auto;
	margin-top: 30px;
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
/*  */
.inputQnAPasswordContainer{
	float:left;
	width:800px;
	height:500px;
	/* border:1px solid black; */
}
.inputPassword{
	width:450px;
	height:250px;
	border:1px solid lightgray;
	margin-left:auto;
	margin-right:auto;
	margin-top:100px;
}
.showText{
	width:390px;
	/* border:1px solid red; */
	height:205px;
	margin-top:20px;
	margin-left:27px;
}
.inputTable{
	width:100%;
	height:50px;
	background:#e6e6e6;
}
.inputTable td{
	padding-left:15px;
}
.bottomBtn{
	width:100px;
	height:30px;
	background:#a5aac7;
	color:white;
	border:none;
	border-radius:10px;
}
.button{
	text-align:center;
}
</style>
<title>QnA 비밀번호</title>
</head>
<body>
<%@ include file="../common/header.jsp"%>
	<div id='A_Container_Wrap'>
		<div id='A_Container'>
			<%@ include file="communityleft.jsp"%>
			<!--  -->
			<div class="inputQnAPasswordContainer">
			<form action="<%= request.getContextPath() %>/selectOne.qna?com_code=<%= n.getCom_code() %>&com_name=<%= n.getCom_name() %>&fileName=<%= n.getFileName()%>"
			method="post">
			<div class="inputPassword">
			<div class="showText">
			<label style="font-size:20px;"><b>비밀글입니다.</b></label><br>
			<label>아래 등록 시 입력하신 비밀번호 입력해 주세요.</label>
			<br><br>
			<div class="password">
			<table class="inputTable">
				<tr>
				
				<td style="font-size:15px; ">비밀번호</td>
				<td><input type="password"name="QnAPassword" size="20"></td>
				</tr>
			</table>
			</div>
			<br>
			<div class="button">
			<!-- selectOne.qna -->
			<button class="bottomBtn">확인</button>
			<button class="bottomBtn">목록</button>
			
			</div>
			
			</div>	
			</div>
			</form>
			</div>
</div></div>
<%@ include file="../common/footer.jsp" %>			
</body>
</html>