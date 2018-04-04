<%@page import="com.kh.tc.notice.model.vo.notice"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% notice n = (notice)request.getAttribute("n"); %>    
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
			
			<div class="noticeDetailContainer">
			<h1>공지사항 내용</h1>
			<table class="tableArea">
				<tr>
					<td style="text-align:center;">제목</td>
					<td colspan="3">
						<label><%= n.getCom_name() %></label>
					</td>
				</tr>
				<tr>
					<td style="text-align:center;">작성자</td>
					<td>
					<!-- <input type="text" readonly> -->
					<label>관리자</label>
					</td>
					<td style="text-align:center;">작성일</td>
					<td><label><%= n.getCom_date() %></label></td>
				</tr>
				<tr>
					<td colspan="4" style="text-align:center;">내용</td>
				</tr>
				<tr>
					<td colspan="4">
						<textarea rows="15" cols="85"  readonly style="resize:none; border:1px solid lightgray;">
						<%= n.getCom_content()%>
						</textarea>
					</td>
				</tr>
			</table>
			<br>
			<% if(loginUser !=null && loginUser.getC_id().equals("admin")){ %>
			<div align="center">
			<button onclick="location.href='/p/views/community/noticeUpdate.jsp'">수정하기</button>
			<button onclick="location.href='<%= request.getContextPath()%>/deleteNotice?com_code=<%=n.getCom_code()%>'">삭제하기</button> 
			</div>
			<%} %>
			</div>
</div></div>

<%@ include file="../common/footer.jsp" %>
</body>
</html>