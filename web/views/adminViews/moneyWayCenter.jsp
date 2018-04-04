<%@page import="java.util.Formatter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% long[] suick = (long[])request.getAttribute("suick"); 
long suick1 = suick[0] + suick[1];
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
< <script type="text/javascript" src="http://www.google.com/jsapi"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style>
.table12{
   width:500px;
   align:center;
   border:1px solid black;
}
.table12 td{
   text-align:center;
   border:1px solid black;
   padding:5px;
}
.table13{
   width:500px;
   align:center;
   border:1px solid black;
}
.table13 td{
   text-align:center;
   border:1px solid black;
   padding:5px;
}
#susu{
height:400px;
width:520px;
overflow-y:scroll;
margin-bottom:50px;
border:1px solid black;
}
#gwang{
height:400px;
width:520px;
overflow-y:scroll;
margin-bottom:50px;
border:1px solid black;
}

</style>
<body>
<%@ include file="../common/header.jsp" %>
<% if(loginUser!= null && loginUser.getC_id().equals("admin")){ %>
<h2 align="center">오동 수익금 관리</h2>
<div align="center">
  
<br><br><br>
<table>
	<tr>
		<td>
			<div>
  		 	  <h2 style="color:red">전체수익 : <%= suick1 %></h5>
   		 	  <h3>광고수익 : <%= suick[0] %>원</h3>
   		 	  <h3>수수료수익 : <%= suick[1] %>원</h3>
   		 	  <h3>검색한 전체수익</h3>
   			  <h3 id="jc"></h3>
			</div>
		</td>
		<td>
			<div id="chart_div" align="center"></div>
 			<!-- //<button id="btn" type="button" onclick="drawChart();">reflesh</button> -->
		</td>
	</tr>
</table>
 <script type="text/javascript">
		// Load the Visualization API and the corechart package.
		google.charts.load('current', {'packages':['corechart']});
		
		// Set a callback to run when the Google Visualization API is loaded.
		google.charts.setOnLoadCallback(drawChart);
		
		// Callback that creates and populates a data table,
		// instantiates the pie chart, passes in the data and
		// draws it.
		function drawChart() {
		
			// Create the data table.
			var data = new google.visualization.DataTable();
			data.addColumn('string', 'Topping');
			data.addColumn('number', 'Slices');
			data.addRows([
			  ['수수료수익', <%=suick[0]%>],
			  ['광고수익', <%=suick[1]%>]
			]);
		
			// Set chart options
			var options = {'width':600,
			               'height':300};
		
			// Instantiate and draw our chart, passing in some options.
			var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
			chart.draw(data, options);
			}
		</script>

<br><br>
<table>
   <tr>
       <td>
          검색시작날짜<input type="date" size="25" id="date1">
       </td>
       <td>
         검색 끝 날짜<input type="date" size="25" id="date2">
      </td>
      <td>
         <button class="searchBtn1" onclick="drawChart();">검색하기</button>
      </td>
   </tr>
</table>
<br>
<br>
<table>
   <tr>
      <td>
         <h5>수수료전체수익금</h5>
         <h3 id="sususu"></h3>
         <div id="susu">
            <table class="table12">
               <tr>
                  <h4 align="center">수수료 수익금</h4>
               </tr>
               <tr>
                  <td>회원아이디</td>
                  <td>출금금액</td>
                  <td>수익날짜</td>
                  <td>우리의수익금</td>
               </tr>
            </table>
         </div>
      </td>
      <td>
         <h5>광고전체수익금</h5>
         <h3 id="gwanggg"></h3>
         <div id="gwang">
            <table class="table13">
               <tr>
                  <h4 align="center">광고 수익금</h4>
               </tr>
               <tr>
                  <td>회원아이디</td>
                  <td>출금금액</td>
                  <td>수익날짜</td>
                  <td>우리의수익금</td>
               </tr>
            </table>
         </div>
      </td>
   </tr>
</table>

</div>
 


<script>

   $(".searchBtn1").click(function(){
      var startdate = $("#date1").val();
      var enddate = $("#date2").val();
      console.log(date1);
      console.log(date2);
      $.ajax({
         url:"/p/selectOdongGet.ad",
         type:"post",
         data:{startdate:startdate,enddate:enddate},
         success:function(data){
            var $table = $(".table12");
            for(var key in data){
               var $tr = $("<tr>");
               var $td1 = $("<td>").text(data[key].c_code);
               var $td2 = $("<td>").text(data[key].out_come);
               var $td3 = $("<td>").text(data[key].out_date);
               var $td4 = $("<td>").text(data[key].out_tax);
               
               $tr.append($td1);
               $tr.append($td2);
               $tr.append($td3);
               $tr.append($td4);
               $table.append($tr);
            }
         },
         error:function(data){
            alert(data);
         }
      });      
   });
   $(".searchBtn1").click(function(){
      var startdate = $("#date1").val();
      var enddate = $("#date2").val();
      console.log(date1);
      console.log(date2);
      $.ajax({
         url:"/p/selectOdongGwanggoGet.ad",
         type:"post",
         data:{startdate:startdate,enddate:enddate},
         success:function(data){
            var $table = $(".table13");
            for(var key in data){
               var $tr = $("<tr>");
               var $td1 = $("<td>").text(data[key].c_code);
               var $td2 = $("<td>").text(data[key].pay_price);
               var $td3 = $("<td>").text(data[key].pay_time);
               var $td4 = $("<td>").text(data[key].pay_price);
               
               $tr.append($td1);
               $tr.append($td2);
               $tr.append($td3);
               $tr.append($td4);
               $table.append($tr);
            }
         },
         error:function(data){
            alert(data);
         }
      });      
   });
   $(".searchBtn1").click(function(){
      var startdate = $("#date1").val();
      var enddate = $("#date2").val();
      $.ajax({
         url:"/p/allGwanggoSuick.ad",
         type:"post",
         data:{startdate:startdate,enddate:enddate},
         success:function(data){
            $("#gwanggg").text(data+"원");
            $("#gwanggg").css("color","red");
         },
         error:function(){
            alert("수수료 수익금 조회 실패");
         }
      });
   });
   $(".searchBtn1").click(function(){
      var startdate = $("#date1").val();
      var enddate = $("#date2").val();
      $.ajax({
         url:"/p/allSusuSuick.ad",
         type:"post",
         data:{startdate:startdate,enddate:enddate},
         success:function(data){
            $("#sususu").text(data+"원");
            $("#sususu").css("color","red");
         },
         error:function(){
            alert("광고 수익금 조회 실패");
         }
      });
   });
   $(".searchBtn1").click(function(){
	   var startdate = $("#date1").val();
	      var enddate = $("#date2").val();
      $.ajax({
         url:"/p/allSuickSum.ad",
         type:"post",
         data:{startdate:startdate,enddate:enddate},
         success:function(data){
            $("#jc").text(data+"원");
            $("#jc").css("color","red");
         },
         error:function(){
            alert("광고 수익금 수수료 수익금 합산 조회 실패");
         }
      });
   });
</script>

<%}else{ 
   request.setAttribute("msg", "잘못된 경로로 접근하셨습니다.");
   request.getRequestDispatcher("../common/errorPage.jsp").forward(request, response);
}%>
</body>
</html>