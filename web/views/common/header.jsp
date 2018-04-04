<%@page import="com.kh.tc.file.model.vo.File"%>
<%@page import="com.kh.tc.customer.model.vo.Customer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	Customer loginUser = (Customer) session.getAttribute("loginUser");
%>
<%
	File profilImg = (File) session.getAttribute("profilImg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>테스트</title>
<style>
@font-face {
	font-family: 'LotteMartDream';
	font-style: normal;
	src:
		url('//cdn.jsdelivr.net/korean-webfonts/1/corps/lottemart/LotteMartDream/LotteMartDreamMedium.woff2')
		format('woff2'),
		url('//cdn.jsdelivr.net/korean-webfonts/1/corps/lottemart/LotteMartDream/LotteMartDreamMedium.woff')
		format('woff');
}

.top {
	background: #336699;
	width: 100%;
	height: 70px;
}

#TCTitle {
	color: white;
	font-size: 30px;
	font-family: 'LotteMartDream';
	margin-left: 60px;
	border:2px solid blue;
 	position:relative;
	bottom:25px; 
	/* padding-top:50px; */
}

#search {
	position: relative;
	bottom: 28px;
	height: 30px;
}

.searchBtn {
	width: 60px;
	height: 30px;
	position: relative;
	bottom: 28px;
	background: white;
	color: #336699;
	border-radius: 10px;
}

.category {
	width: 70%;
	height: 35px;
	float: left;
}

.cate1 {
	width: 100px;
	height: 30px;
	display: inline-block;
	text-align: center;
	/*border:1px solid red;
	 margin-right:5px;*/
	padding-top: 10px;
}

.cateName {
	font-family: 'LotteMartDream';
	font-size: 15px;
	border:none;
	background:white;
}

.cate1:hover {
	color: #336699;
	border-bottom: 1px solid #336699;
}

.rightBtns {
	float: right;
	margin-right: 100px;
}

.btn {
	color: white;
}

.dropdown-content {
	display: none;
	position: absolute;
	background-color: white;
	border-bottom: 1px solid #336699;
	min-width: 160px;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	z-index: 1;
}

.cate1:hover .dropdown-content {
	display: block;
}

.dropdown-content a {
	color: black;
	padding: 12px 16px;
	text-decoration: none;
	display: block;
}

#titleA {
	color: white;
	text-decoration: none;
}

.dropdown-content a:hover {
	background-color: white;
	color: #336699;
}
</style>
</head>
<body>
	<div class="header"
		style="border: 2px solid red; width: 100%; height: 110px;">
		<div class="top">
			<br> 
			<label id="TCTitle">
			<a id="titleA"href="/p/views/main/Realmain.jsp">Today's Colleague</a></label> 
			<input type="search" size="20" id="search3">
         <button class="searchBtn" onclick='searchBtn()'>검색</button>
         <SCRIPT>
         function searchBtn(){
            var search = $("#search3").val()
            
            
            location.href="/p/select.po?keyword="+search;
         }
         
         
         </SCRIPT>
			<%
				if (loginUser == null) {
			%>
			<div class="rightBtns">
				<label class="btn"><a id="titleA"
					href="/p/views/member/login.jsp">Login</a></label>&nbsp;&nbsp;&nbsp; <label
					class="btn"><a id="titleA" href="../member/join_step1.jsp">Join</a></label>
			</div>
			<%
				} else {
			%>
			<div class="rightBtns">
				<label class="btn"><a id="titleA"
					href="<%=request.getContextPath()%>/logout">LogOut</a></label>&nbsp;&nbsp;&nbsp;
				<label class="btn"> <a href="<%= request.getContextPath()%>/myPage?=<%=loginUser %>" class="w3-bar-item w3-button" id="mypage" style="color:white">My Page</a></label>
			</div>
			<%
				}
			%>
		</div>
		<div class="category">
			<!-- 관리자 카테고리 페이지  -->
			<%if (loginUser != null && loginUser.getC_id().equals("admin")) {%>
			<div class="cate1">
				<label class="cateName">회원</label>
				<div class="dropdown-content">
					<a href="/p/selectAllTalRequestMember.ad">탈퇴요청회원</a> <a
						href="/p/selectBlackRequest.ad">BlackMemberArea</a> <a
						href="/p/selectAllMoneyOutRequest.ad">출금신청</a>
					<!-- <a href="/p/views/adminViews/moneyOutRequestList.jsp">출금신청</a> -->
				</div>
			</div>

			<div class="cate1">
				<label class="cateName">상품</label>
				<div class="dropdown-content">
					<a href="/p/selectAllProductRequest.ad">등록요청상품</a>
					<!-- 상품 상세페이지 만들기   -->
					<a href="/p/deleteRequestProductList.ad">삭제요청상품</a>
				</div>
			</div>

			<div class="cate1">
				<label class="cateName">수익금</label>
				<div class="dropdown-content">
					<a href="/p/allsuick.ad">수익금관리센터</a>
					<!-- <a href="/p/views/adminViews/moneyWayCenter.jsp">수익금관리센터</a> -->
				</div>
			</div>
			<div class="cate1">
				<label class="cateName"
					onclick="location.href='/p/views/community/FAQ.jsp'">커뮤니티</label>
			</div>
			<%
				} else {
			%>
			<div class="cate1">
				<label class="cateName">시간</label>
				 <div class="dropdown-content">
            	 	 <a href="/p/select.po?cate1=시간&cate2=실시간">실시간</a>
             		 <a href="/p/select.po?cate1=시간&cate2=심부름">심부름</a>
            		 <a href="/p/select.po?cate1=시간&cate2=카풀">카풀</a>
             		 <a href="/p/select.po?cate1=시간&cate2=퀵서비스">퀵서비스</a>
         		</div>
			</div>
			<div class="cate1">
				<label class="cateName">재능</label>
				<div class="dropdown-content">
					<a href="#">Link 1</a> <a href="#">Link 2</a> <a href="#">Link
						3</a>
				</div>
			</div>
			<div class="cate1">
				<label class="cateName">물건</label>
				<div class="dropdown-content">
					<a href="#">Link 1</a> <a href="#">Link 2</a> <a href="#">Link
						3</a>
				</div>
			</div>
			<div class="cate1">
				<label class="cateName">공간</label>
				<div class="dropdown-content">
					<a href="#">Link 1</a> <a href="#">Link 2</a> <a href="#">Link
						3</a>
				</div>
			</div>
			<div class="cate1">
				<label class="cateName">차량</label>
				<div class="dropdown-content">
					<a href="#">Link 1</a> <a href="#">Link 2</a> <a href="#">Link
						3</a>
				</div>
			</div>
			<div class="cate1">
            <label class="cateName"
               onclick="request()">공유요청</label>
         	</div>
         		<input type="hidden" id="Y" value="Y">
          
      		<script>
         		function request(){
            		var req_status= $("#Y").val();  
           			location.href="<%=request.getContextPath() %>/searchRequest.do?req_status="+req_status;
              
          		}
        	</script>
			<div class="cate1">
				<label class="cateName"
					onclick="location.href='/p/views/community/FAQ.jsp'">커뮤니티</label>
			</div>
		</div>
		<%
			}
		%>
	</div>
</body>
</html>