<%@page import="com.kh.tc.customer.model.vo.Customer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.content { display:block; width:1000px; margin:0 auto; }
h1 { color:#444; font-size:26px; font-weight:600; padding-bottom:20px; }
h2 { color:#444; font-size:18px; font-weight:600; margin-top:60px; /* border-bottom:2px solid #666;  */line-height:40px; }
h3 { color:#666; font-size:16px; font-weight:600; }
h4 { color:#666; font-size:14px; font-weight:600; }

#A_Container_L{ 
   float:left;   width:200px;
}
* {margin:0; padding:0; list-style:none; text-decoration:none; font-family: 'Nanum Gothic', sans-serif;}
ul>li>a { text-decoration:none; }
a { color:#666666;}
.left_SSicon { display:inline-block; width:100%; padding-bottom:10px;}
.left_SSicon a li { width:98px; height:55px; text-align:center; float:left ; background:darkgray; border-radius:3px;  padding-top:15px; font-size:14px; font-weight:600; color:#fff;}
.left_SSicon a:last-child li { margin-left:4px; background:darkgray;}

.left_menu { display:inline-block; width:198px; border-left:1px solid #c6c6c6; border-right:1px solid #c6c6c6; border-bottom:1px solid #c6c6c6;}
.left_menu dl { border-top:1px solid #c6c6c6; }
.left_menu dl a dt { background:#336699; border-top:1px solid #fff; font-size:14px; font-weight:600; color:white; line-height:40px; padding-left:20px;}
.left_menu dl a:nth-child(2) dd  { padding-top:10px; }
.left_menu dl a:last-child dd { padding-bottom:10px; }
.left_menu dl a dd { font-size:12px; font-weight:600; color:#888888; line-height:26px; padding-left:20px; }
.left_menu dl a:hover dd, .left_menu dl a.on dd { color:#0eade7; }

</style>
</head>
<body>

<div id="A_Container_L">
   <div class="left_menu">

         <dl>
               <a href="#"><dt>커뮤니티</dt></a>
               <a href="#" id="gotoNotice"><dd> 공지사항</dd></a>
               <a href="#" id="gotoFreeBoard"><dd> 자유게시판</dd></a>
               <a href="#" id="gotoUserRequest"><dd> 건의사항</dd></a>
         </dl>
         <dl>
               <a href="#"><dt>고객센터</dt></a>
               <a href="/p/views/community/FAQ.jsp"><dd>F&Q</dd></a>
               <a href="/p/selectQnAList"><dd>Q&A</dd></a>
         </dl>
   </div>
   </div>
   
<script>
	$(function(){
		$("#gotoNotice").click(function(){
			location.href="/p/selectList.no";
		});
		$("#gotoFreeBoard").click(function(){
			location.href="/p/selectList.bo";
		});
		$("#gotoUserRequest").click(function(){
			location.href="/p/selectList.ur";
		});
	});
</script>
</body>
</html>
