<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="com.kh.tc.file.model.vo.File"%>    

<% File profileFile = (File)session.getAttribute("profileFile"); %>
    <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 사진을 원모양으로 만들기 위한 bootstrap -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!--  -->
<title>프로필 관리</title>
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

.ChangeContainer {
	/* border:1px solid black; */
	width: 700px;
	height:1100px;
	float: left;
	margin-left: 55px;
}

.changePhoto {
	background: LightGray;
	border-radius: 10px;
	height: 220px;
}

.modifyBtn {
	width:140px;
	border: none;
	border-radius: 10px;
	background: darkgray;
	color: white;
	height:40px;
	margin-left:570px;
}

.img-circle {
	margin-left: 300px;
	margin-top: 30px;
}

.bor_btm266 {
	border-bottom: 2px solid #666666;
}

.m_bottom20 {
	margin-bottom: 20px !important;
	width: 700px;
}

#changeImg {
	color: white;
	border-radius: 10px;
	background: darkgray;
	height: 40px;
	text-align: center;
	width: 150px;
	padding-top: 10px;
	float:right;
	margin-top:80px;
	cursor:pointer;
	margin-right:30px;
}

/* 자기소개/ 경력사항 넣는 form style */
.person_change { width:100%; border:1px solid #dedede; border-bottom:none; margin-bottom:30px; font-size:13px;}
.person_change th{ text-align:left; background:#efefef;	color:#666;	font-weight:normal; padding-left:25px; border-bottom:1px solid #e6e6e6; height:40px; }
.person_change td{ position:relative; padding:6px 0 6px 9px; color:#666; border-bottom:1px solid #e6e6e6; }
.person_change p {	margin-left:10px;}
.person_change input {	border:1px solid #c6c6c6;	outline:none;	height:26px; 	padding-left:5px;}

.board_write th { font-weight:600; }
.board_write td textarea { width: 95%; height: 145px; overflow-y: auto; border: 0; color: #666; font-size: 13px; font-weight:normal; line-height: 140%; padding:10px; border: 1px solid #c6c6c6 !important; }

.profile_file li { display:inline-block; }
.profile_file li:first-child { padding-bottom:20px;}

.p_bottom10 {padding-bottom:10px !important;}
.w290px {width:290px;}
.f_left {float:left;}
.m_bottom4 {margin-bottom:4px !important;}

.file_input {float:left; width:150px; height:28px; margin-left:4px; }
.file_input input.file_miss {height:0; overflow:hidden; border:0; }

.btn_joinS { display: inline-block; padding:0 10px; border-radius: 2px; color: #fff; font-size: 12px; line-height: 28px; background: #2fa0ee; background:#979797;}

.cursor { cursor:pointer; }
.selectShareType{ width:100px; padding-left:14px; height:30px;}
</style>
</head>
<body>

<%@ include file="../common/header.jsp"%>
<!-- 프로필 사진 수정 부분 -->
<div id='A_Container_Wrap'>
		<div id='A_Container'>
			<%@ include file="../mypage/mypageleft.jsp"%>

			<!--  -->
			<!-- 1 -->
		   <div class="ChangeContainer">
            <h1 style="margin-left: 0px;" class="bor_btm266 m_bottom20">프로필수정</h1>
            <form action="<%= request.getContextPath() %>/insertProfileImg?userId=<%= loginUser.getC_id() %>" method="post" encType="multipart/form-data">
               <div class="changePhoto">
               
					<% if(profilImg != null){%>
                     <img id="profileImg" class="img-circle" alt="사진불러와" width="120" height="120"
                     src="/p/profile_Images/<%= profilImg.getSec_file_name()%>"> 
                    <%}else{ %>
                     <img id="profileImg" class="img-circle" alt="프로필 사진 선택하기" width="120" height="120" 
                     > 
                    <%} %> 
                    <!-- <img id="profileImg" class="img-circle" alt="프로필 사진 선택하기" width="120" height="120" >  -->
                     <label id="changeImg">프로필 사진 선택하기</label>
                     <br>
                        <label style="margin-left: 320px; font-size: 25px; color: rgb(94, 94, 94);">
                        <b><%= loginUser.getC_name()%></b></label>
                        
                         <div id="fileArea">
                  <input type="file" id="profileFile" name="profileFile"
                     onchange="loadImg(this);">
               </div>
                </div>
         
			<!-- 1 -->
              
                 
               <br><br>
               <!-- 자기소개나/경력 사항 넣는 form -->
               <div>
               	<table class="person_change board_write" cellspacing="0">
					<colgroup>
					<col style="width:180px">
					<col>	
					</colgroup>	
					<tbody>
				    <tr>
					<th>공유분야 *</th>
						<td>
						  <select name="shareType" class="selectShareType">
						  	<option value="시간">시간</option>
						  	<option value="재능">재능</option>
						  	<option value="물건">물건</option>
						  	<option value="공간">공간</option>
						  	<option value="차량">차량</option>
						  </select>
          				</td>
					</tr>		
      				<tr>
						<th>소개제목 *</th>
						<td><input class="w400px" type="text" name="intro_title"></td>
					</tr>
      				<tr>
						<th>자격증 *</th>
						<td><input style="width:180px;"type="text" name="certifi_name"></td>
					</tr>
					<tr>
						<th>주요경력</th>
						<td><textarea name="career" style="resize:none;"></textarea></td>
					</tr>
					<tr>
						<th>자기소개 *</th>
						<td><textarea name="introduce" style="resize:none;"></textarea></td>
						</tr>
				
			</tr>
			</tbody>
			</table>
               </div>
        			<button class="modifyBtn">수정</button>        
            </form>
             </div>
            <br>
         </div>
	</div>
	
	<br><br>	<br><br>
	<%@ include file="../common/footer.jsp" %>
	  <script>
         $(function() {
            $("#fileArea").hide();
            $("#changeImg").click(function() {
               $("#profileFile").click();
            });
         });

         function loadImg(value) {
            if (value.files && value.files[0]) {
               var reader = new FileReader();
               reader.onload = function(e) {
                  $("#profileImg").attr("src", e.target.result);
               }
               reader.readAsDataURL(value.files[0]);
            }
         }
      </script>
</body>
</html>

