<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String number = (String)request.getAttribute("number"); %>
<% String userId= (String)request.getAttribute("userId"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디</title>
<style>
.showIdContainer{
	width:800px;
	height:1000px;
	margin-left:auto;
	margin-right:auto;
}
.searchIdTitle{
	font-family: 'LotteMartDream';
	font-size:25px;
	border-bottom:2px solid #336699;
}
.showId{
	width:800px;
	height:200px;
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
.inputPwd{
	width:600px;
	height:200px;
	border:1px solid blue;
	margin-left:30px;
}
#inputPwd,#newPwd{
	height:30px;
}
.changeBtn{
	background:#336699;
	color:white;
	border:none;
	border-radius:5px;
	width:100px;
	height:30px;
	font-family: 'LotteMartDream';
}
</style>
</head>
<body>
<%@ include file="../common/header.jsp" %>
<br>
<div class="showIdContainer">
<label class="searchIdTitle">비밀번호 변경</label><br><br>
<label style="font-family: 'LotteMartDream';">임시로 받으신 비밀번호를 변경해주세요</label>
<br><br>
<div class="showId">
<div class="inputPwd">
<label style="font-family: 'LotteMartDream';">*임시로 받으신 비밀번호를 입력해주세요.</label>
<br><br>
<label style="font-family: 'LotteMartDream';">임시 비밀번호 : <input type="text" size="30" id="inputPwd" onkeyup="key();"></label>
<span id="wow1" style="font-family: 'LotteMartDream'; color:blue;"></span>
<br>
<br>
<div>
<label style="font-family: 'LotteMartDream';">*새 비밀번호 입력해주세요</label>
<br><br>
<label style="font-family: 'LotteMartDream';" >새로운 비밀번호 : 
<input type="text" id="newPwd" ></label>
<button onclick="changePwd();" class="changeBtn">변경</button>
</div>
<script>
	
	function key(){
		if(<%=number%>==$("#inputPwd").val()){
			$("#wow1").text("비밀번호 확인");
		}
		
	}
	function changePwd(){
		var newPwd=$("#newPwd").val();
		var userId="<%= userId%>";
		$.ajax({
			url:"/p/changePwd",
			type:"post",
			data:{newPwd:newPwd,userId:userId},
			success:function(data){
				if(data==1){
					alert("비밀번호 변경되었습니다. \n 로그인해주세요");
				}
			},
			error:function(){
				alert("비밀번호 바꾸기 실패");
			}
		});
	}
</script>
</div>
</div>
<br><br>
<div class="bottomBtns">
<button class="gobtn" onclick="location.href='/p/views/member/login.jsp'">로그인하러가기</button>
</div>
</div>

<%@ include file="../common/footer.jsp" %>
</body>
</html>