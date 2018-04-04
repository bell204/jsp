<%@page import="java.util.ArrayList"%>
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
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<meta charset="UTF-8">
<title>건의사항</title>
<style>
#A_Container_L {
	float: left;
	width: 200px;
}

#A_Container_C {
	width: 770px;
	float: left;
	overflow: hidden;
	margin-left: 40px;
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

li {
	display: list-item;
	text-align: -webkit-match-parent;
}
</style>
</head>
<body>
	<%@ include file="../common/header.jsp"%>

	<div id='A_Container_Wrap'>
		<div id='A_Container'>
			<%@ include file="communityleft.jsp"%>

			<!-- Container 시작 -->
			<div id="A_Container_C">

				<h1>건의사항</h1>

				<table width="100%" border="0" class="search">
					<tr>
						<td align="right"><form action="#" method="post"
								name="board_search" id="board_search">
								<a href="#"> </a> <select name="keyword_option"
									id="keyword_option" class="btn btn-default">
									<option value="b_title">제목</option>
									<option value="b_text">내용</option>
									<option value="b_name">글쓴이</option>
								</select> <input name="keyword" type="text" id="keyword" size="20"
									class="btn btn-default" />
								<button type="button" class="btn btn-info"
									onclick="search_check();" />
								검색
								</button>


							</form></td>
					</tr>
					<tr>
						<td height="5px"></td>
					</tr>
				</table>
				<table class="table">
					<colgroup>
						<col style="width: 10%">
						<col style="width: 30%">
						<col style="width: 10%">
						<col style="width: 15%">
						<col style="width: 20%">
						<col style="width: 15%">
					</colgroup>
					<thead>
						<tr>
							<th>No</th>
							<th>제 목</th>
							<th>카테고리</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>조회수</th>
						</tr>
					</thead>

					<%for (notice n : list) {%>
					<tr class="tr_com">
						<td class="com_num"><%=n.getCom_num()%></td>
						<td><%=n.getCom_name()%></td>
						<td><%=n.getCate_name()%></td>
						<td><%=n.getC_id()%></td>
						<td><%=n.getCom_date()%></td>
						<td><%=n.getCom_count()%></td>
					</tr>
					<%
						}
					%>

				</table>

				<ul class="pager">
					<li><a href="<%=request.getContextPath()%>/selectList.ur?currentPage=1">First</a></li>
					<%if (currentPage <= 1) {%>
					<li><a href="#">Previous</a></li>
					<%} else {%>
					<li><a href="<%=request.getContextPath()%>/selectList.ur?currentPage=<%=currentPage - 1%>">Previous</a></li>
					<%}%>
					<%for (int p = startPage; p <= endPage; p++) {
							if (p == currentPage) {%>
					<li><a href="#" class="active"><%=p%></a></li>
					<%} else {%>
					<li><a href="<%=request.getContextPath()%>/selectList.ur?currentPage=<%=p%>" class="active"><%=p%></a></li>
					<%}%>
					<%}%>
					<%if (currentPage >= maxPage) {%>
					<li><a href="#">Next</a></li>
					<%} else {%>
					<li><a href="<%=request.getContextPath()%>/selectList.ur?currentPage=<%=currentPage + 1%>">Next</a></li>
					<%}%>
					<li><a href="<%=request.getContextPath()%>/selectList.ur?currentPage=<%=maxPage%>">Last</a></li>

					<%
						if (loginUser != null) {
					%>
					<li style="float: right;"><button
							onclick="location.href='/p/views/community/userRequestInsert.jsp'"
							style="background: skyblue; border-radius: 5px; color: white; border: none; width: 100px; height: 30px;">작성하기</button></li>
					<%
						}
					%>
				</ul>


			</div>

		</div>

		<hr>
		<%@ include file="../common/footer.jsp"%>

	</div>
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
		 location.href="<%=request.getContextPath()%>/selectOne.ur?num="+ num;
	});
	</script>
	<br>
	<br>
	<%@ include file="../common/footer.jsp"%>
</body>
</html>