<%@page import="com.kh.tc.product.model.vo.product"%>
<%@page import="com.kh.tc.product.model.vo.Pay"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Page</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>




<style>
.bgnone	  { background:none !important; }
.bg444444 { background:#444444 !important; } /*?????*/
.bg979797 { background:#979797 !important; }
.bgff4b5c { background:#ff4b5c !important; }
.bg6393b4 { background:#6393b4 !important; } /*????*/
.bg2fa0ee { background:#2fa0ee !important; } /*???*/
.bge14948 { background:#e14948 !important; } /*????*/
.bgff4b5c { background:#ff4b5c !important; } /*???*/
.bg4b4b4c { background:#4b4b4c !important; }
.bgff8400 { background:#ff8400 !important; } /*??????*/

#A_Container_L{ 
   float:left;   width:200px;
}
#A_Container_C{ 
	width:770px; 
	float:left;
	overflow:hidden;
	margin-left:50px;
}
#A_Container   { width:1100px; margin:0 auto; margin-top:50px; margin-bottom:20px; clear:both; overflow: hidden; min-height:500px;}
#A_Container_Wrap  { width:100%; clear:both;  height:100%;}


   .gumaititle{
      margin-left:120px;
      
   }
   
   .mypage_table { width:100%; border:1px solid #dedede; border-bottom:none; margin-bottom:50px; font-size:14px; margin-top:10px; }
.mypage_table th{ text-align:left; padding-left:25px; }
.mypage_table td{ color:#666; border-bottom:1px solid #e6e6e6; }
.mypage_table tr:first-child th { border-right:1px solid #dedede; }
.mypage_table tr:last-child { background:#d8e2e8; height:40px; }
.mypage_table tr:last-child th, .mypage_table tr:last-child td{ font-size:14px; font-weight:600; color:#666666; }
.mypage_table tr:nth-child(1) td { padding:30px; }
.mypage_table tr:nth-child(2) td:nth-child(1) { padding:30px;  border-right:1px solid #e6e6e6; }
.mypage_table tr:nth-child(2) td:nth-child(2), .mypage_table tr:nth-child(4) td:last-child { text-align:center; padding:0px; border-bottom:none; }
.mypage_table tr:nth-child(3) td { line-height:40px; font-size:14px; font-weight:600;  border-right:1px solid #e6e6e6; border-bottom:none; padding:0 30px; }
.mypage_table tr:nth-child(4) td {padding:10px 0 10px 30px; }
.mypage_table tr:nth-child(4) td { border-right:none; position:relative; }
.mypage_table td a.btn { font-size:12px; font-weight:normal; color:#ffffff; background:#979797; padding:8px; border-radius:2px; display:inline-block; }
.mypage_table li { line-height:24px; background: url(../image/common/list_dot.png) no-repeat left center; padding-left:15px; }
.mypage_table .price { font-size:18px; font-weight:600; color:#e14948; }
.mypage_table img { float:left; padding-right:20px; width:120px; }
.mypage_table em { float:right; font-style:normal; }
.mypage_table .num { font-size:16px; font-weight:600; color:#444444;}
.mypage_table .date { font-size:12px; font-weight:normal; color:#666666; padding-top:20px;}
.mypage_table .info { position:relative; float:left; width:380px; height:;}
.mypage_table .info p.cate { margin-bottom:15px;}
.mypage_table .info div.hit{ position: absolute; top:0; right:0; }
.mypage_table .info div.option { padding-top:8px;}
.mypage_table .inquiry { position:absolute; top:5px; right:0; background:#444444; float:right; }
   
   * {margin:0; padding:0; list-style:none; text-decoration:none; font-family:"Nanum Gothic"; }
ul>li>a { text-decoration:none; }
a { color:#666666; text-decoration:none;}
table { border-collapse: collapse; }

.w30 { width:30%; }
.w80 { width:80%; }
.btn_wrap { float:right; padding-top:10px; }
.btn_wrap a { display:inline-block; width:60px; height:32px; line-height:32px; /*padding:0 20px;*/ font-size:14px; font-weight:600; color:#fff; text-align:center; background:#666666; }
.bg333333 { background:#333333 !important; } /*진회색*/
   

.bor_none { border:none !important; }
.bor_top4ff { border-top: 4px solid #ffffff; }
.bor_btm266 { border-bottom: 2px solid #666666;  }
.m_bottom20 {margin-bottom:20px !important; width:700px;} 
.bor_r {border-right:1px solid #dbdbdb !important;}
.cursor { cursor:pointer; }
.btn_bottom { margin-top: 6px; text-align: center; }
.btn_bottom span { display: inline-block; width: 130px; padding: 0; border-radius: 3px; color: #fff; font-size: 16px; font-weight:600; line-height: 40px; background: #2fa0ee; }




 .btn_bottom span { display: inline-block; width: 130px; padding: 0; border-radius: 3px; color: #fff; font-size: 16px; font-weight:600; line-height: 40px; background: #2fa0ee; }
 
 a { color:#666666; text-decoration:none;}
 
.order_button{
float:right;
}


#A_Container_L {
   float: left;
   width: 200px;
}

#A_Container_C {
   text-align:center;
   width: 770px;
   float: left;
   overflow: hidden;
   margin:40px;
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


li {
    display: list-item;
    text-align: -webkit-match-parent;
}
.bold{
   text-color:gray;
}
th{
   background:#dddddd;

}
td{
text-align: center;
}
.firstBar{
background:#dddddd;
}
img{
width:150px;
height:100px;
}
 .serviceTable {
	width: 90%;
	border-left: 1px solid #dedede;
	border-top: 1px solid #dedede;
	border-right: 1px solid #dedede;
	text-align: center;
}
table {
	display: table;
	border-collapse: separate;
	border-spacing: 1px;
	border-color: grey;
	border:  1px solid #dedede;
	
}
tr{
border-collapse: separate;
	border-spacing: 1px;
	border-color: grey;
	border:  1px solid #dedede;}

 
 td{
height:50px;
}
</style>
</head>
<body>
 

    <%@ include file="../common/header.jsp"%>

   <div id='A_Container_Wrap'>
      <div id='A_Container'>
          <%@ include file ='../mypage/mypageleft.jsp' %>
  
    <div id="A_Container_C">
    

    
<colgroup>
   <col style="width:95%;">
  </colgroup>

<table style="width:90%;" class="table table-bordered">
<tr>
 
  <th class="firstBar" >
        <h1 align="center"> 주문이 완료되었습니다.</h1>
        <h4 align="center">무통장 입금을 선택하신 고객께서는 입금을 완료해야 공유 단계가 진행됩니다.</h4>
      </th>
      
</tr>
</table>
 
   
   <!-- pcode를 불러와야 함 -->
 

      
<table class="serviceTable">
   <colgroup>
       <col style="width:40%;">
          <col style="width:40%;">

      </colgroup>
     
      <tbody><tr>
         <th><p align="center">입금은행</p></th>
         <td>농협중앙회</td>
      </tr>
      <tr>
         <th><p align="center">입금계좌</th>
         <td>79014338631249</td>
      </tr>
      <tr>
         <th><p align="center">예금주</th>
         <td>（주) 오늘의 동료</td>
      </tr>
      <tr>
         <th><p align="center">입금기간</th>
         <td>20180321</td>
      </tr>
   </tbody></table>

  <table class="CreditCard" style="width:100%;" class="table table-bordered">
     <colgroup>
         <col style="width:40%;">
          <col style="width:25%;">
          <col style="width:15%;">
          <col style="width:20%;">
      </colgroup>
     <tbody>
 
  <!-- 구매할 리스트  Start -->
 
 
     <tr id="rst">    
	 
     </tr>
 
  </tbody></table>

  <colgroup>
  
     <col style="width:95%;">
         <col style="">
    
  </colgroup>
<hr>
       <div class="btn_bottom">
       <a href="<%= request.getContextPath()%>/myPage?=<%=loginUser %>" align="center"; ><span>확인</span></a>
             
          </div>
          </div>
          </div>
          </div>
 
 
 
 
 
</body>
</html>