<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.tc.product.model.vo.IncomeStory"%>
    <%ArrayList<IncomeStory> incomeList = (ArrayList<IncomeStory>)session.getAttribute("incomeList"); %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../_css/jquery-ui.css">
<script src="../js/jquery-ui.js"></script>
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
    margin-left:50px;   
}
#A_Container   { width:1100px; margin:0 auto; margin-top:50px; margin-bottom:20px; clear:both; overflow: hidden; min-height:500px;}
#A_Container_Wrap  { width:100%; clear:both;  height:100%;}

.sharelist_tab { display:inline-block; width:101%; border: 1px solid #dedede; margin-top:50px; }
.sharelist_tab li { float:left; width:49.8%; background:#efefef; line-height:50px; font-size:16px; font-weight:600; color:#666666; text-align:center;  }
.sharelist_tab li:first-child { border-right: 1px solid #dedede; }
.sharelist_tab li.on3, .sharelist_tab li:hover { background:#2d9fee; color:#ffffff; }

.list_page { margin: 30px auto 0; text-align: center; zoom: 1; }
.list_page .first_btn { display: inline-block; width: 25px; height: 24px; text-indent: -9999px; vertical-align: bottom; background: url(https://www.sharepeople.co.kr/image/common/arrow_l.png) no-repeat left top; }
.list_page .first2_btn { display: inline-block; width: 24px; height: 24px; text-indent: -9999px; vertical-align: bottom; background: url(https://www.sharepeople.co.kr/image/common/arrow_l.png) no-repeat -25px top; }
.list_page ul { display: inline-block; overflow: hidden; padding: 0 7px; vertical-align: bottom;}
.list_page li { float: left; margin: 0 5px;}
.list_page li:hover a, .list_page li a.on { color: #fff; background: #0eade7;}
.list_page li a { display: block; width: 24px; height: 24px; font-size: 12px; color: #444; text-align: center; line-height: 25px; }
.list_page .last2_btn { display: inline-block; width: 25px; height: 24px; text-indent: -9999px; vertical-align: bottom; background: url(https://www.sharepeople.co.kr/image/common/arrow_r.png) no-repeat left top; }
.list_page .last_btn { display: inline-block; width: 24px; height: 24px; text-indent: -9999px; vertical-align: bottom; background: url(https://www.sharepeople.co.kr/image/common/arrow_r.png) no-repeat -25px top; }

.serviceTable				{ width:100%; border-left:1px solid #dedede; border-top:1px solid #dedede; border-right:1px solid #dedede; text-align:center;}
.serviceTable th, .serviceTable td { padding:10px 0; border-bottom:1px solid #dedede; color:#666; font-size:13px; line-height:20px;}
.serviceTable th			{ font-weight:500; background:#efefef}
.serviceTable td.title		{ text-align:left; }
.serviceTable td.title a	{ display:inline-block; color:#666; font-weight:600}
.serviceTable td.rec {background: url('../image/common/ico_reple.png') no-repeat left center; padding-left:40px; }



</style>
</head>






<body>
   <%@ include file="../common/header.jsp" %>  
 
 <div id='A_Container_Wrap'>
 <div id='A_Container'>
    <%@ include file = "../mypage/mypageleft.jsp" %>
    
    <div id="A_Container_C" >
            <ul class="sharelist_tab">
            <a href="/p/selectIncome?num=1"><li style="width:33%" class="on">수익금정산</li></a>
            <a href="/p/selectIncome?num=2"><li style="width:33%" class='on2'>수익금출금신청</li></a>
            <a href="<%=request.getContextPath()%>/incomeStory"><li style="width:33%" class='on3'>수익금출금신청내역</li></a>
            </ul>
            <br><br>
            <h1>수익금 출금 신청내역</h1>
            
            <table class="serviceTable" style="text-align:center;">
		<colgroup>
				<col style="width:7%">
				<col style="width:10%">
				<col style="width:36%">
				<col style="">
				<col style="width:10%">
		</colgroup>
		<thead>
				<tr >
						<th style="border-right:1px solid #c6c6c6; text-align:center;" >NO</th>
						<th style="border-right:1px solid #c6c6c6; text-align:center;">신청금액</th>
						<th style="border-right:1px solid #c6c6c6; text-align:center;">신청일</th>
						<th style="border-right:1px solid #c6c6c6; text-align:center;">출금완료일</th>
						<th style="border-right:1px solid #c6c6c6; text-align:center;">출금상태</th>
				</tr>
		</thead>
		<tbody id='tbody'>
  	<%if(incomeList.size()==0 ) {%>
		<tr>
			<td colspan="5">신청내역이 없습니다.</td>
			
		</tr>
		<%}else{ 
		for(int i=0;i<incomeList.size();i++){
			String str = String.format("%,d", incomeList.get(i).getRequestPrice() );

		%>
		<tr id='price'>
			<td><%=i+1 %></td>
			<td ><%=str %></td>
			<td><%=incomeList.get(i).getRequestDate() %></td>
			<td><%if(incomeList.get(i).getRequestOk()==null) {%>
			출금 검사 중입니다.
			<%}else{ %>
			<%=incomeList.get(i).getRequestOk() %>
			<%}; %>
			</td>
			<td><%if(incomeList.get(i).getRequestStatus()==1) {%>
			출금대기
			<%}else if(incomeList.get(i).getRequestStatus()==2){ %>
			출금거부
			<%}else{ %>
			출금완료
			<%}; %>
			</td>
			
		</tr>
		
		
		<%} %>
		
		
		
		<%}; %>
  
</tbody></table>





		
	<div class="list_page" style='margin: 30px auto 0; text-align: center; zoom: 1; font-size:17px;'>
						<a onclick='page=1; lastback()' class="first_btn" style='display: inline-block; width: 25px; height: 24px; text-indent: -9999px; vertical-align: bottom; background: url(https://www.sharepeople.co.kr/image/common/arrow_l.png) no-repeat left top;'>처음</a><a onclick="page--;lastback();" class="first2_btn" style='display: inline-block; width: 24px; height: 24px; text-indent: -9999px; vertical-align: bottom; background: url(https://www.sharepeople.co.kr/image/common/arrow_l.png) no-repeat -25px top;'>이전</a>&nbsp;
						 <a id='currentpage' style='text-decoration:none;color:black'>1 </a>
						&nbsp;<a onclick="page++; lastback();" class="last2_btn" style=' display: inline-block; width: 25px; height: 24px; text-indent: -9999px; vertical-align: bottom; background: url(https://www.sharepeople.co.kr/image/common/arrow_r.png) no-repeat left top;'>다음</a><a onclick="page=1000000;lastback();" class="last_btn" style='display: inline-block; width: 24px; height: 24px; text-indent: -9999px; vertical-align: bottom; background: url(https://www.sharepeople.co.kr/image/common/arrow_r.png) no-repeat -26px top;'>맨뒤</a>
					</div>


                  </div>
                  <script>
                  var page =1;
					
					function lastback(){
						console.log(page)
						var currentPage = page;
						var ajax = "ajax";
						
					$.ajax({
						url:"/p/incomeStory",
						type:"post",
						data:{currentPage:currentPage,
							ajax:ajax},
						success:function(data){
							$("#currentpage").text(data[0].currentPage)
							
							var $tbody =$("#tbody");
							
							
							$tbody.html('');
							
							for(key in data){
								
								var $tbody =$("#tbody");
								var $tr = $("<tr>");
								var $noTd =$("<td>");
								var $requestPrice = $("<td>");
								var $requestDate=$("<td>");
								var $requestOk=$("<td>");
								var $requestStatus=$("<td>");
								$noTd.text(Number(key)+Number(1))
								
								
								$requestPrice.text(Number(data[key].requestPrice).toLocaleString('en'));
								
								
								$requestDate.text(data[key].requestDate);
								
								if(data[key].requestOk==null){
									$requestOk.text("출금 검사 중입니다.")
								}else{
								$requestOk.text(data[key].requestOk);
								}
								
								
								if(data[key].requestStatus==1){
									$requestStatus.text("출금대기")
								}else if(data[key].requestStatus==2){
									$requestStatus.text("출금거부")
								}else{
									$requestStatus.text("출금완료")
									
								}
								
								$tr.append($noTd)
								$tr.append($requestPrice)
								$tr.append($requestDate)
								$tr.append($requestOk)
								$tr.append($requestStatus)
								$tbody.append($tr)
								
							}
						
							
							
						},
						error:function(data){}
					})
					}
                  
                  </script>
     
   
   



</div>
</div>

<br><br><br><br>
<%@ include file="../common/footer.jsp" %>
</body>
</html>