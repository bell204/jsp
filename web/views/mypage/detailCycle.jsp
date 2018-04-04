<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.tc.product.model.vo.DetailCycle"%>
    <%DetailCycle dc = (DetailCycle)request.getAttribute("dc"); 
      String cate = (String)request.getAttribute("cate"); 
      String num= request.getAttribute("num")+""; %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Page</title>

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



</style>
</head>
<body>
   <%@ include file="../common/header.jsp" %>  
 

 <div id='A_Container_Wrap'>
 <div id='A_Container'>
 <%@ include file ='../mypage/mypageleft.jsp' %>
   
   <div class="gumaititle">
      <h1 style="margin-left:130px;" class="bor_btm266 m_bottom20">거래상세</h1>
      <br>
   </div>
   
<div id="A_Container_C">
   <table class="mypage_table" cellspacing="0">
				<colgroup>
					<col style="width:180px">
					<col style="width:">
  			  <col style="width:80px">
				</colgroup>


	<tbody><tr>
		<th rowspan="3"><p class="num">거래번호 : <%=dc.getRecord_code() %></p> <p class="date"><%=dc.getPay_time() %><br><%=dc.getSc_name() %></p></th>
		<td>
									<img src="/p/thumbnail_uploadFiles/<%=dc.getSave_filename() %>">
									<div class="info">
											<p class="cate font_cate"><%=cate %></p>
											<div class="hit font_hit"><%=dc.getPay_time() %></div>
											<h3 class="font_subject2"><%=dc.getP_name() %></h3>
											<div class="option font_userId">
											</div>
									</div>
							</td>
						</tr>
						<tr>
							<td>
								<ul>
										<li>기본가격	<em><%=String.format("%,d", dc.getP_price()) %>원</em>	</li>
											<li>수량		<em><%=dc.getP_count() %></em>		</li>
											
											<li id='option1' style='display:none'>옵션		<em><span id='option2'><%=dc.getP_option() %></span></em>		</li>
											
											
											<li>배송비		<em>0원</em>		</li>
											<li>구매자		<em><%=dc.getBc_name() %></em>		</li>
											<input type='hidden' value='<%=dc.getBc_code() %>'>
									</ul>
							</td>
	</tr>
	<tr>
		<td>총 결제금액			<em><b class="price"><%=String.format("%,d", dc.getPay_price()) %></b> 원</em></td>
	</tr>
	
	<tr>
		<td colspan="2">주문시간 : <%=dc.getPay_time() %>
		<%if(dc.getRecord_status()==1 ) {%>
		 <p></p> 입금대기
		<%}else if(dc.getRecord_status()==2 ) {%>
		  <p></p>입금완료
		<%}else if(dc.getRecord_status()==3 ) {%>
		 <p></p> 공유완료
		<%}else if(dc.getRecord_status()==4 ) {%>
		  <p></p>거래완료
		<%}else if(dc.getRecord_status()==5 ) {%>
		 <p></p>수정요청중
		<%}else if(dc.getRecord_status()==6 ) {%>
		<p></p> 구매자취소
		<%}else if(dc.getRecord_status()==7 ) {%>
		<p></p> 판매자취소
		<%}; %>
		</td>
	</tr>
	
	
</tbody></table>
<div class="btn_bottom">
<a href="#"  id='a1'><span>문의하기</span></a>
<a href="<%=request.getContextPath()%>/complteDeal?dealcode=<%=dc.getRecord_code()%>&num=<%=num %>"  id='a2'><span class="bgff4b5c">거래완료</span></a>
<a href="<%=request.getContextPath()%>/requestDeal?dealcode=<%=dc.getRecord_code()%>&num=<%=num %>" id='a3'><span class="bg979797">수정요청</span></a>
<a href="<%=request.getContextPath()%>/cancelDeal?dealcode=<%=dc.getRecord_code()%>&num=<%=num %>"  id='a4'><span class="bgff8400">구매취소</span></a>
<a href="<%=request.getContextPath()%>/cancelDeal?dealcode=<%=dc.getRecord_code()%>&num=<%=num %>"  id='a5'><span class="bg6393b4">판매취소</span></a>
</div>
</div>
<script>

var option = "<%=dc.getP_option() %>";
console.log(option==null)
if(option!=null&&option!="선택"){
	console.log(option)
	$("#option1").css("display","block")
$("#option2").text(option)
}

$(function(){
	var status5 = <%=dc.getRecord_status()%>
	if(status5==1){
		
		if(<%=num %>==1){
		$("#a4").css("display","none");
		$("#a2").css("display","none");
		$("#a3").css("display","none");
		}else{
			$("#a5").css("display","none");
			$("#a2").css("display","none");
			$("#a3").css("display","none");
			
		}
		
		}else if(status5==2){
			$("#a4").css("display","none");
			$("#a5").css("display","none");
			$("#a3").css("display","none");
			
		}else if(status5==3||status5==8){
			if(<%=num %>==1){
			$("#a3").css("display","none");
			$("#a4").css("display","none");
			$("#a5").css("display","none");
			}else{
				
				$("#a4").css("display","none");
				$("#a5").css("display","none");
				
			}
			
		}else if(status5==4){
			
			$("#a2").css("display","none");
			$("#a3").css("display","none");
			$("#a4").css("display","none");
			$("#a5").css("display","none");
			
		}else if(status5==5){
			
			$("#a3").css("display","none");
			$("#a4").css("display","none");
			$("#a5").css("display","none");
			
		}else if(status5==6){
			$("#a2").css("display","none");
			$("#a3").css("display","none");
			$("#a4").css("display","none");
			$("#a5").css("display","none");
			
		}else if(status5==7){
			
			$("#a2").css("display","none");
			$("#a3").css("display","none");
			$("#a4").css("display","none");
			$("#a5").css("display","none");
			
		}
})


</script>


</div>
</div>

<br><br><br><br>
<%@ include file="../common/footer.jsp" %>

</body>
</html>