 <%@page import="java.util.ArrayList"%>
<%@page import="com.kh.tc.product.model.vo.product"%>
<%@page import="oracle.net.aso.p"%>
 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     
  <% ArrayList<product> list= (ArrayList<product>) request.getAttribute("list"); %>	
 
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
#A_Container   { width:1000px; margin:0 auto; margin-top:50px; margin-bottom:20px; clear:both; overflow: hidden; min-height:500px;}
#A_Container_Wrap  { width:100%; clear:both;  height:100%;}



.gumai-wrap li img{
	padding:20px;
	width:180px;
	height:128px;
	padding:0;
	
}

.gumai-container{
	margin-left: 20px;
	float: left;
	width: 780px;
}
.gumai-wrap{
	overflow: hidden;
}
.gumai-wrap li{
	float: left;
	width:580px;
	height:150px;
	border:1px solid lightgray;
	padding: 10px;
	box-sizing: border-box;
}
.gumai-wrap li:last-child{
	width:200px;
	border-left: 0;
	box-sizing: border-box;
	text-align:center;
	
}
.basketBtn1{
	background:#3B87F0;
	color:white;
	width:60px;
	height:30px;
	border-top-left-radius:     1em 1em;
  	border-top-right-radius:    1em 1em;
  	border-bottom-right-radius: 1em 1em;
  	border-bottom-left-radius:  1em 1em;
}
.basketBtn2{
	background:#FB574F;
	color:white;
	width:60px;
	height:30px;
	border-top-left-radius:     1em 1em;
  	border-top-right-radius:    1em 1em;
  	border-bottom-right-radius: 1em 1em;
  	border-bottom-left-radius:  1em 1em;
  	
}
img{
	width:100px;
	height:100px;
}
 table{
 margin-top:20px;
 padding:20px;
 }
 
</style>
</head>
<body>
   <%@ include file="../common/header.jsp" %>  
 
 <div id='A_Container_Wrap'>
 <div id='A_Container'>
    <%@ include file = "../mypage/mypageleft.jsp" %> 
   
   <div class="gumai-container">
  
   <input type="hidden" name="CkCart">
<input type="hidden" name="Cktype" value="all">
 


  	<h3>구매 목록</h3>
    <table class="btn btn-default" cellspacing="0" border="1">
	<colgroup>
		<col style="width:10%">
		<col style="width:70%">
		<col style="width:20%">
	</colgroup>
	 <% if(list != null){ %>
	<tr>
	
		<% for(product p : list){		%>
	 
		<td border="1"><img src="/p/thumbnail_uploadFiles/<%= p.getSaveFiles() %>" width="200px" height="150px" style="float:left"></td>

	    	 
	
		<td><li class="floating-box">
		<p>판매자코드:<%= p.getC_code() %></p>
		<p>제품명 :  <%= p.getP_name() %></p>
		<%if(p.getOption()!=null&&!p.getOption().equals("선택")) {%>
		<p>옵션 : <%= p.getOption() %></p>
		<%} %>
		<p> 카테고리 : 
		[<%= p.getCate1()%>>
         <%=   p.getCate2()%>>
          <%=  p.getCate3()%>>
           <%=  p.getCate4()%>]
		  </p>  
					 	</td>
					<div class="date font_hit"></div>
					<!--<div class="hit font_hit">조회수 : 391회</div>-->
					<h3 class="font_subject2"><a href="/ContentShop/mall_main.asp?category=1202010500&strCartMode=cart_in&strUrl=direct&strOrderMode=order&g_idx=1436&temp=view">
					</a></h3>
				 

							<!-- 실제 컨텐츠 가격-->
							<input type="hidden" name="g_money" value="600" />
							<input type="hidden" name="g_name" value="CU 롯데 초코빼빼로 기프티콘" />
					  </li></td> 
	<td style="padding: 0px 0 13px 9px;">
		<li class="floating-box" style="text-align:center;">
		  						<br>기본가격 : <%= p.getP_price() %>원 <br>
								<br>수량 : <%= p.getAd_code() %>개 <br>
				 
							</li>
</td>
</tr>
</table>
 
<!-- 장바구니 리스트 End -->
	<table width="100%" cellspacing="0" cellpadding="5">
		<tr>
			<td height="20" colspan="1"><div align="right"><b><font color="#000000">합계
						 
							: <%= p.getTotal_price() %> 원
				<input type=hidden name=totalPoint value="" /></font> </b></div></td>
		</tr>
	 
	</table>

 
<ul class="board_list" >
 
		
		<table width="100%"  border="1" cellspacing="0" cellpadding="5">
		<colgroup>
							<col style="width: 50%">
							<col style="">
							<col style="width: 13%">
							<col style="width: 20%">
							<col style="width: 10%">
						</colgroup>
		
				<a href="#">
				</a>
	 
				<div class="info" >
				 
				 <tr>
				 <td>
			 
				


		</td>
	 </tr>
	</table>
 
	
</ul>
	
  
<form name="order_info" method="post">

<input type = "hidden" name ="p_price" value = "<%=p.getP_price()%>"/> 
<input type = "hidden" name = "p_code" value = "<%=p.getP_code() %>" /> 
<input type = "hidden" name = "p_name" value = "<%= p.getP_name() %>" /> 
<input type="hidden" name="p_count" value="<%= p.getAd_code() %>">  
<input type="hidden" name="p_option" value="<%= p.getOption() %>">  
	<input type = "hidden" name ="totalPrice" value = "<%=p.getTotal_price()%>" /><!--합계금액-->
 <%} %>



<h2 class="bor_none sub_title" style="margin-top:20px;">결제수단</h2>
<table class="btn btn-default" cellspacing="0" width="100%">
	<colgroup>
		<col style="width:100%">
 
	</colgroup>
 	<tr>
		<th>결제수단</th>
 
	<td style="padding: 15px; align:center;">
		<input name="o_pay_status"  class="new" value="card"  type="radio">신용카드
	<input name="o_pay_status"  class="new" value="bank"  type="radio">가상계좌(무통장입금)
</td>
</tr>
</table>
</form>

 
 
<script type="text/javascript">
$('#taxchkk').click(function(){
	if($("#taxchkk").is(":checked") == true){
		$("#taxbox").show();
}
else{
		$("#taxbox").hide();
}
});
</script>
 
 <hr>

<table class="btn" style="align:center"  align="center">
	<tr>
	<td>
	<a  class="btn btn-default" onclick="jsf_pay();">결제하기</a></td>
 </tr>
</table>



<script language="javascript">

console.log(<%= list.get(0).getP_code() %>);
 
		function jsf_pay()
		{
			var aa = document.order_info.o_pay_status;
			var conf = "";
			for(i=0;i<aa.length;i++){
			if(aa[i].checked == true){
				conf = true;
				//이런식으로 체크가 되었는지 안되었는지로 확인해야 한다.
				//value값으로 확인이 불가하다.
			}
			}
			if(conf == false){
			alert("결제수단을 선택해주세요");
			aa[0].focus();
			return false;
			}

			 
			//신용카드
			if (document.order_info.o_pay_status[0].checked == true)
			{
				if (confirm("구매하시겠습니까?")) {
					
					
					document.order_info.action = "/p/InsertImport.do";
					document.order_info.submit();
				}else{
					alert("취소하셨습니다.");
					return false;
					//history.back(-1);
				}
			}

			// 무통장
			if (document.order_info.o_pay_status[1].checked == true)
			{
				if (confirm("구매하시겠습니까?")) {
					
					document.order_info.action = "/p/InsertBank.do";
					document.order_info.submit();
				}else{
					alert("취소하셨습니다.");
					return false;
					//history.back(-1);
				}
			}
		}

 
</script>

   	<%}else{ %>
	
	  
	   <%} %>
   
   </div>



</div>
</div>

<br><br><br><br>
<%@ include file="../common/footer.jsp" %>
</body>
</html>