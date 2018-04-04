<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<title>개인정보 변경</title>
<style>
#A_Container_L {
   float: left;
   width: 200px;
}

#A_Container_C {
   width: 770px;
   float: left;
   overflow: hidden;
}

#A_Container {
   width: 1000px;
   margin: 0 auto;
   margin-top: 50px;
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
.person_change {
   width: 700px;
   margin-left:30px;
   float:left;
   border: 1px solid #dedede;
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
   color: white;
   font-size: 15px;
   font-weight: 600;
   line-height: 50px;
   background: darkgray;
}

.btn_joinL input {
   display: inline-block;
   width: 130px;
   padding: 0;
   border-radius: 3px;
   color: white;
   font-size: 15px;
   font-weight: 600;
   line-height: 50px;
   background: darkgray;
   border: none;
}

.bor_btm266 { border-bottom: 2px solid #666666;  }

.m_bottom20 {margin-bottom:20px !important; width:700px;}

#test{
   margin-left: 25px;
}

</style>
</head>
<body>
   <%@ include file="../common/header.jsp"%>

   <div id='A_Container_Wrap'>
      <div id='A_Container'>
         <%@ include file="../mypage/mypageleft.jsp"%>

         <!--  -->
         
         

   <h1 style="margin-left:255px;" class="bor_btm266 m_bottom20">회원정보변경</h1>
         <div id="A_Container_C">
           <form id="test" name="joinform" action="<%= request.getContextPath() %>/profileupdate?userId=<%= loginUser.getC_id() %>" method="post">  
               <table class="person_change" cellspacing="0">

                  <colgroup>
                     <col style="width: 150px">
                     <col>
                  </colgroup>
                  <tbody>
                     	
                     <tr>
                        <th>회원종류</th>
                        <td>
                        <select class="title" name="c_type">
                              <option value="일반회원">일반회원</option>
                              <option value="기업회원">기업회원</option>
                        </select>
                        </td>
                     </tr>
                     <tr>
                     
                        <th>이름</th>
                        <td><input type="text" name="userName" value="<%= loginUser.getC_name() %>" maxlength="14" readonly></td>
                     </tr>
                     <tr>
                        <th>아이디 </th>
                        <td><input type="text" name="userId" value="<%= loginUser.getC_id() %>" maxlength="14" readonly></td>
                     </tr>
                     <tr>
                        <th>비밀번호 *</th>
                        <td><input type="password" name="userPwd" id="strPwd">
                           <b class="font_12no66">* 4~15자의 영문자, 숫자조합</b></td>
                     </tr>
                     <tr>
                        <th>비밀번호 확인</th>
                        <td><input type="password" name="userPwd2"></td>
                     </tr>
                      <tr>
                        <th>생년월일</th>
                        <td><input type="text" id="date" name="date" placeholder="941220"></td>
                     </tr>
                        <th>휴대전화 *</th>
                        <td><select style="width: 82px;" name="strMobil1" onchange="SetHandPhone_strMobil(this.form);">
                              <option value="010" selected="">010</option>
                              <option value="011">011</option>
                              <option value="016">016</option>
                              <option value="017">017</option>
                              <option value="018">018</option>
                              <option value="019">019</option>
                        </select> - 
                        <input style="width: 80px;" type="text" maxlength="4" size="4" name="strMobil2"  onkeyup="if(isNaN(this.value))this.value='';SetHandPhone_strMobil(this.form);">
                           - <input style="width: 80px;" type="text" maxlength="4" size="4" name="strMobil3"  onkeyup="if(isNaN(this.value))this.value='';SetHandPhone_strMobil(this.form);">
                           <input type="hidden" name="strMobil" value="">
                           
                           <script language="javascript">
                           <!--
                              function SetHandPhone_strMobil(frm) {
                                 frm.strMobil.value = frm.strMobil1.value
                                       + "-"
                                       + frm.strMobil2.value
                                       + "-" + frm.strMobil3.value;
                              }
                           //-->
                           
                           </script></td>
                     </tr>
                     <tr>
                        <th>이메일 *</th>
                        <td><input type="text" maxlength="25" name="strEmail1" id="strEmail1" style="width: 100px;">
                         @ <select style="width: 150px;" name="strEmail2b" id="strEmail2b" >
                              <option value="">선택</option>
                              <option value="naver.com" >naver.com</option>
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
                        </select> 
                        <label id="certi_email" style="float:right; margin-right:130px; width:100px; height:30px; background:#ff8080; color:white; border:none;padding-left:18px; padding-top:5px;" > 
                  		이메일 인증 </label> 
                        </td>
                     </tr>
  <tr>
                        <th>예금주</th>
                        <td>
                        <input type="text" name="bankhuman" class="input01" id='bankUserName'>
                        </td>
                     </tr>
                    <tr>
                        <th>계좌번호</th>
                        <td><select class="select" name="bankname" id="bankname">
                              <option value="0">선택</option>
                              <option value="003">기업은행</option>
                              <option value="004">국민은행</option>
                              <option value="020">우리은행</option>
                              <option value="088">신한은행</option>
                              <option value="081">KEB하나은행</option>
                              <option value="012">농0협은행</option>
                              <option value="007">수협</option>
                              <option value="048">신협</option>
                              <option value="034">광주은행</option>
                              <option value="032">부산은행</option>
                              <option value="031">대구은행</option>
                              <option value="071">우체국</option>
                        </select> 
                        <input id="bankaddr" name="bankaddr" class="input01" type="text" value="" size="40" maxlength="1000">
                  <label style="float:right; margin-right:30px; width:100px; height:30px; background:#ff8080; color:white; border:none;padding-left:25px; padding-top:5px;" id="certi_account" onclick="gettoken();"> 
                  	계좌인증 </label>
                  </td>
                     </tr>
                   
                


                  </tbody>
               </table>
               <div style="margin-left:30px;">
                  <table class="resumeTable" cellspacing="0">
                     <colgroup>
                        <col style="width: 150px">
                        <col>
                     </colgroup>
                     <tbody>
                        <tr>
                           <th class="bor_top4ff">메일링 수신설정 *</th>
                           <td class="send_check">
                           <input name="emailAlarm" class="sns_send" type="radio" value="Y"><span>수신함</span>
                           <input name="emailAlarm" class="sns_send" type="radio" checked value="N"> <span>수신안함</span>
                           </td>
                        </tr>
                        <tr>
                           <th>SMS 수신설정</th>
                           <td class="send_check">
                           <input name="snsAlarm" class="sns_send" type="radio" value="Y"> <span>수신함</span>
                           <input name="snsAlarm" class="sns_send" type="radio" checked value="N"> <span>수신안함</span></td>
                        </tr>
                     </tbody>
                  </table>
               </div>
               <div class="btn_joinL">
                  <!-- <a href="login.jsp"><span>수정하기</span></a>  --> 
                  <input type="submit" id="modifyBtn" value="수정하기"> 
                  <input type="reset" value="취소하기">
               </div>
             </form> 
         </div>
         
      </div>
      <div class="Popup" style="width:300px; height:100px; border:1px solid red;
      position:relative;float:right; bottom:460px; right:130px;">
      	<h3 style="margin-left:15px;">인증번호 입력</h3>
      	<input style="margin-left:15px;" type="text" id="numberr">
      	 <button id="Wow" style="width:100px; height:30px; border:none; border-radius:5px; 
      	 background:#ff8080; color:white;">인증확인</button> 
      </div>
   </div>
<script>
var token = '';
function gettoken(){
   $.ajax({
      url: "https://testapi.open-platform.or.kr/oauth/2.0/token",
      type: 'post',
      contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
      data: {
         'client_id': "l7xxb95d2eb7dffd4618bbbd5aa0e334c7f9",
         'client_secret': "ebcfcbec4953498fb3ebb4d230caf531",
         'grant_type': 'client_credentials',
         'scope': 'oob'
      },
      success:function(data){
         insert_action(data.access_token)
         
      }
   })
   
   console.log(new Date());
   

 }
 
 

  function insert_action(token){
   
     var obj = new Object();

        obj.bank_code_std = $("#bankname").val();
        obj.account_num = $("#bankaddr").val();
        obj.account_holder_info =$("#date").val();
        obj.tran_dtime = '20180313101921';
        
        var jsonData = JSON.stringify(obj);
        console.log(jsonData)
    
   var request = $.ajax({
      url:"https://testapi.open-platform.or.kr/inquiry/real_name",
      type:"post",
      contentType: 'application/json; charset=UTF-8',
      dataType:"json",
      
      headers: {
         'Authorization': ('Bearer ' + token)
         
      },
       data:jsonData 
   });
   request.done(function(data){ // 전송 후, 결과 값 받아오는 부분
      var bankUserName=$('#bankUserName').val();
   	  var account_yn="";
      if(bankUserName == data.account_holder_name){
    	 var userId= "<%= loginUser.getC_id()%>";
    	 $.ajax({
    		url:"/p/updateAccountYN.cu",
    	 	type:"post",
    	 	data:{userId:userId},
    	 	success:function(data){
        		alert("개인 정보 조회 인증되었습니다.");
    	 	},
    	 	error:function(){
    	 		console.log("실패됬");
    	 	}
    	 });
      }else{
    	  account_yn='N';
    	  alert("실패");
      }
      
      console.log(data);
   });
   request.fail(function(jqXHR, textStatus){ // 에러 발생
    alert("등록 오류 발생!");
   });
  }

  $(function(){
	  $(".Popup").hide();
  	$("#certi_email").click(function(){
  		var email1 = $("#strEmail1").val();
			var email2 = $("#strEmail2b").children('option:selected').val();
  		var email =email1+"@"+email2;
  		var userId ="<%= loginUser.getC_id()%>";
  		$(".Popup").show();
  		
			$.ajax({
				url:"/p/sendEmailCerti",
				type:"post",
				data:{email:email,userId:userId},
				success:function(data){
					$("#Wow").click(function(){
  						var numberr = $("#numberr").val();
  						var userId= "<%= loginUser.getC_id() %>";
  						if(data==numberr){
  							alert("이메일 인증되셨습니다.");
  							$(".Popup").hide();
  							$.ajax({
  								url:"/p/updateEmailYN",
  								type:"post",
  								data:{userId:userId},
  								success:function(){
  									
  								},
  								error:function(){
  									console.log("디비에 입력 실패");
  								}
  							});
  						}else{
  							alert("다시 입력해주세요");
  						}
					});
					
				},
				error:function(){
					alert("실패");
				}
  		});
  		
  	});
  });
</script>
 
</body>
</html>