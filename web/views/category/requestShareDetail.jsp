<%@page import="java.util.ArrayList"%>
<%@page import="com.kh.tc.product.model.vo.product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
 <!-- 페이지 임포트 -->
 
 <!--  리스트 받아옴 -->
 <% ArrayList<product> list = (ArrayList<product>) request.getAttribute("list");%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<title>Insert title here</title>
<style>


@font-face {
	font-family: 'Nanum Gothic';
	font-style: normal;
	font-weight: 400;
	src: url(//fonts.gstatic.com/ea/nanumgothic/v5/NanumGothic-Regular.eot);
	src:
		url(//fonts.gstatic.com/ea/nanumgothic/v5/NanumGothic-Regular.eot?#iefix)
		format('embedded-opentype'),
		url(//fonts.gstatic.com/ea/nanumgothic/v5/NanumGothic-Regular.woff2)
		format('woff2'),
		url(//fonts.gstatic.com/ea/nanumgothic/v5/NanumGothic-Regular.woff)
		format('woff'),
		url(//fonts.gstatic.com/ea/nanumgothic/v5/NanumGothic-Regular.ttf)
		format('truetype');
}

@font-face {
	font-family: 'Nanum Gothic';
	font-style: normal;
	font-weight: 700;
	src: url(//fonts.gstatic.com/ea/nanumgothic/v5/NanumGothic-Bold.eot);
	src:
		url(//fonts.gstatic.com/ea/nanumgothic/v5/NanumGothic-Bold.eot?#iefix)
		format('embedded-opentype'),
		url(//fonts.gstatic.com/ea/nanumgothic/v5/NanumGothic-Bold.woff2)
		format('woff2'),
		url(//fonts.gstatic.com/ea/nanumgothic/v5/NanumGothic-Bold.woff)
		format('woff'),
		url(//fonts.gstatic.com/ea/nanumgothic/v5/NanumGothic-Bold.ttf)
		format('truetype');
}

@font-face {
	font-family: 'Nanum Gothic';
	font-style: normal;
	font-weight: 800;
	src:
		url(//fonts.gstatic.com/ea/nanumgothic/v5/NanumGothic-ExtraBold.eot);
	src:
		url(//fonts.gstatic.com/ea/nanumgothic/v5/NanumGothic-ExtraBold.eot?#iefix)
		format('embedded-opentype'),
		url(//fonts.gstatic.com/ea/nanumgothic/v5/NanumGothic-ExtraBold.woff2)
		format('woff2'),
		url(//fonts.gstatic.com/ea/nanumgothic/v5/NanumGothic-ExtraBold.woff)
		format('woff'),
		url(//fonts.gstatic.com/ea/nanumgothic/v5/NanumGothic-ExtraBold.ttf)
		format('truetype');
}

/* LAYOUT */
#A_Container {
	width: 1000px;
	margin: 0 auto;
	margin-top: 50px;
	margin-bottom: 20px;
	clear: both;
	overflow: hidden;
	min-height: 500px;
}

table {
	display: table;
	border-collapse: separate;
	border-spacing: 1px;
	border-color: grey;
	border: 1px solid gray;
}

.serviceTable {
	width: 100%;
	border-left: 1px solid #dedede;
	border-top: 1px solid #dedede;
	border-right: 1px solid #dedede;
	text-align: center;
}

/*  */
.sb_contents {
	width: 93.8%;
	padding: 25px 30px;
	border: 1px solid #c6c6c6;
	margin-top: 10px;
	line-height: 24px;
}

/* common */
* {
	margin: 0;
	padding: 0;
	list-style: none;
	text-decoration: none;
	font-family: 'Nanum Gothic', sans-serif;
}

ul>li>a {
	text-decoration: none;
}
/* table { border-collapse: collapse; }*/
a {
	color: #666666;
}
/*span { color:#666; font-size:12px; }*/

/* 페이지 리스트 */
.list_page {
	margin: 30px auto 0;
	text-align: center;
	zoom: 1;
}

.list_page .first_btn {
	display: inline-block;
	width: 25px;
	height: 24px;
	text-indent: -9999px;
	vertical-align: bottom;
	background: url(../image/common/arrow_l.png) no-repeat left top;
}

.list_page .first2_btn {
	display: inline-block;
	width: 24px;
	height: 24px;
	text-indent: -9999px;
	vertical-align: bottom;
	background: url(../image/common/arrow_l.png) no-repeat -25px top;
}

.list_page ul {
	display: inline-block;
	overflow: hidden;
	padding: 0 7px;
	vertical-align: bottom;
}

.list_page li {
	float: left;
	margin: 0 5px;
}

.list_page li:hover a, .list_page li a.on {
	color: #fff;
	background: black;
}

.list_page li a {
	display: block;
	width: 24px;
	height: 24px;
	font-size: 12px;
	color: #444;
	text-align: center;
	line-height: 25px;
}

.list_page .last2_btn {
	display: inline-block;
	width: 25px;
	height: 24px;
	text-indent: -9999px;
	vertical-align: bottom;
	background: url(../image/common/arrow_r.png) no-repeat left top;
}

.list_page .last_btn {
	display: inline-block;
	width: 24px;
	height: 24px;
	text-indent: -9999px;
	vertical-align: bottom;
	background: url(../image/common/arrow_r.png) no-repeat -25px top;
}

thead {
	display: table-header-group;
	vertical-align: middle;
	border-color: inherit;
	border-top-color: inherit;
	border-right-color: inherit;
	border-bottom-color: inherit;
	border-left-color: inherit;
}

/* modal window styles */
#lean_overlay {
	position: fixed;
	top: 0px;
	left: 0px;
	display: none;
	width: 100%;
	height: 100%;
	background: #000;
	z-index: 100;
}

.popupModal {
	position: relative;
	overflow: hidden;
	width: 1080px;
	height: 450px;
	border: 2px solid #2fa0ee;
	box-sizing: border-box;
	background: #fff;
}

.popupModal * {
	box-sizing: border-box;
}

.popupModal h2 {
	position: relative;
	width: 100%;
	height: 40px;
	line-height: 40px;
	padding-left: 20px;
	color: #fff;
	font-size: 16px;
	font-weight: 600;
	background: #2fa0ee;
	margin-top: 0 !important;
	border: none !important;
}

.popupModal .popupCon {
	position: relative;
	width: 100%;
	height: 100%;
}

.popupModal .popupCon dd {
	position: relative;
	float: left;
	height: 100%;
	padding: 10px;
	border-right: 1px solid #cacaca;
}

.popupModal .popupCon dd:last-child {
	border-right: none;
}

.popupModal .popup_close {
	position: absolute;
	top: 0;
	right: 0;
	padding: 11px;
	cursor: pointer
}

.allCate {
	position: relative;
	width: 100%;
}

.allCate>li {
	width: 100px;
	padding-left: 10px;
}

.allCate a {
	font-size: 13px;
	font-weight: normal;
	color: #666666;
}

.allCate a:hover {
	color: #2fa0ee;
}

.allCate .allCate_tit01 {
	width: 100%;
	line-height: 34px;
	background: #f7f7f7;
	border-bottom: 1px solid #cacaca;
	font-size: 15px;
	font-weight: 600;
	color: #272727;
}

.tit452 {
	width: 492px;
	line-height: 34px;
	background: #f7f7f7;
	border-bottom: 1px solid #cacaca;
	font-size: 15px;
	font-weight: 600;
	color: #272727;
	padding-left: 10px;
}

.con452 {
	position: relative;
	width: 452px;
}

.tit252 {
	width: 180px;
	line-height: 34px;
	background: #f7f7f7;
	border-bottom: 1px solid #cacaca;
	font-size: 15px;
	font-weight: 600;
	color: #272727;
	padding-left: 10px;
}

.con252 {
	position: relative;
	width: 120px;
}

.con452 ul {
	float: left;
	width: 20%;
}

.con252 ul {
	width: 20%;
	width: 96px;
	float: left;
}

.con252 ul:nth-child(2) {
	float: right;
	width: 20%;
}

.allCate_tit02 {
	padding: 10px 0 5px 0;
}

.allCate_tit02 a {
	font-size: 15px !important;
	font-weight: 600;
	color: #333 !important;
	padding-bottom: 10px;
}

/* 공유하기 버튼 */
.btn_joinL {
	margin-top: 20px;
	text-align: center;
}

.btn_joinL span {
	display: inline-block;
	width: 190px;
	padding: 0;
	border-radius: 3px;
	color: #fff;
	font-size: 18px;
	font-weight: 600;
	line-height: 50px;
	background: black;
}

/* 공유리스트 레이아웃 */
.serviceTable {
	width: 100%;
	border-left: 1px solid #dedede;
	border-top: 1px solid #dedede;
	border-right: 1px solid #dedede;
	text-align: center
}

.serviceTable th, .serviceTable td {
	padding: 10px 0;
	border-bottom: 1px solid #dedede;
	color: #666;
	font-size: 13px;
	line-height: 20px;
}

.serviceTable th {
	font-weight: 500;
	background: #efefef
}

.serviceTable td.title {
	text-align: left;
}

.serviceTable td.title a {
	display: inline-block;
	color: #666;
	font-weight: 600
}

.serviceTable td.rec {
	background: url('../image/common/ico_reple.png') no-repeat left center;
	padding-left: 40px;
}

/* 공유하기 버튼, 셀렉 */
.board_search {
	width: 100%;
	position: relative;
	display: inline-block;
}

.board_search span {
	left: 0;
	bottom: 5px;
	font-size: 18px;
	font-weight: 400;
	color: #ffffff;
}

.board_search p select, .board_search input {
	border: 1px solid #c6c6c6;
	outline: none;
}

.board_search p select {
	width: 100px;
	height: 28px;
}

.board_search p input {
	width: 50px;
	height: 28px;
 
}

.board_search p a {
	padding: 1px;
	background: black;
	font-size: 14px;
	color: #ffffff;
}

#searchBtn{
	background-color:#dddddd;
}

 

</style>
</head>
<body align="center">

	<%@ include file="../common/header.jsp"%>

<input type='hidden' value='<%=loginUser.getC_code()%>' name='c_code'>
	<div id="A_Container_Wrap">
		<div id="A_Container">
			<div id="A_Contents_L"></div>

			<div id="A_Contents_C">
<div id="A_Contents_C">
              			 
<h3><%-- p.getP_name() --%> </h3>
             <table class="serviceTable"  
					  border="1">
                <colgroup>
                    <col style="width:12%">
                    <col style="width:12%">
                    <col style="width:12%">
                    <col style="width:12%">
                    <col style="width:12%">
                    <col style="width:12%">
                    <col style="width:12%">
                    <col style="width:12%">
                </colgroup>
							
							
				
			<% for(product p : list) {%>
                
                <h1> 재능 요청 상세 게시판</h1>
                <tr border="1">
                
                    <th class="title" colspan="8" width="200px" height="40px">
                    카테고리: <%= p.getCate1()%>>
            <%=   p.getCate2()%>>
            <%=  p.getCate3()%>>
            <%=  p.getCate4()%> </th>
                </tr>
                <tr>
             
             

					   
                <input type="hidden" id="pcode" value="<%= p.getP_code() %>">
                    <td height="40px">등록시간</td>
                    	<td><%= p.getP_date() %> </td>
                    <td>판매자명</td>
                    	<td><%= p.getC_code() %></td>
                    	 
                    <td>요청마감 </td>
                    <td><%= p.getP_deadline() %></td>
                    <td>희망금액</td>
                    <td><%= p.getP_price() %></td>
                    		
                </tr>
                <tr>
                	<td colspan="8" class="con" height="200px">
                      <%= p.getP_simplecontent() %>
                    </td>
                    
                
                </tr>
                    <%} %>
            </table>
	<div style="padding:20px">
	
	</div>
		<hr>
	
            <h5 class="bor_none m_top20 m_bottom20"></h5>
						<div class="replyArea" >
      <div class="replyWriteArea" >
         	<table class="serviceTable inquiry_list" >
            <tr><td>댓글</td>
               <td>
                   <textarea cols="110" rows="4" id="replyContent" placeholder="댓글을 입력해주세요"></textarea>
               </td>
               <td>
                  <button class="btn btn-default" id="addReply">등록 </button>
               </td>
            </tr>
         </table>
      </div>
      <div id="replySelectArea">
         <table id="replySelectTable" border="1" align="center"> 
         <tr id="replySelectTable1">
         </tr>
         </table>
      </div>
   </div>
 
 <script>
      $(function(){
         $("#addReply").click(function(){
        	var p_code=$("#pcode").val();
            var content = $("#replyContent").val();
            
            $.ajax({
               url:"/p/insertReply.do",
               data:{content:content,
            	   p_code:p_code
               }
               },
               }
               type:"post",
               success:function(data){               	   
              	var $replySelectTable = $("#replySelectTable").css("width","90%");
              		$replySelectTable.html('');
              		var $tr1 = $("<tr>")
              		var $th1= $("<td>").text("아이디").css('float','center');
              		var $th2= $("<td>").text("시간").css('float','center');
              		var $th3= $("<td>").text("내용").css('float','center');
              
              		$replySelectTable.append($tr1).append($th1).append($th2).append($th3)
              		for(var key in data){
              		
              		  
              		var $tr = $("<tr>").css("align","center")
              		var $writerTd = $("<td>").text(data[key].c_code).css("width","200px");
              		var $timeTd = $("<td>").text(data[key].reply_time).css("width", "200px");
              		var $contentTd= $("<td>").text(data[key].reply_content).css("width", "400px");
              		$tr.append($writerTd);
              		$tr.append($timeTd);
              		$tr.append($contentTd);
              		$replySelectTable.append($tr).addClass("serviceTable inquiry_list");
              		}
               },
               error:function(msg){
                  alert(msg);
               }
            });
         });
      });
   </script>
		<input type="hidden" name="req_status" value="Y">
 
		<div class="btn_joinL">
		 
							 
		<a href="<%= request.getContextPath()%>/searchRequest.do?req_status=Y"><span>목록</span></a>
						</div>

 

				</div>
				</div>
				</div>

				<br><br><br><br>
				<%@ include file="../common/footer.jsp"%>
</body>
</html>