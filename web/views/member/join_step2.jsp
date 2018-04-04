<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic"
	rel="stylesheet">
<title>회원가입</title>
<style>
.joinTable {
	border: 1px solid #b4b4b4;
	width: 400px;
	height: 50px;
text-align: center;
}
#step2 {
color:white;
	background:#336699;
}

.person_change {
	width: 700px;
	margin-left: auto; 
	margin-top:30px;
	margin-right:auto;
	border : 1px solid #dedede;
	border-bottom: none;
	margin-bottom: 30px;
	font-size: 13px;
	border: 1px solid #dedede;
}

.person_change th {
	text-align: left;
	background: #efefef;
	color: #666;
	font-weight: normal;
	padding-left: 25px;
	border-bottom: 1px solid #e6e6e6;
	height: 40px;
}

.person_change td {
	position: relative;
	padding: 6px 0 6px 9px;
	color: #666;
	border-bottom: 1px solid #e6e6e6;
}

.person_change p {
	margin-left: 10px;
}

.person_change input {
	border: 1px solid #c6c6c6;
	outline: none;
	height: 26px;
	padding-left: 5px;
}

.person_change input.max {
	width: 98%;
}

.person_change textarea.max {
	width: 98%;
	height: 180px;
	border: 1px solid #c6c6c6;
}

.person_change select {
	border: 1px solid #c6c6c6;
	outline: none;
	height: 28px;
	padding-left: 5px;
}

.person_change textarea {
	border: 1px solid #e6e6e6;
	outline: none;
	height: 100px;
	width: 96%;
	padding-left: 5px;
}

.person_change input[type=password] {
	width: 235px;
}

.person_change input[type=email], .person_change input[type=url] {
	width: 290px;
}

.person_change input[type=tel] {
	width: 80px;
}

.font_12no66 {
	font-size: 12px;
	font-weight: normal;
	color: #666666;
}

.new {
	position: relative;
	top: 9px;
	margin-left: 10px;
	margin-right: 5px;
}

.bor_none .share_star {
	
	color: #666;
	float: right;
	font-weight: 100;
	font-size: 12px;
}

.resumeTable {
	width: 400px;
	margin-bottom: 30px;
	border-top: 1px solid #e6e6e6;
	border-left: 1px solid #e6e6e6;
	font-size: 13px;
	text-align: left;
}

.resumeTable th, .resumeTable td {
	height: 28px;
	color: #666;
	border-bottom: 1px solid #e6e6e6;
}

.resumeTable th {
	padding: 6px 0 6px 18px;
	border-right: 0;
	font-weight: normal;
	text-align: left;
	background: #efefef;
}

.resumeTable td {
	padding: 6px 9px;
	border-right: 1px solid #e6e6e6;
}

.bor_top4ff {
	border-top: 4px solid #ffffff;
}

.send_check {
	position: relative
}

.send_check span {
	margin: 5px 20px 0 20px;
}

.sns_send {
	position: absolute;
}

.btn_joinL {
	margin-top: 20px;
	text-align: center;
}

.btn_joinL span {
	display: inline-block;
	width: 130px;
	padding: 0;
	border-radius: 3px;
	color:white;
	font-size: 15px;
	font-weight: 600;
	line-height: 50px;
	background:#a5aac7; 
	font-family: 'LotteMartDream';
}
.btn_joinL input{
	display: inline-block;
	width: 130px;
	padding: 0;
	border-radius: 3px;
	color:white;
	font-size: 15px;
	font-weight: 600;
	line-height: 50px;
	background:#a5aac7; 
	font-family: 'LotteMartDream';
	border:none;
}

.person_change th{
	background:#a5aac7;
	color:white;
	font-family: 'LotteMartDream';
}
</style>
</head>
<body>
	<%@ include file="../common/header.jsp"%>
	
	<script>
	$(".cancel123").click(function(){
		location.href = "Realmain.jsp";
	});
	</script>
	
	<hr>
	<br><br> 	
	
	<div align="center">
	<h2 style=" font-family: 'LotteMartDream';">회원가입</h2>
	<br>
	<table class="joinTable" border="1" align="center">
	<tr>
		<td >STEP1</td>
		<td id="step2">STEP2</td>
	</tr>
</table>
	</div>
	
	<div id="A_Container_C">
		<form name="joinform" action="?member2=modifyok&amp;" method="post"
			enctype="multipart/form-data" onsubmit="return join();">
			<table class="person_change" cellspacing="0">
				<input type="hidden" name="intseq" value="3018">
				<colgroup>
					<col style="width: 150px">
					<col>
				</colgroup>
		    	<tbody>
					<tr>
						<th>회원종류</th>
						<td>
							<select class="title">
								<option value="일반회원">일반회원</option>
								<option value="기업회원">기업회원</option>
							</select>
						</td>
					</tr>
					<tr>
						<th>이름</th>
						<td>
							<input type="text" name="userName" maxlength="14" class="userName" id="userName">
						</td>
					</tr>
					<tr>
						<th>아이디 *</th>
						<td>
							<input type="text" name="userId" maxlength="25" class="userId" id="userId">
							<button onclick='idcheck();'>ID중복검사</button>
						</td>
					</tr>
					<tr>
						<th>비밀번호 *</th>
						<td>
							<input type="password" name="strPwd1" id="strPwd1">
							<b class="font_12no66">* 8~15자의 영문자, 숫자조합</b>
						</td>
					</tr>
					<tr>
						<th>비밀번호 확인</th>
						<td>
							<input type="password" name="strPwd2" id="strPwd2">
							<button id="pwCheck">비밀번호 확인</button>
						</td>
					</tr>
					
					<tr>
                  <th>이메일 *</th>
                  <td><input type="text" id="email1" maxlength="25" name="strEmail1"
                     value="" onkeyup="SetEmailAddress_strEmail(this.form);"
                     style="width: 100px;"> @ <input type="text" id="email2"
                     maxlength="25" name="strEmail2a" value=""
                     onkeyup="SetEmailAddress_strEmail(this.form);"
                     style="width: 100px;" readonly=""> <select
                     style="width: 82px;" name="strEmail2b"
                     onchange="changeEmailType_strEmail(this.form, this.value);SetEmailAddress_strEmail(this.form);">
                        <option value="">선택</option>
                        <option value="naver.com" selected="">naver.com</option>
                        <option value="daum.net">daum.net</option>
                        <option value="hotmail.com">hotmail.com</option>
                        <option value="nate.com">nate.com</option>
                        <option value="yahoo.co.kr">yahoo.co.kr</option>
                        <option value="paran.com">paran.com</option>
                        <option value="empas.com">empas.com</option>
                        <option value="dreamwiz.com">dreamwiz.com</option>
                        <option value="freechal.com">freechal.com</option>
                        <option value="lycos.co.kr">lycos.co.kr</option>
                        <option value="korea.com">korea.com</option>
                        <option value="gmail.com">gmail.com</option>
                        <option value="hanmir.com">hanmir.com</option>
                        <option value="직접입력">직접입력</option>
                  </select> <input type="hidden" name="strEmail" value="wntmd1215@naver.com">
                     <script language="javascript">
                     <!--
                        function changeEmailType_strEmail(frm,
                              emailType) {
                           frm.strEmail2a.value = "";
                           if (emailType == "직접입력") {
                              frm.strEmail2a.readOnly = false;
                              frm.strEmail2a.focus();
                           } else {
                              frm.strEmail2a.readOnly = true;
                              frm.strEmail2a.value = emailType;
                           }
                        }
                        function SetEmailAddress_strEmail(frm) {
                           frm.strEmail.value = frm.strEmail1.value
                                 + "@" + frm.strEmail2a.value;
                        }
                     //-->
                     </script></td>
               </tr>
				</tbody>
			</table>
			<div style="margin-left:440px;">
			<h2 class="bor_none sub_title"  style=" font-family: 'LotteMartDream';">정보수신설정</h2>
			<table class="resumeTable" cellspacing="0">
				<colgroup>
					<col style="width: 150px">
					<col>
				</colgroup>
				<tbody>
					<tr>
						<th class="bor_top4ff">메일링 수신설정 *</th>
						<td class="send_check">
							<input name="bitNews" class="sns_send" type="radio" value="true"> 
							<span>수신함</span> 
							<input name="bitNews" class="sns_send" type="radio" checked="" value="false">
							<span>수신안함</span>
						</td>
					</tr>
					<tr>
						<th>SMS 수신설정</th>
						<td class="send_check">
							<input name="bitNews2" class="sns_send" type="radio" value="True"> 
							<span>수신함</span>
							<input name="bitNews2" class="sns_send" type="radio" checked="" value="False"> 
							<span>수신안함</span>
						</td>
					</tr>
				</tbody>
			</table>
			
			</div>
		</form>
			<div class="btn_joinL">
				<input type="submit" value="가입하기" class="join123">
				<input type="reset" value="취소하기" class="cancel123"
				 style=" font-family: 'LotteMartDream';">
			</div>
	</div>
	
	<br><br><br>
	<%@ include file="../common/footer.jsp"%>
	<script>
	var count = 1;
	
	function join(){
		if(count==2){
			return true;
		}else{
			return false;
		}
	}
	
	function idcheck(){
		var userId = $(".userId").val();
		$.ajax({
			url:"/p/idCheck.me",
			data:{userId:userId},
			type:"post", 
			success:function(data){
				
				if(data=="1"){
		               alert("아이디가 중복됩니다.");
		               return false;
		            }else{
		               joinform.userId.readOnly = true;
			           alert("사용가능한 아이디 입니다.");
			           count=1;
			           return false;		               
		            } 
			},
			error:function(request,status,error){
		        alert("실패");
		       }

			
		})
		
	}
	
	$("#pwCheck").click(function(){
		var password1 = $("#strPwd1").val();
		var password2 = $("#strPwd2").val();
		if(password1 != password2){
			alert("비밀번호가 일치하지 않습니다.");
			$("#strPwd1").val('');
			return false;
		}else if(!/^[a-zA-Z0-9]{8,15}$/.test(password1)){
			alert("숫자와 영문자 조합으로 8~15자리를 사용해야 합니다.");
			$("#strPwd1").val('');
			$("#strPwd2").val('');
			return false;
		}else{
			alert("사용 가능한 비밀번호 입니다.");
			joinform.strPwd1.readOnly = true;
			joinform.strPwd2.readOnly = true;
			count = 2;
			return false;
		}
	});
	
	$(function(){
		$(".join123").click(function(){
		var mType = $(".title:selected").val();
		var mName = $(".userName").val();
		if($(".userName").text() != null){
			console.log("잉 : "+mName);
		}else{
			alert("이름을 입력하셔야 합니다.");
			return false;
		}	
		var userId = $(".userId").val();
		var password = $("#strPwd1").val();
		if($("#email1").val() != null){
			var email1 = $("#email1").val();//
			var email2 = $("#email2").val();//
			var email = email1 + '@' +email2;
		}else{
			alert("이메일을 입력하셔야 합니다.");
			return false;
		}
	
		 $.ajax({
			url:"/p/insertMember.me",
			type:"post",
			data:{mType:mType, mName:mName, userId:userId, password:password, email:email},
			success:function(data){
				console.log(data);
			    alert(data + "님 환영합니다.\n로그인 화면으로 이동합니다.");
				location.href="/p/views/member/login.jsp";
				response.sendRedirect("login.jsp"); 
				return false;
			},
			error:function(){
				alert("회원가입 에러!"+data);
				location.href="/p/views/member/login.jsp";
				response.sendRedirect("login.jsp");
				return false;
			}
		}); 
	});
});
	
	</script>
</body>
</html>