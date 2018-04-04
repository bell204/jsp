<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<style>
body {
    font-family: "Lato", sans-serif;
}

.sidenav {
    height: 100%;
    width: 0;
    position: fixed;
    z-index: 1;
    top: 0;
    left: 0;
    background-color: #111;
    overflow-x: hidden;
    transition: 0.5s;
    padding-top: 60px;
}

.sidenav a {
    padding: 8px 8px 8px 32px;
    text-decoration: none;
    font-size: 25px;
    color: #818181;
    display: block;
    transition: 0.3s;
}

.sidenav a:hover {
    color: #f1f1f1;
}

.sidenav .closebtn {
    position: absolute;
    top: 0;
    right: 25px;
    font-size: 36px;
    margin-left: 50px;
}

@media screen and (max-height: 450px) {
  .sidenav {padding-top: 15px;}
  .sidenav a {font-size: 18px;}
}
#mySidenav{
   width:180px;
}

* {box-sizing: border-box}

/* Set height of body and the document to 100% */
body, html {
    height: 100%;
    margin: 0;
    font-family: Arial;
}

/* Style tab links */
.tablink {
    background-color: #555;
    color: white;
    float: left;
    border: none;
    outline: none;
    cursor: pointer;
    padding: 14px 16px;
    font-size: 17px;
    width: 25%;
}

.tablink:hover {
    background-color: #777;
}

/* Style the tab content (and add height:100% for full page content) */
.tabcontent {
    color: white;
    display: none;
    padding: 100px 20px;
    height: 693px;
}

#Home {background-color: white;}
#News {background-color: white;}
#Contact {background-color: white;}
#About {background-color: white;}

.outer2{
   float:left;
   width:1100px;
   margin-left:180px;
}


#A_Container_C {


	width: 770px;
	float: left;
	overflow: hidden;
	margin:40px;
}
th{
	background-color:#dddddd;
}
</style>
<body>
</head>
<body>
<div class="outer">
<div id="mySidenav" class="sidenav outer1" >
  <a href="aMemberList.jsp" style="color:white">회원</a>
  <a href="productRequestList.jsp">상품</a>
  <a href="totalIncome.jsp">매출</a>
  <a href="qnaList.jsp">QnA</a>
</div>
<div class="outer2">
<button class="tablink" onclick="openPage('Home', this, 'red')">매출</button>
<div id="Home" class="tabcontent">
  <h3>Home</h3>

	<div id="A_Container_C">

	<colgroup>
		<col style="width:100%;">
 	</colgroup>

<table style="width:100%;" class="table table-bordered">
<tr>
 <th class="firstBar">
			 <h1> 전체 매출</h1>
		 </th>

</tr>
</table>

<button class="btn btn-basic">기간별</button>
<button type="button" class="btn btn-basic">상품별</button>
<button type="button" class="btn btn-basic">회원별</button>


<table width="100%" border="0" class="search">
  <tr>
    <td align="left">
      <form action="#" method="post" name="board_search" id="board_search">


      기간검색    <input name="keyword" type="text" id="keyword" size="10" class="btn btn-default" />
      ~
      <input name="keyword" type="text" id="keyword" size="10" class="btn btn-default" />
      <button type="button" class="btn btn-info" onclick="search_check();" />검색</button>

      <button type="button" class="btn btn-basic"   />전체</button>
      <button type="button" class="btn btn-basic"  />오늘</button>
      <button type="button" class="btn btn-basic" />어제</button>
      <button type="button" class="btn btn-basic"   />1개월</button>
    </form>
  </td>
  </tr>

    <tr>
    <td height="5px"></td>
  </tr>
</table>


<table width="100%" border="0" class="search">
<tr>
<td align="right"><form action="#" method="post" name="board_search" id="board_search">
 <a href="#"> </a>
 <select name="keyword_option" id="keyword_option" class="btn btn-default">
   <option value="b_title">정렬기준</option>
   <option value="b_text">오름차순</option>
   <option value="b_name">내림차순</option>
 </select>


</form></td>
</tr>
<tr>
<td height="5px"></td>
</tr>
</table>

  <table>

    <tr><td><p align="left">총 2건</p></td></tr>
<table style="width:100%;" class="table table-bordered" >
 <colgroup>
		 <col style="width:8%;">
		 <col style="width:8%;">
     <col style="width:8%;">
     <col style="width:8%;">
     <col style="width:8%;">
     <col style="width:8%;">
     <col style="width:8%;">
      <col style="width:8%;">
     <col style="width:8%;">
     <col style="width:8%;">
	<col style="width:8%;">
		 </colgroup>

	 </colgroup>

	 <tbody><tr>
		 <th><p align="center">NO.</p></th>
	 <th>거래일자</th>
	 <th>판매자</th>
	 <th>판매상품</th>
	 <th>판매금액</th>
     <th>환불금액</th>
     <th>광고금액</th>
     <th>광고수량</th>
     <th>수수료합계</th>
 	 <th>매출합계(광고+수수료)</th>
	 </tr>
	 <tr align="center">
		 <td>2</td>
		 <td>2018-02-27</td>
     <td>홍길동</td>
     <td>알고리즘</td>
     <td>40,000</td>
  	 <td>20,000</td>
     <td>30,000</td>
     <td>1</td>
     <td>2,000</td>
 	 <td>32,000</td>
     
	 </tr>
	 <tr align="center">
		 <td>1</td>
     <td>2018-02-27</td>
     <td>홍길동</td>
     <td>알고리즘</td>
     <td>40,000</td>
  	 <td>20,000</td>
     <td>30,000</td>
     <td>1</td>
     <td>2,000</td>
 	 <td>32,000</td>
 
	 </tr>
   <tr align="center">
    <td colspan="6">총합계</td>
      <td>60,000</td>
      <td></td>
     <td>4,000</td>
     <td>64,000</td>
  </tr>
 </tbody></table>

		 <div class="order_button">
					 <button><a href="#" class="btn btn-info">확인</a></button>
				 </div>
				 </div>
				 </div>
				 </div>
   
       </div>
</div>
 
<div id="About" class="tabcontent">
  <h3>About</h3>

</div>

       
  <script>
         function openPage(pageName,elmnt,color) {
             var i, tabcontent, tablinks;
             tabcontent = document.getElementsByClassName("tabcontent");
             for (i = 0; i < tabcontent.length; i++) {
                 tabcontent[i].style.display = "none";
             }
             tablinks = document.getElementsByClassName("tablink");
             for (i = 0; i < tablinks.length; i++) {
                 tablinks[i].style.backgroundColor = "";
             }
             document.getElementById(pageName).style.display = "block";
             elmnt.style.backgroundColor = color;
         }
         /* // Get the element with id="defaultOpen" and click on it
         document.getElementById("defaultOpen").click(); */
         </script> 
</body>
</html>
