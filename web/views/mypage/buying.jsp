<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Page</title>
<style>


#A_Container_L{ 
   float:left;   width:200px;
}
#A_Container_C {
    width: 770px;
    float: left;
    overflow: hidden;
}
#A_Container   { width:1100px; margin:0 auto; margin-top:50px; margin-bottom:20px; clear:both; overflow: hidden; min-height:500px;}
#A_Container_Wrap  { width:100%; clear:both;  height:100%;}


.tdiv{
      width:100px;
      height:50px;
      background:white;
      margin:10px;
       border-top-left-radius:     1em 1em;
         border-top-right-radius:    1em 1em;
         border-bottom-right-radius: 1em 1em;
         border-bottom-left-radius:  1em 1em;
   }
   .row5 th{
      text-align:center;
      align:center;
   }
   .row5{
      width:700px;
      background:lightgray;
      margin-left:50px;
      margin-right:auto;
      float:left;
      border-top-left-radius:     1em 1em;
        border-top-right-radius:    1em 1em;
        border-bottom-right-radius: 1em 1em;
        border-bottom-left-radius:  1em 1em;
   }
   .row5 table{
      margin-left:auto;
      margin-right:auto;
   }
   .row2{
      width:700px;
      margin-left:50px;
      float:left;
   }
   
   .rnum{
      float:right;
      margin-top:10px;
      
   }
   
   .row2 h5{
      margin-left:20px;
      
   }
   .gumai{
      width:700px;
      
   }
   .row2 th{
      border-left:0.3px solid lightgray;
      border-bottom:0.3px solid lightgray;
      border-right:0.3px solid lightgray;
      border-top:0.3px solid lightgray;
   } 
   .gumaititle{
      margin-left:120px;
      
   }
.bor_none { border:none !important; }
.bor_top4ff { border-top: 4px solid #ffffff; }
.bor_btm266 { border-bottom: 2px solid #666666;  }
.m_bottom20 {margin-bottom:20px !important; width:700px;} 
.bor_r {border-right:1px solid #dbdbdb !important;}
.cursor { cursor:pointer; }

table[Attributes Style] {
    -webkit-border-horizontal-spacing: 0px;
    -webkit-border-vertical-spacing: 0px;
}
user agent stylesheet
table {
    display: table;
    border-collapse: separate;
    border-spacing: 2px;
    border-color: grey;
}
li {
    display: list-item;
    text-align: -webkit-match-parent;
}
	.gongyou1{
		width:700px;
		height:70px;
		border:1px solid lightgray;
	}
	.minigumai{
		margin-left:100px;
		margin-top:20px;
	}
	.search1{
		border:0;
	}
	.moklok{
		width:700px;
		height:200px;
		border:1px solid lightgray;
		background:#EBF0FB;
	}
	

</style>
</head>
<body>
   <%@ include file="../common/header.jsp" %>  
 

 <div id='A_Container_Wrap'>
 <div id='A_Container'>
 <%@ include file ='../mypage/mypageleft.jsp' %>
   
   <div class="gumaititle">
      <h1 style="margin-left:130px;" class="bor_btm266 m_bottom20">판매내역</h1>
      <br>
   </div>
   <div class="row5">
      
      <table>
         <tr>
            <th>
               <a class=cursor><div class="tdiv"><p>공유대기중</p><p style="color:blue">0</p></div></a>
            </th>
            <th><span class="glyphicon glyphicon-chevron-right"></span></th>
            <th>
               <a class=cursor><div class="tdiv"><p>공유진행중</p><p style="color:blue">0</p></div></a>
            </th>
            <th><span class="glyphicon glyphicon-chevron-right"></span></th>
            <th>
               <a class=cursor><div class="tdiv"><p>공유완료</p><p style="color:blue">0</p></div></a>
            </th>
            <th><span class="glyphicon glyphicon-chevron-right"></span></th>
            <th>
               <a class=cursor><div class="tdiv"><p>거래완료</p><p>0</p></div></a>
            </th>
            <th></th>
            <th>
               <a class=cursor><div class="tdiv"><p>수정요청</p><p style="color:red">0</p></div></a>
            </th>
         </tr>
      </table>
   </div>
   <br>
   <br><br><br>
   
  <div class="row2">
   <hr>
     <h3>공유진행중</h3>
     <div class="gongyou1">
     <div class="minigumai">
     	<select>
     		<option>제목</option>
     		<option>아이디</option>
     	</select>
     	<input type="text" style="width:350px;">
     	<button class="search1" style="width:60px; height:30px; background:darkgray;">검색</button>
     </div>
     </div>
     
     <br>
     
     <div class="moklok">
     	<h3 style="margin-left:20px">내역이 없습니다.</h3>
     </div>
   </div>



</div>
</div>
<br><br><br><br>
<%@ include file="../common/footer.jsp" %>

</body>
</html>
	}