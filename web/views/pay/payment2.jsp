<%@page import="com.kh.tc.product.model.vo.product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <% product product =(product)request.getAttribute("product"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Homework</title>
<style>
   #A_Container_L 
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

.person_change { width:750px; border:1px solid #dedede; border-bottom:none; margin-bottom:30px; font-size:13px;}
.person_change th{width:150px; text-align:left; background:#efefef;   color:#666;   font-weight:normal; padding-left:30px; border-bottom:1px solid #e6e6e6; height:40px; }
.person_change td{ position:relative; padding:6px 0 6px 9px; color:#666; border-bottom:1px solid #e6e6e6; }
.person_change p {   margin-left:10px;}
.person_change input {   border:1px solid #c6c6c6;   outline:none;   height:26px;    padding-left:5px;}
.btn_bottom { margin-top: 6px; float:right; text-align:center; }
.btn_bottom span { display: inline-block; width: 120px; padding: 0; border-radius: 3px; color: #fff; font-size: 16px; font-weight:600; line-height: 40px; background: darkgray; }
</style>
</head>
<body>
<%@ include file="../common/header.jsp"%>

   <div id='A_Container_Wrap'>
      <div id='A_Container'>
         <%@ include file="../mypage/mypageleft.jsp"%>

         <!--  -->
         <br><br><br><br><br><br><br><br>
         
         <div id="A_Container_C" style="margin-left:20px">
            <br>
            
            <form name="Delform" method="post" action="?member2=DelOk&amp;">
               <table class="person_change" cellspacing="0">
                  <tbody>
                     <tr>
                        <th>지불방법</th>
                        <td></td>
                     </tr>
                     <tr>
                        <th>상품명</th>
                        <td> <%=product.getP_name() %></td>
                     </tr>
                     <tr>
                        <th>결제금액</th>
                        <td><%=product.getP_price() %></td>
                     </tr>
                     <tr>
                        <th>구매자</th>
                        <td></td>
                     </tr>
                  </tbody>
               </table>
               <div class="btn_bottom f_right">
                  <a href="/p/views/pay/import.jsp"><span>결제하기</span></a> 
                  <a href="#"><span class="bg979797" onclick='history.back()'>뒤돌아가기</span></a>
               </div>
            </form>

         </div>
      </div>
   </div>   
   <br><br><br><br>
   <%@ include file="../common/footer.jsp"%>
</body>
</html>