<%@page import="java.util.ArrayList"%>
<%@page import="oracle.net.aso.n"%>
<%@page import="com.kh.tc.notice.model.vo.PageInfo"%>
<%@page import="com.kh.tc.notice.model.vo.notice"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ArrayList<notice> list = (ArrayList<notice>) request.getAttribute("list");
	PageInfo pi = (PageInfo) session.getAttribute("pi");
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
%>    
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<meta charset="UTF-8">
<title>My Page</title>
<style>
/*freeBoard 스타일*/
body{
float:"center";

}

.pagination {
	
    display: inline-block;
}

.pager a {
    color: black;
    float: center;
    padding: 8px 16px;
    text-decoration: none;
}

.pager a.active {
    background-color:white;
    color:darkblue;
}

.pager a:hover:not(.active) {background-color: #ddd;}

#A_Container_L {
	float: left;
	width: 200px;
}

#A_Container_C {
	width: 770px;
	float: left;
	overflow: hidden;
	margin-left:20px;
}

#A_Container {
	width: 1100px;
	margin: 0 auto;
	margin-top: 30px;
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
/**/

</style>
</head>
<body>
	<%@ include file="../common/header.jsp"%>

	<div id='A_Container_Wrap'>
		<div id='A_Container'>
			<%@ include file="communityleft.jsp"%>
 
   
   <div id="A_Container_C">
 <div id="A_Wrap">

<!-- Container 시작 -->
    <div id="A_Container_Wrap">
<div id = "A_Container">


<!-- Container 시작 -->

        <div id="A_Container_C">
            <h1>Q&A</h1>
					<div class="table_box">
					<table class="table" summary="Q&amp;A">
 
						<colgroup>
									<col style="width:2%">
									<col style="width:20%">
									<col style="width:3%">
									<col style="width:10%">
									<col style="width:7%">
									<col style="width:2%">
						</colgroup>
						<thead>
							<tr>
								<th>NO</th>
								<th>제목</th>
								<th>등록자</th>
								<th>등록일</th>
								<th>조회수</th>
								<th></th>
							</tr>
						</thead>
					
				<tbody>
					
					<%
						for (notice n : list) {
					%>
					<tr class="tr_com">
						<td class="com_num"><%=n.getCom_num()%></td>
						<td id="com_name"><%=n.getCom_name()%></td>
						<td id="c_id"><%=n.getC_id() %></td>
						<td><%=n.getCom_date()%></td>
						<td><%=n.getCom_count()%></td>
						<td id="wow"><input type="hidden" id="oh" value="<%= n.getCom_code()%>"></td>
					</tr>
					<%
						}
					%>
				</tbody>
				  
        </table>
        <ul class="pager">
               <li><a class="active"
                  href="<%=request.getContextPath()%>/selectQnAList?currentPage=1">First</a></li>
               <%if (currentPage <= 1) {%>
               <li><a href="#" class="active">Previous</a></li>
               <%} else {%>
               <li><a class="active"
                  href="<%=request.getContextPath()%>/selectQnAList?currentPage=<%=currentPage - 1%>">Previous</a></li>
               <%
                  }
               %>
               <%
                  for (int p = startPage; p <= endPage; p++) {
                     if (p == currentPage) {
               %>
               <li><a href="#" class="active"><%=p%></a></li>
               <%
                  } else {
               %>
               <li><a href="<%=request.getContextPath()%>/selectQnAList?currentPage=<%=p%>" class="active"><%=p%></a></li>
               <% }%>
               <%}%>
               <% if (currentPage >= maxPage) {%>
               <li><a href="#" class="active">Next</a></li>
               <%} else {%>
               <li><a href="<%=request.getContextPath()%>/selectQnAList?currentPage=<%=currentPage + 1%>" class="active">Next</a></li>
               <%}%>
               <li><a href="<%=request.getContextPath()%>/selectQnAList?currentPage=<%=maxPage%>" class="active">Last</a></li>
               
               <!-- 작성 버튼 -->
               <%if (loginUser != null ) {%>
               <li style="float: right;">
               <button style="background:#a5aac7; border-radius: 5px; color: white; border: none; width: 100px; height: 30px; float:right; margin-right:50px;"
                 	onclick="location.href='/p/views/community/qnaInsert.jsp'" >입력하기</button>
               </li>
               <%
                  }
               %>
            </ul>
			</div>

        </div>
 			<!-- #A_Container END -->

      </div><!-- #A_Container_Wrap END -->
	<!-- Container 끝 -->    





</div>
</div>
<hr>

</div>
</div>
<div float="left">
<%@ include file="../common/footer.jsp" %>
<script>
	 $(function(){
		$(".table td").mouseenter(function(){
			$(this).parent().css({"background":"#b3d1ff","cursor":"pointer"});
		}).mouseout(function(){
			$(this).parent().css("background","white");
		});
	}); 
	$(document).on('click','.tr_com',function(){
		var num=$(this).children(".com_num").text();
		var com_code=$(this).children("#wow").children("#oh").val();
		var com_name=$(this).children("#com_name").text();
		location.href="/p/getIn?com_name="+com_name+"&com_code="+com_code; 
		/* location.href="/p/views/community/QnAPassword.jsp"; */
	});
	</script>
</div>
</body>
</html>