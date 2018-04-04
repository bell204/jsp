<%@page import="java.util.ArrayList"%>
<%@page import="com.kh.tc.product.model.vo.PageInfo"%>
<%@page import="com.kh.tc.product.model.vo.Pay"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.tc.product.model.vo.product"%>
   
   
   <% ArrayList<product> list = (ArrayList<product>) request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage= pi.getEndPage();
	int page1 = (int)request.getAttribute("currentPage");
	
	
	
%>
   
<!-- 리스트 들어갈 곳 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Page</title>
<style>


.mypage_search {width:99.8%; line-height:50px; background:#efefef; border:1px solid #dedede; text-align:center; }
.mypage_search select, .mypage_search input { border:1px solid #c6c6c6; outline:none; }
.mypage_search select { width:180px; height:28px; }
.mypage_search input { width:370px; height:26px; padding-left:5px; }
.mypage_search a { padding:6px 15px; background:#2fa0ee; font-size:14px; font-weight:600; color:#ffffff; }

.board_list { width:100%; margin-top:10px; }
.board_list li { height:110px;  border:1px solid #c6c6c6; margin-bottom:10px; padding:15px; position:relative; }
.board_list div {float:left;}
.board_list img { padding-right:10px; float:left; width:120px; height:100%; }

.board_list .info { position:relative; float:left; width:440px; height:100%; }
.board_list .info .cate { margin-bottom:15px;}
.board_list .info .date{ position: absolute; top:0; right:100px; }
.board_list .info .hit{ position: absolute; top:0; right:0; }
.board_list .info .option { position: absolute; bottom:0;}
.board_list .inquiry { position:absolute; top:11px; right:0; background:#444444; float:right; }
.board_list .star { position:absolute; bottom:0; right:0; }
.board_list .price {
    position: absolute;
    width: 120px;
    height: 80px;
    font-size: 12px;
    color: #666;
    display: inline-block;
    line-height: 18px;
    border-left: 1px solid #e0e0e0;
    right: 30px;
    padding-left: 20px;
} 
.co444444 { color:#444444 !important; } /*?????*/
.co6393b4 { color:#6393b4 !important; } /*????*/
.co2fa0ee { color:#2fa0ee !important; } /*???*/
.coff4b5c { color:#ff4b5c !important; } /*???*/
.coe14948 { color:#e14948 !important; } /*????*/

.bgnone     { background:none !important; }
.bg444444 { background:#444444 !important; } /*?????*/
.bg979797 { background:#979797 !important; }
.bgff4b5c { background:#ff4b5c !important; }
.bg6393b4 { background:#6393b4 !important; } /*????*/
.bg2fa0ee { background:#2fa0ee !important; } /*???*/
.bge14948 { background:#e14948 !important; } /*????*/
.bgff4b5c { background:#ff4b5c !important; } /*???*/
.bg4b4b4c { background:#4b4b4c !important; }
.bgff8400 { background:#ff8400 !important; } /*??????*/

.board_list .price .price_box {left: 10px; position:relative; width:100%; background:#ff4b5c; font-size:16px; font-weight:600; color:#fff; text-align:center; line-height:60px; }
.pb_table { clear:both; width:100%;  font-size:12px; color:#666; }
.pb_table th { font-weight:normal; }
.pb_table td { text-align:right; }
.board_list .edit { width:100%; text-align:center; margin-top:8px;  }
.board_list .edit a { font-size:14px; font-weight:600; color:#ffffff; border-radius:2px; padding:5px 10px; }
* {margin:0; padding:0; list-style:none; text-decoration:none; font-family: 'Nanum Gothic', sans-serif;}
ul>li>a { text-decoration:none; }
/* table { border-collapse: collapse; }*/
a { color:#666666;}
/*span { color:#666; font-size:12px; }*/


.serviceTable            { width:100%; border-left:1px solid #dedede; border-top:1px solid #dedede; border-right:1px solid #dedede; text-align:center}
.serviceTable th, .serviceTable td { padding:10px 0; border-bottom:1px solid #dedede; color:#666; font-size:13px; line-height:20px;}
.serviceTable th         { font-weight:500; background:#efefef}
.serviceTable td.title      { text-align:left; }
.serviceTable td.title a   { display:inline-block; color:#666; font-weight:600}
.serviceTable td.rec {background: url('../image/common/ico_reple.png') no-repeat left center; padding-left:40px; }

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
      background:white;
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
.purchaseTable { width:100%; margin-top:20px; border-top:1px solid #dedede; border-left:1px solid #dedede; font-size:13px; text-align:left; }
.purchaseTable th, .purchaseTable td { font-size:14px; color:#666; border-bottom:1px solid #dedede; line-height:50px; padding:0 20px 0 30px; }
.purchaseTable th { border-right:0;  font-weight:600; text-align:left; background:#efefef;}
.purchaseTable td { font-weight:normal; border-right:1px solid #dedede;}
.purchaseTable th span { background:#989898; padding:0px 9px; float:right; border-radius:20px; line-height: 26px; margin-top:12px; color:#ffffff; }

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

</style>
</head>
<body>
   <%@ include file="../common/header.jsp" %>  
 
 <div id='A_Container_Wrap'>
 <div id='A_Container'>
 <%@ include file ='../mypage/mypageleft.jsp' %>
   
   <div class="gumaititle">
      <h1 style="margin-left:130px;" class="bor_btm266 m_bottom20">구매상품</h1>
      <br>
   </div>
   <div class="row5">
      
     <form name="search" action="/p/searchProductEngine.do" method="post">
            <div class="mypage_search">
                <input type="text" name="keyword" placeholder="제목을 입력해주세요">
                <a onclick="document.search.submit();">검색</a>
            </div>
            </form>
            <br>
            <ul class="board_list">
     

     <!--작음상품-->




 <% for(product p : list) {%>
					
           <!--사진테두리-->
        <!-- if for 문 들어갈 곳 -->
            <li><a href="#">
             
						<input type="hidden" value="<%= p.getP_code() %>"> 
						 <input type="hidden" value="<%= p.getAd_code() %> ">
								
								
								<a href="#"></a></td>
							
            <!--  상품 사진 -->
              <img src="/p/thumbnail_uploadFiles/<%= p.getSaveFiles() %>" alt="Los Angeles" style="height:81px;" border="0"></a>
           <!--/사진테두리-->
            <div class="info" style="float:left;">
            
            
            <!--<div class="date font_hit">2018-02-26</div>-->
            <p>
               <%= p.getCate1()%>
            <%=   p.getCate2()%>
            <%=  p.getCate3()%>
            <%=  p.getCate4()%>
           </p>
            <h3 class="font_subject2"><a href="#" style='color:#666666;'><%= p.getP_name() %></a></h3>
		 
        </div>
        
            <div class="price" style="float: right;">
                <% if(p.getP_share_count() ==2){ %>
               <div class="price_box m_top15 co2fa0ee bgnone" id="record_status" style='top:6px;'>입금완료</div>	 
            								 <%} %>
            								 
            								  <% if(p.getP_share_count() ==1){ %>
               <div class="price_box m_top15 co2fa0ee bgnone" id="record_status" style='top:6px;'>입금대기</div>	 
            								 <%} %>
     
      			 <% if(p.getP_share_count() ==3){ %>
               <div class="price_box m_top15 co2fa0ee bgnone" id="record_status" style='top:6px;'>공유완료</div>	 
            								 <%} %>
     
     		<% if(p.getP_share_count() ==4){ %>
               <div class="price_box m_top15 co2fa0ee bgnone" id="record_status" style='top:6px;'>거래완료</div>	 
            								 <%} %>
     
     	<% if(p.getP_share_count() ==5){ %>
               <div class="price_box m_top15 co2fa0ee bgnone" id="record_status" style='top:6px;'>수정요청</div>	 
            								 <%} %>
            								 
            								 <% if(p.getP_share_count() ==6){ %>
               <div class="price_box m_top15 co2fa0ee bgnone" id="record_status" style='top:6px;'>구매취소</div>	 
            								 <%} %>
            								 
            								  <% if(p.getP_share_count() ==7){ %>
               <div class="price_box m_top15 co2fa0ee bgnone" id="record_status" style='top:6px;'>판매취소</div>	 
            								 <%} %>
     
            								<div id="purchaseStatus"></div>
           <div class="edit" style="margin-left:10px">  <br>
          
    	<%} %>
     
         </div>
         </li>

  	
  	
  	<script>
		$(function(){
			$(".tableArea td").mouseenter(function(){
				$(this).parent().css({"cursor":"pointer"});
			}).click(function(){
				var num = $(this).parent().children("input").val();
				location.href="<%=request.getContextPath() %>/searchOneRequest.do?num="+num;
			});
		});		
	</script>
  	
  	
   <!-- else 들어갈 곳 -->
    

	
     <!--/작은상품-->
     
</ul>
<div class="list_page" style='margin: 30px auto 0; text-align: center; zoom: 1; font-size:17px;'>
                  <a id ='a1' onclick='page=1; lastback1()' class="first_btn" style='display: inline-block; width: 25px; height: 24px; text-indent: -9999px; vertical-align: bottom; background: url(https://www.sharepeople.co.kr/image/common/arrow_l.png) no-repeat left top;'>처음</a><a id ='a2' onclick="page--;lastback1();" class="first2_btn" style='display: inline-block; width: 24px; height: 24px; text-indent: -9999px; vertical-align: bottom; background: url(https://www.sharepeople.co.kr/image/common/arrow_l.png) no-repeat -25px top;'>이전</a>&nbsp;
                   <a id='currentpage' style='text-decoration:none;color:black'><%= page1 %> </a>
                  &nbsp;<a id ='a3' onclick="page++; lastback1();" class="last2_btn" style=' display: inline-block; width: 25px; height: 24px; text-indent: -9999px; vertical-align: bottom; background: url(https://www.sharepeople.co.kr/image/common/arrow_r.png) no-repeat left top;'>다음</a><a id ='a4' onclick="page=1000000;lastback1();" class="last_btn" style='display: inline-block; width: 24px; height: 24px; text-indent: -9999px; vertical-align: bottom; background: url(https://www.sharepeople.co.kr/image/common/arrow_r.png) no-repeat -26px top;'>맨뒤</a>
               </div>
               <script>
               var page = 1;
               
               var currentpage = <%=page1%>;
               
               if(currentpage ==1){
                  $("#a1").attr('onclick', '').unbind('click');
                  $("#a2").attr('onclick', '').unbind('click');
                  
               }
               if(currentpage==<%=maxPage%>){
                  $("#a3").attr('onclick', '').unbind('click');
                  $("#a4").attr('onclick', '').unbind('click');
               }
               
               function lastback1(){

                    location.href='<%= request.getContextPath() %>/searchRequest.do?currentPage='+page;
                  
               }
               
               
               </script>     

<hr>
           <%--  <div class="pagingArea" align="center">
			<button class="btn btn-default" onclick="location.href='<%= request.getContextPath() %>/searchRequest.do?currentPage=1'"><<</button>
			<% if(currentPage <=1 ){ %>
			<button class="btn btn-default" disabled><</button>
			<%}else{ %>
			<button class="btn btn-default" onclick="location.href='<%= request.getContextPath()%>/searchRequest.do?currentPage=<%= currentPage-1 %>'"><</button>
			<%} %>
			<% for(int p=startPage; p<=endPage; p++){
					if(p == currentPage){
				%>
					<button class="btn btn-default" disabled><%= p %></button>
				<%}else{ %>
					<button class="btn btn-default" onclick="location.href='<%= request.getContextPath()%>/searchRequest.do?currentPage=<%= p%>'"><%= p %></button>
				<%} %>				
			<%} %>			
			
			<% if(currentPage >= maxPage){ %>
			<button class="btn btn-default" disabled>></button>
			<%}else{ %>
			<button class="btn btn-default" onclick="location.href='<%= request.getContextPath()%>/searchRequest.do?currentPage=<%= currentPage +1%>'">></button>
			 
			<%} %>
			<button class="btn btn-default" onclick="location.href='<%= request.getContextPath() %>/searchRequest.do?currentPage=<%= maxPage %>'">>></button>
		</div> --%>
            
            
            
            <!--  div class="list_page" style='margin: 30px auto 0; text-align: center; zoom: 1; font-size:17px;'>
                  <a id ='a1' onclick='page=1; lastback1()' class="first_btn" style='display: inline-block; width: 25px; height: 24px; text-indent: -9999px; vertical-align: bottom; background: url(https://www.sharepeople.co.kr/image/common/arrow_l.png) no-repeat left top;'>처음</a><a id ='a2' onclick="page--;lastback1();" class="first2_btn" style='display: inline-block; width: 24px; height: 24px; text-indent: -9999px; vertical-align: bottom; background: url(https://www.sharepeople.co.kr/image/common/arrow_l.png) no-repeat -25px top;'>이전</a>&nbsp;
                   <a id='currentpage' style='text-decoration:none;color:black'></a>
                  &nbsp;<a id ='a3' onclick="page++; lastback1();" class="last2_btn" style=' display: inline-block; width: 25px; height: 24px; text-indent: -9999px; vertical-align: bottom; background: url(https://www.sharepeople.co.kr/image/common/arrow_r.png) no-repeat left top;'>다음</a><a id ='a4' onclick="page=1000000;lastback1();" class="last_btn" style='display: inline-block; width: 24px; height: 24px; text-indent: -9999px; vertical-align: bottom; background: url(https://www.sharepeople.co.kr/image/common/arrow_r.png) no-repeat -26px top;'>맨뒤</a>
               </div-->
               
   
   


</div>
</div>
<br><br><br><br>
<%@ include file="../common/footer.jsp" %>

</body>
</html>