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
h2 { color:#444; font-size:18px; font-weight:600; margin-top:60px;/*  border-bottom:2px solid #666; */ line-height:40px; }
h3 { color:#666; font-size:16px; font-weight:600; }
h4 { color:#666; font-size:14px; font-weight:600; }

#A_Container_L{ 
   float:left;   width:200px;
}
* {margin:0; padding:0; list-style:none; text-decoration:none; font-family: 'Nanum Gothic', sans-serif;}
ul>li>a { text-decoration:none; }
a { color:#666666;}
.left_SSicon { display:inline-block; width:100%; padding-bottom:10px;}
.left_SSicon a li { width:98px; height:55px; text-align:center; float:left ; background:#336699;color:white; border-radius:3px;  padding-top:15px; font-size:14px; font-weight:600; color:#fff;}
.left_SSicon a:last-child li { margin-left:4px; background:#336699;color:white;}

.left_menu { display:inline-block; width:198px; border-left:1px solid #c6c6c6; border-right:1px solid #c6c6c6; border-bottom:1px solid #c6c6c6;}
.left_menu dl { border-top:1px solid #c6c6c6; }
.left_menu dl a dt { background:#336699;  border-top:1px solid #fff; font-size:14px; font-weight:600; color:white; line-height:40px; padding-left:20px;}
.left_menu dl a:nth-child(2) dd  { padding-top:10px; }
.left_menu dl a:last-child dd { padding-bottom:10px; }
.left_menu dl a dd { font-size:12px; font-weight:600; color:#888888; line-height:26px; padding-left:20px; }
.left_menu dl a:hover dd, .left_menu dl a.on dd { color:#0eade7; }

</style>
</head>
<body>

<div id="A_Container_L">

   <h1><a href="/mypage" style="color:black;">MY PAGE</a></h1>
   <ul class="left_SSicon">
      <a href="/p/views/product/insertTalent.jsp"><li><p>재능기부</p></li></a>
             
     <input type="hidden" id="Y" value="Y">
     
         <a href="/p/views/category/requestShare.jsp"><li><p>재능요청</p></li></a>
       
    
     
        <!--  <script>
         function request(){
        	 var req_status= $("#Y").val();  
        	 location.href="<%=request.getContextPath() %>/searchRequest.do?req_status="+req_status;
              
          }
         </script>-->
      
   </ul>

   <div class="left_menu">
        <dl>
               <a onclick="ManagingBuy()"><dt>구매관리</dt></a>
                 <a onclick="searchPaylist1()"><dd>구매내역</dd></a>
       <!--a href="/p/views/mypage/buy.jsp"><dd>구매내역</dd></a-->
                 <input type="hidden" id="idx" value="1">
                  <a onclick="cart()" ><dd>공유바구니</dd></a>
 
         </dl>
       
            <script>
                   function cart() {  
                      location.href="<%=request.getContextPath() %>/selectCart.do";
                   }
                   function searchPaylist1(){
                      location.href="<%=request.getContextPath() %>/searchPayCount.do"; 
                      
                   }
                   function ManagingBuy(){
                      location.href="<%=request.getContextPath() %>/BuyList.do"; 
                      
                   }
                   
                   
                   </script>
         
         <dl>
               <a href="/p/selectMyProduct"><dt>판매관리</dt></a>
               <a href="/p/sellstory"><dd> 판매내역</dd></a>
               <a href="/p/selectIncome?num=1"><dd> 수익금관리</dd></a>
               <a href="/p/myProductList"><dd> 광고신청</dd></a>

         </dl>
         <dl>
               <a href="#"><dt>개인정보관리</dt></a>
               <a href="/p/views/member/profileupdate.jsp"><dd> 개인정보수정</dd></a>
               <a href="/p/views/pay/tcCash.jsp"><dd> 오동캐시</dd></a>
               <a href="/p/views/member/profilechange.jsp"><dd> 프로필관리</dd></a>
               <a href="/p/views/member/profiledelete.jsp"><dd> 탈퇴하기</dd></a>
         </dl>
         <dl>
               <a href="#"><dt>메세지</dt></a>
               <a href="/p/views/message/allmessage.jsp"><dd>전체 메세지</dd></a>
               <a href="/p/views/message/allmessage.jsp"><dd>안읽은 메세지</dd></a>
               <a href="/p/views/message/allmessage.jsp"><dd>중요 메세지</dd></a>
         </dl>
   </div>
   </div>
   
</body>
</html>
