<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 비밀번호 찾기</title>
<style>
.idPwSearch_wrap { display:inherit; margin:0 auto; width:990px; padding:80px 0 20px 0; text-align:center; }
.idPwSearch_wrap dd {float:left; width:450px; border:1px solid #dedede; padding:20px 20px 30px 20px; }
.idPwSearch_wrap dd:first-child { border-right:none;}
.idPwSearch_wrap h3 { font-size:14px; font-weight:600; color:#444444; text-align:left; }
.idPwSearch_wrap p	{ display:block; height:32px; margin:30px 0 10px 0; color:#666666; font-size:13px; font-weight:400; text-align:left;}
.btn_idPwSearch { display: inline-block; width:120px; border-radius: 2px; color:white; font-size: 15px; font-weight:600; line-height: 40px; text-align:center; background:#336699; text-decoration:none;}
.table_box2			{ width:100%; border-top:1px solid #e6e6e6; border-left:1px solid #e6e6e6; border-right:1px solid #e6e6e6; text-align:left; margin-bottom:30px;}
.table_box2 th, .table_box2 td		{ height:42px; vertical-align:middle;  border-bottom:1px solid #e6e6e6; color:#666; font-size:13px; font-weight:600; }
.table_box2 th		{ width:70px; text-align:left; padding-left:10px; font-weight:400; background:#efefef; }
.table_box2 td		{ padding:0 10px; background:#efefef; }
.table_box2 input, .table_box2 select	{ height:28px; padding-left:5px; border:1px solid #c6c6c6; color:#666; box-sizing:border-box}

</style>
</head>
<body>
	<%@ include file="../common/header.jsp"%>
	<div class="idPwSearch_wrap">
	<form method="post" action="<%= request.getContextPath()%>/searchId"> 
			<dd>
				<h3>아이디 찾기</h3>
				<p>아래 회원가입 시 입력하신 개인정보를 입력해 주세요.</p>
				<table class="table_box2" cellpadding="0" cellspacing="0">
					<tbody>
						<tr>
							<th>이름</th>
							<td><input type="text" name="userName"></td>
						</tr>
						<tr>
							<th>생년월일</th>
							<td><input type="text" name="PersonalDate" id="strJumin1"
								maxlength="8" placeholder="YYMMDD"></td>
						</tr>
						<tr>
							<th>이메일</th>
							<td>
							<input type="text" maxlength="25" name="email1"style="width: 100px;">
							 @ <input type="text"maxlength="25" name="email2" value=""
								onkeyup="SetEmailAddress_strEmail(this.form);"
								style="width: 100px;" readonly=""> 
								<select style="width: 82px;" name="strEmail2b"
								onchange="changeEmailType_strEmail(this.form, this.value);SetEmailAddress_strEmail(this.form);">

									<option value="">선택</option>
									<option value="naver.com">naver.com</option>
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
							</select> <input type="hidden" name="strEmail" value=""> <script
									language="javascript">
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
				<input type="submit" class="btn_idPwSearch" value="확인">
			</dd>
		</form>
		<form method="post" action="<%= request.getContextPath()%>/searchPwd">
		<dd>
			<h3>비밀번호 찾기</h3>
			<p>아래 회원가입 시 입력하신 정보를 입력하시면 메일을 통해 임시 비밀번호를 안내해 드립니다.</p>
				<table class="table_box2" cellpadding="0" cellspacing="0">
					<tbody>
						<tr>
							<th>아이디</th>
							<td><input type="text" name="strId"></td>
						</tr>
						<tr>
							<th>이름</th>
							<td><input type="text" name="strname"></td>
						</tr>
<tr>
							<th>이메일</th>
							<td>
							<input type="text" maxlength="25" name="email1"style="width: 100px;">
							 @ <input type="text"maxlength="25" name="email2" value=""
								onkeyup="SetEmailAddress_strEmail(this.form);"
								style="width: 100px;" readonly=""> 
								<select style="width: 82px;" name="strEmail2b"
								onchange="changeEmailType_strEmail(this.form, this.value);SetEmailAddress_strEmail(this.form);">

									<option value="">선택</option>
									<option value="naver.com">naver.com</option>
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
							</select> <input type="hidden" name="strEmail" value=""> <script
									language="javascript">
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
				<input class="btn_idPwSearch" type="submit"value="확인">
		</dd>
			</form>
	</div>
	
	
	
	<br><br><br><br><br><br>
	<br><br><br><br><br><br><br><br><br><br><br><br>
	<%@ include file="../common/footer.jsp"%>
</body>
</html>