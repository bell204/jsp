<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.tc.product.model.vo.Income"%>
    <% Income in= (Income)request.getAttribute("income"); %>
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
    margin-left:50px;   
}
#A_Container   { width:1100px; margin:0 auto; margin-top:50px; margin-bottom:20px; clear:both; overflow: hidden; min-height:500px;}
#A_Container_Wrap  { width:100%; clear:both;  height:100%;}

.sharelist_tab { display:inline-block; width:101%; border: 1px solid #dedede; margin-top:50px; }
.sharelist_tab li { float:left; width:49.8%; background:#efefef; line-height:50px; font-size:16px; font-weight:600; color:#666666; text-align:center;  }
.sharelist_tab li:first-child { border-right: 1px solid #dedede; }
.sharelist_tab li.on, .sharelist_tab li:hover { background:#2d9fee; color:#ffffff; }

.list_page { margin: 30px auto 0; text-align: center; zoom: 1; }
.list_page .first_btn { display: inline-block; width: 25px; height: 24px; text-indent: -9999px; vertical-align: bottom; background: url(https://www.sharepeople.co.kr/image/common/arrow_l.png) no-repeat left top; }
.list_page .first2_btn { display: inline-block; width: 24px; height: 24px; text-indent: -9999px; vertical-align: bottom; background: url(https://www.sharepeople.co.kr/image/common/arrow_l.png) no-repeat -25px top; }
.list_page ul { display: inline-block; overflow: hidden; padding: 0 7px; vertical-align: bottom;}
.list_page li { float: left; margin: 0 5px;}
.list_page li:hover a, .list_page li a.on { color: #fff; background: #0eade7;}
.list_page li a { display: block; width: 24px; height: 24px; font-size: 12px; color: #444; text-align: center; line-height: 25px; }
.list_page .last2_btn { display: inline-block; width: 25px; height: 24px; text-indent: -9999px; vertical-align: bottom; background: url(https://www.sharepeople.co.kr/image/common/arrow_r.png) no-repeat left top; }
.list_page .last_btn { display: inline-block; width: 24px; height: 24px; text-indent: -9999px; vertical-align: bottom; background: url(https://www.sharepeople.co.kr/image/common/arrow_r.png) no-repeat -25px top; }

.adjustform { margin-bottom:5px; float: right; }
.adjustform .input { width:90px; height:28px; border:1px solid #d2d2d2; font-size:14px; font-weight:600; color:#666666; }
.md_search_btn {
		padding: 0px 10px;
		background: #2fa0ee;
		font-size: 14px;
		font-weight: 600;
		color: #ffffff;
		line-height: 28px;
		display: inline-block;
		vertical-align: bottom;
	border:0;
}
.share_calculate { width:100%; border:1px solid #c6c6c6; border-bottom:none; border-right:none; margin-bottom:20px; }
.share_calculate th, .share_calculate td { border-bottom:1px solid #c6c6c6; border-right:1px solid #c6c6c6; font-size:14px; color:#666}
.share_calculate th { background: #f6f6f6; font-weight:600; padding:10px 5px; }
.share_calculate td { background: #ffffff; padding:8px 5px; }
.share_calculate .bold td { font-size:16px; font-weight:600; }
table{border-collapse:collapse;border-spacing:0}


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
            <h1>수익금 정산내역</h1>
            


	<div style='float:right'>

			<b>기간</b>

			<input type="hidden" name="scontent" value="" style="border:0px">
			<input type="date"  id="fromdate" size="16" name='fromDate'> ~
			<input type="date" id="todate" size="10"  name='toDate'>

			&nbsp;<input class="md_search_btn" type="submit" id='searchday' value="검색">&nbsp;
					
		</div>
		<br>	<br>	<br>


<script>
function dateSearch(){
	var fromDate = $("#fromdate").val()
	var toDate = $("#todate").val()
	var num  = 1;
	$.ajax({
		url:"/p/selectIncome",
		type:"post",
		data:{fromDate:fromDate,
			toDate:toDate,
			num:num
			
		},
		success:function(data){
			$("#sumsell").text(Number(data.sumsell).toLocaleString('en'))
			$("#sumincome").text(Number(data.sumincome).toLocaleString('en'))
			$("#outcash").text(Number(data.outcash).toLocaleString('en'))
			$("#mycash").text(Number(data.mycash).toLocaleString('en'))
			$("#outtax").text(Number(data.outtax).toLocaleString('en'))
			$("#sumprice").text(Number(data.sumprice).toLocaleString('en'))
			
		},
		error:function(data){}
		
	})
}





$(function(){
	$("#searchday").click(function(){
		var startDate = $('#fromdate').val();

	    var endDate = $('#todate').val();

	    
	    //-을 구분자로 연,월,일로 잘라내어 배열로 반환

	    var startArray = startDate.split('-');

	    var endArray = endDate.split('-');   

	    //배열에 담겨있는 연,월,일을 사용해서 Date 객체 생성

	    var start_date = new Date(startArray[0], parseInt(startArray[1])-1, startArray[2]);

	    var end_date = new Date(endArray[0],parseInt(endArray[1])-1, endArray[2]);

	   //날짜를 숫자형태의 날짜 정보로 변환하여 비교한다.
	   var now = new Date();
		
	    if(start_date.getTime() > end_date.getTime()) {

	       alert("종료날짜보다 시작날짜가 작아야합니다.");

	}else if(start_date.getTime() > new Date().getTime() || end_date.getTime() > new Date().getTime()){
		  alert("현재날짜 보다 작아야합니다.");
	}else if($('#fromdate').val()=='' || $('#todate').val()==''){
		
		
		
		alert("날짜를 지정해주세요.");
		
	}else{
		dateSearch();
	}
	  
	})
	
	
})
	

</script>
	<table class="share_calculate">
		<colgroup>
				<col width="20%">
				<col width="30%">
				<col width="20%">
				<col width="30%">
		</colgroup>
            <tbody><tr>
              	<th>판매된 공유수</th>
                <td id='sumsell'><%=String.format("%,d", in.getSumsell()) %></td>
                <th>출금 수수료율</th>
                <td>13%</td>
            </tr>
            <tr>
              <th> 총판매액 </th>
                <td id='sumprice'><%=String.format("%,d",in.getSumprice() )%> </td>
                <th>출금 수수료</th>
                <td id='outtax'><%=String.format("%,d",in.getOuttax()) %> </td>
            </tr>
            <tr>
              <th>보유 오동캐쉬</th>
              <td id='mycash'><%=String.format("%,d",in.getMycash()) %> </td>
              <th>출금완료 오동캐쉬</th>
              <td id='outcash'><%=String.format("%,d",in.getOutcash()) %></td>
            </tr>
            <tr>

              <th> 총 수익금 </th>
                <td id='sumincome'><%=String.format("%,d",in.getSumincome()) %> </td>
              <th></th>
              <td></td>
            </tr>
        </tbody></table>
	    <!--  -->
		<br>

                  </div>
     
   
   



</div>
</div>

<br><br><br><br>
<%@ include file="../common/footer.jsp" %>
</body>
</html>