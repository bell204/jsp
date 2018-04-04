<%@page import="com.kh.tc.notice.model.vo.notice"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% notice n = (notice)session.getAttribute("n"); %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">

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
.freeBoardInsertContainer{
	float:left;
	width:800px;
	height:1000px;
}

.insertTable{
	margin-left:130px;
	width:600px;
}
.insertTable td{
	border:1px solid lightgray;
	height:30px;
}
.bottomBtn{
	margin-left:290px;
}
.bottomBtn button{
	border:none;
	background:#99bbff;
	border-radius:10px;
	color:white;
	width:130px;
	height:30px;
}
</style>
<title>자유게시판 작성</title>
</head>
<body>
<%@ include file="../common/header.jsp"%>
	<div id='A_Container_Wrap'>
		<div id='A_Container'>
			<%@ include file="communityleft.jsp"%>
			<!--  -->
			
			<div class="freeBoardInsertContainer">
			<h1 style="margin-left:30px;">건의사항 수정</h1>
			<div class="InsertArea">
			<form type="post" action="<%= request.getContextPath()%>/updateUserRequest">
			<table class="insertTable">
				<input type="hidden" value="<%= n.getCom_code() %>" name="com_code"> 
				<tr>
					<td>제목</td>
					<td colspan="3">
						<input type="text" size="50" name="title">
					</td>
				</tr>
				<tr>
					<td>카테고리</td>
					<td colspan="3">
						<select name="category_name">
							<option value="시간">시간</option>
							<option value="재능">재능</option>
							<option value="물건">물건</option>
							<option value="공간">공간</option>
							<option value="차량">차량</option>
							
						</select>
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
						<textarea name="content" rows="15" cols="85" style="resize:none; border:1px solid lightgray;"></textarea>
					</td>
				</tr>
			</table>
			<br>
			<div class="bottomBtn">
			<button type="reset">취소하기</button>
			<button type="submit">수정하기</button>			
			</div>
			</form>
			</div>
			</div>
</div></div>			
</body>
</html>