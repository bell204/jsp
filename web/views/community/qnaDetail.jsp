<%@page import="com.kh.tc.file.model.vo.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.kh.tc.notice.model.vo.notice"%>
<% notice n = (notice)session.getAttribute("n"); %> 
<% File qnaFile =(File)session.getAttribute("qnaFile"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의사항 상세내용</title>
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
.qnaDetailContainer{
	float:left;
	width:800px;
	height:750px;

}
.qnaDetailTable{
	width:600px;
	margin-left:50px;
	border:1px solid darkgray;
}
.qnaDetailTable th{
	padding-left:15px;
	width:100px;
	height:30px;
	border:1px solid lightgray;
}
.qnaDetailTable tr{
	border:1px solid lightgray;
}
</style>
</head>
<body>
<%@ include file="../common/header.jsp"%>
	<div id='A_Container_Wrap'>
		<div id='A_Container'>
			<%@ include file="communityleft.jsp"%>
			<!--  -->
			
			<div class="qnaDetailContainer">
			<h1 style="margin-left:30px;">Q&A 내용</h1>
			<table class="qnaDetailTable">
			<tr>
				<th>제목</th>
				<td colspan="3"><label><%= n.getCom_name() %></label></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td><label><%= n.getC_id() %></label>
				<th>작성일</th>
				<td><%= n.getCom_date() %></td>
			</tr>
			<tr>
				<th colspan="4">내용</th>
			</tr>
			<tr>
				<td colspan="4"><textarea rows="15" cols="70" style="resize:none; border:1px solid lightgray;
				margin-left:60px;"><%= n.getCom_content() %></textarea>
			</tr>
			<tr>
				<th colspan="1">파일첨부</th>
				<td><label><%= qnaFile.getSec_file_name() %></label></td>
				<td colspan="2">
					<label id="downLoad" style="background:#a5aac7; color:white; border:none; border-radius:5px;
					width:100px; height:25px; margin-left:10px;padding-left:23px; padding-top:2px;"
					>다운로드</label>
				</td>
			</tr>
			</table>
			<br>
			<button style="background:#a5aac7; color:white; border:none; border-radius:5px;
					width:100px; height:25px; margin-left:300px;" onclick="location.href='/p/selectQnAList'">목록</button>
			<% if(loginUser.getC_id().equals("admin")){ %>
			<button id="answer" style="background:#99bbff; color:white; border:none; border-radius:5px;
					width:100px; height:25px; float:right; margin-right:150px;">답변하기</button>				
			<%}%>
			<input type="hidden" id="c_code" value="<%= n.getC_code()%>">
			</div>
</div></div>
<%@ include file="../common/footer.jsp" %>	
<script>
	$(function(){
		$("#downLoad").click(function(){
			var password=$("#password").val();
			location.href="<%= request.getContextPath()%>/downloadQnAFile?fileName=<%= qnaFile.getSec_file_name()%>"; 
		});
		$("#answer").click(function(){
			var c_code=$("#c_code").val();
			console.log(c_code);
			location.href="<%= request.getContextPath()%>/sendAnswerEmail?&c_code="+c_code; 
		});
 		
	});
</script>		
</body>
</html>