<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의사항 입력</title>
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
.qnaInsertContainer{
	float:left;
	width:800px;
	height:700px;
}
.insertTable{
	width:750px;
	margin-left:30px;
}
.insertTable th{
	padding-left:10px;
	height:40px;
	width:80px;
	border:1px solid darkgray;
}
.insertTable td{
	padding-left:10px;
}
.insertTable tr{
border:1px solid darkgray;
}

.bottomBtn{
	float:right;
}
</style>
</head>
<body>
<%@ include file="../common/header.jsp"%>
	<div id='A_Container_Wrap'>
		<div id='A_Container'>
			<%@ include file="communityleft.jsp"%>
			<!--  -->
			<!-- 입력 Container -->
			<div class="qnaInsertContainer">
			<h1 style="margin-left:30px;">Q&A 입력</h1>
			<form action="<%= request.getContextPath() %>/insertQnA"  method="post" encType="multipart/form-data">
				<table class="insertTable">
					<tr>
						<th>제목*</th>
						<td><input type="text" name="title" size="30">
						<input type="hidden" name="userCode" value="<%= loginUser.getC_code() %>">
						</td>
					</tr>
					<tr>
						<th>아이디*</th>
						<td><input name="userId" value="<%= loginUser.getC_id() %>" readonly></td>
					</tr>
					<tr>
						<th>내용</th>
						<td><textarea rows="13" cols="80" name="content" style="resize:none; border:1px solid lightgray; "></textarea>
					</tr>
					<tr>
						<th>파일첨부</th>
						<td>
							<input type="file" name="files1" onchange="LoadImg(this);">
						</td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td><input type="password" name="QnApassword">* 비밀글로 등록하고싶을때만 비밀번호를 입력하세요.</td>					
					</tr>
				</table>
				<br>
				<%-- <% if(loginUser !=null && loginUser.getC_id().equals(loginUser.getC_id())){ %> --%>
				<div class="bottomBtn">
					<button type="submit" style="background: skyblue; border-radius: 5px; color: white; border: none; width: 100px; height: 30px; ">등록하기</button>
					<button type="reset" style="background: skyblue; border-radius: 5px; color: white; border: none; width: 100px; height: 30px; margin-right:50px; ">취소하기</button>
				</div>
				<%-- <%} %> --%>
			</form>
			</div>			
</div></div>

<%@ include file="../common/footer.jsp" %>			
<script>
	function LoadImg(value){
		console.log("얍 : "+value);
		if(value.files && value.files[0]){
			var reader = new FileReader();
			reader.readAsDataURL(value.files[0]);
			cosole.log(value.files[0])
		}
	}

</script>
</body>
</html>