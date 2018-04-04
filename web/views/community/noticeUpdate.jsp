<%@page import="com.kh.tc.notice.model.vo.notice"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% notice n = (notice)session.getAttribute("n"); %>
<% int num = (int)session.getAttribute("num"); %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 세부페이지</title>
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
.noticeDetailContainer{
	float:left;
	width:800px;
	height:600px;
	/* border:1px solid black; */
}

.tableArea{
	margin-left:100px;
	width:600px;
}
.tableArea td{
	border:1px solid lightgray;
	
	height:30px;
}
</style>
</head>
<body>
<%@ include file="../common/header.jsp"%>
	<div id='A_Container_Wrap'>
		<div id='A_Container'>
			<%@ include file="communityleft.jsp"%>
			<!--  -->
			<% if(loginUser !=null && loginUser.getC_id().equals("admin")){ %>
			<div class="noticeDetailContainer">
			<h1>공지사항 내용</h1>
			<form type="post" action="<%= request.getContextPath()%>/updateNotice">
			<table class="tableArea">
				<tr>
				<input name="com_code" type="hidden" value="<%= n.getCom_code()%>"> 
				<input name="num" type="hidden" value="<%= session.getAttribute("num")%>"> 
					<td style="text-align:center;">제목</td>
					<td colspan="3">
						<input type="text" name="title">
					</td>
				</tr>
				<tr>
					<td style="text-align:center;">작성자</td>
					<td>
					<!-- <input type="text" readonly> -->
					<label><%= loginUser.getC_name() %></label>
					</td>
					<td style="text-align:center;">수정일</td>
					<td><input type="date" name="updateDate"></td>
				</tr>
				<tr>
					<td colspan="4" style="text-align:center;">내용</td>
				</tr>
				<tr>
					<td colspan="4">
						<textarea name="content" rows="15" cols="85"  style="resize:none; border:1px solid lightgray;"></textarea>
					</td>
				</tr>
			</table>
			<br>
			
			<div align="center">
			<button type="reset">취소하기</button>
			<button type="submit">완료하기</button>
			</div>
			</form>
			</div>
			<%} %>
</div></div>

<%@ include file="../common/footer.jsp" %>
</body>
</html>