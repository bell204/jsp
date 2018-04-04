<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 입력Form</title>
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

.InsertNoticeOuter{
	float:left;
	width:800px;
	height:700px;
}

.InsertForm{
		width:450px;
		height:350px;
		margin-left:100px;
	}
.insertTable{
	width:600px;
	height:500px;
	text-align:center;
}	
.bottomBtn{
	width:100px;
	height:30px;
	background:darkgray;
	color:white;
	border:none;
}
.bottom{
	margin-left:180px;
}
</style>
</head>
<body>
	<%@ include file="../common/header.jsp"%>
	<div id='A_Container_Wrap'>
		<div id='A_Container'>
			<%@ include file="communityleft.jsp"%>

			<!-- Container 시작 -->
			<% if (loginUser != null && loginUser.getC_id().equals("admin")) {%>
			<div class="InsertNoticeOuter">
			<h1 style="margin-left:30px;">공지사항 작성</h1>
			<div class="InsertForm">
			<form type="post" action="<%= request.getContextPath() %>/insertNotice.co">
			<table border="1" class="insertTable">
				<input type="hidden" value="<%= loginUser.getC_code()%>" name="userCode">
				<tr>
					<td>제목</td>
					<td colspan="3">
						<input type="text" size="50" name="title">
					</td>
				</tr>
				<tr>
					<td>작성자</td>
					<td>
						<input type="text" value="<%= loginUser.getC_name() %>" readonly name="writer">
						
					</td>
					<td>작성일</td>
					<td><input type="date" name="date"></td>
				</tr>
				<tr>
					<td colspan="4">내용</td>
				</tr>
				<tr>
					<td colspan="4" >
						<textarea name="content" rows="15" cols="85" style="border:1px solid lightgray;resize:none;"></textarea>
					</td>
				</tr>
			</table>
			<br>
			
			<div class="bottom">
				<button type="reset" class="bottomBtn">취소하기</button>
				<button type="submit" class="bottomBtn">등록하기</button>
			</div>
			</form>
			</div>
			</div>
			<%}%>
		</div></div>
		
		<%@ include file="../common/footer.jsp" %>
</body>
</html>