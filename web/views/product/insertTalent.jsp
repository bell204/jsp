<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.kh.tc.product.model.vo.ProductDetail"%>
	<%ProductDetail detail = (ProductDetail)request.getAttribute("detail"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>재능등록</title>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
@import url(//fonts.googleapis.com/earlyaccess/nanummyeongjo.css);

* {
	margin: 0;
	padding: 0;
	list-style: none;
	text-decoration: none;
	font-family: 'Nanum Gothic', sans-serif;
}

h1, p, h2, h3 {
	font-family: 'Nanum Pen Script', cursive;
}

table, textarea {
	width: 100%;
}

ol {
	background-color: #dddddd;
	margin: 0;
	padding: 20px;
	list-style-type: none;
}

li {
	margin: 10px;
}

#h1 {
	color: #444;
	font-size: 26px;
	font-weight: 600;
	padding-bottom: 20px;
}

#h2 {
	color: #444;
	font-size: 18px;
	font-weight: 600;
	margin-top: 60px;
	border-bottom: 2px solid #666;
	line-height: 40px;
}

#h3 {
	color: #666;
	font-size: 16px;
	font-weight: 600;
}

#h4 {
	color: #666;
	font-size: 14px;
	font-weight: 600;
}

#option3 {
	display: inline;
	width: 20%;
	flow: left;
}

#category {
	margin: 10px;
	display: inline;
}

ul {
	margin: 0;
	padding: 0;
	list-style-type: none;
}

h1, h2, h3 {
	margin-top: 60px;
}

#option1, #option2 {
	padding: 10px;
	background-color: #dddddd;
	border: 1px solid gray;
}

th {
	text-align: left;
	background: #efefef;
	color: #666;
	font-weight: normal;
	padding-left: 25px;
	border-bottom: 1px solid #e6e6e6;
	height: 40px;
}

#Container1 {
	width: 1100px;
	margin: 0 auto;
	margin-top: 50px;
	margin-bottom: 20px;
	clear: both;
	overflow: hidden;
	min-height: 500px;
}

.bor_none {
	border: none !important;
}

.bor_top4ff {
	border-top: 4px solid #ffffff;
}

.bor_btm266 {
	border-bottom: 2px solid #666666;
}

.bor_r {
	border-right: 1px solid #dbdbdb !important;
}

.cursor {
	cursor: pointer;
}

.m_0auto {
	margin: 0 auto;
}

.m_top0 {
	margin-top: 0px !important;
}

.m_top4 {
	margin-top: 4px !important;
}

.m_top13 {
	margin-top: 13px !important;
}

.m_top15 {
	margin-top: 15px !important;
}

.m_top20 {
	margin-top: 20px !important;
}

.m_top30 {
	margin-top: 30px !important;
}

.m_top50 {
	margin-top: 50px !important;
}

.m_top80 {
	margin-top: 80px !important;
}

.m_left0 {
	padding-left: 0px !important;
}

.m_right0 {
	padding-right: 0px !important;
}

.m_right4 {
	padding-right: 4px !important;
}

.m_bottom4 {
	margin-bottom: 4px !important;
}

.m_bottom20 {
	margin-bottom: 20px !important;
}

.m_bottom40 {
	margin-bottom: 40px !important;
}

.m_bottom80 {
	margin-bottom: 80px !important;
}

.mlb20 {
	margin-left: 20px !important;
	margin-bottom: 10px !important;
}

.ml10 {
	margin-left: 10px !important;
}

.ml20 {
	margin-left: 20px !important;
}

.mb10 {
	margin-bottom: 10px !important;
}

.mb20 {
	margin-bottom: 20px !important;
}

.ml40 {
	margin-left: 40px !important;
}

.mlb40 {
	margin-left: 40px !important;
	margin-bottom: 10px
}

.mtb3 {
	margin-top: 3px !important;
	margin-bottom: 3px !important;
}

.mt20mb5 {
	margin-top: 20px !important;
	margin-bottom: 20p5x !important;
}

.p_left6 {
	padding-left: 6px !important;
}

.p_left20 {
	padding-left: 20px !important;
}

.p_bottom10 {
	padding-bottom: 10px !important;
}

.p_bottom65 {
	padding-bottom: 65px !important;
}

.bgnone {
	background: none !important;
}

.bg444444 {
	background: #444444 !important;
} /*?????*/
.bg979797 {
	background: #979797 !important;
}

.bgff4b5c {
	background: #ff4b5c !important;
}

.bg6393b4 {
	background: #6393b4 !important;
} /*????*/
.bg2fa0ee {
	background: #2fa0ee !important;
} /*???*/
.bge14948 {
	background: #e14948 !important;
} /*????*/
.bgff4b5c {
	background: #ff4b5c !important;
} /*???*/
.bg4b4b4c {
	background: #4b4b4c !important;
}

.bgff8400 {
	background: #ff8400 !important;
} /*??????*/
.bg41aaf2 {
	background: #41aaf2 !important;
}

.bg888888 {
	background: #888 !important;
}

.bga7a7a7 {
	background: #a7a7a7 !important;
}

.register_option {
	display: table;
	margin: 0 auto;
	clear: both;
	margin-bottom: 40px;
}

.register_option ul {
	width: 280px;
	border: 1px solid #c6c6c6;
	margin: 0 auto;
	background: #efefef;
	padding: 5px 20px;
	font-size: 13px;
	color: #666666;
	float: left;
	margin-right: 10px;
}

.register_option ul:last-child {
	margin-right: 0;
}

.register_option ul li {
	position: relative;
	line-height: 40px;
	margin: auto;
}

.register_option ul li:nth-last-child(2) {
	padding-bottom: 20px;
}

.register_option ul li:last-child {
	text-align: center;
	line-height: 60px;
	border-top: 1px solid #c6c6c6;
}

.register_option select {
	border: 1px solid #c6c6c6;
	outline: none;
	width: 100%;
	height: 28px;
	padding-left: 5px;
	font-size: 12px;
	color: #666666;
}

.register_option input {
	border: 1px solid #c6c6c6;
	outline: none;
	width: 175px;
	height: 26px;
	padding-left: 5px;
}

.register_option div input {
	position: absolute;
	left: 60px;
	top: 6px;
}

.register_option a {
	display: inline-block;
	padding: 0 10px;
	border-radius: 2px;
	color: #fff;
	font-size: 12px;
	line-height: 28px;
	background: #2fa0ee;
	background: #979797;
}

.bor_none .share_star {
	color: #666;
	float: right;
	font-weight: 100;
	font-size: 12px;
}

#max {
	width: 100%;
}

#max2 {
	width: 100%;
	height: 180px;
	border: 1px solid #c6c6c6;
}

.register_option {
	display: none;
}
</style>
<script type='text/javascript' src="/p/ckeditor/ckeditor.js"></script>
<script>
	$(function() {
		$("#category1").change(function() {
			var cate1 = $("#category1 option:selected").val();
			var $select = $("#category2");
			$select.find("option").remove();
			$select.append("<option>2차 카테고리 선택</option>");
			var $select = $("#category3");
			$select.find("option").remove();
			$select.append("<option>3차 카테고리 선택</option>");
			var $select = $("#category4");
			$select.find("option").remove();
			$select.append("<option>4차 카테고리 선택</option>");

			$.ajax({
				url : "/p/cate1",
				data : {
					cate1 : cate1,
					msg : "2차"
				},
				type : "get",
				success : function(data) {
					if (data != null) {
						var $select = $("#category2");
						$select.find("option").remove();

						for (var i = 0; i < data.length; i++) {
							var $option = $("<option>");
							if (i == 0) {
								$select.append("<option>2차 카테고리 선택</option>");
							}

							$option.text(data[i]);

							$select.append($option);
						}
					} else {
						var $select = $("#category2");
						$select.find("option").remove();
						$select.append("<option>2차 카테고리 선택</option>");
						var $select = $("#category3");
						$select.find("option").remove();
						$select.append("<option>3차 카테고리 선택</option>");
						var $select = $("#category4");
						$select.find("option").remove();
						$select.append("<option>4차 카테고리 선택</option>");

					}
				},
				error : function(data) {
					console.log("실패")
				}
			})

		})

		$("#category2").change(function() {
			var cate1 = $("#category2 option:selected").val();
			
			var $select = $("#category3");
			$select.find("option").remove();
			$select.append("<option>3차 카테고리 선택</option>");
			var $select = $("#category4");
			$select.find("option").remove();
			$select.append("<option>4차 카테고리 선택</option>");

			$.ajax({
				url : "/p/cate1",
				data : {
					cate1 : cate1,
					msg : "3차"
				},
				type : "get",
				success : function(data) {
					if (data != null) {
						var $select = $("#category3");
						$select.find("option").remove();

						for (var i = 0; i < data.length; i++) {
							var $option = $("<option>");
							if (i == 0) {
								$select.append("<option>3차 카테고리 선택</option>");
							}

							$option.text(data[i]);

							$select.append($option);
						}
					} else {
						var $select = $("#category3");
						$select.find("option").remove();
						$select.append("<option>3차 카테고리 선택</option>");
						
						var $select = $("#category4");
						$select.find("option").remove();
						$select.append("<option>4차 카테고리 선택</option>");

					}
				},
				error : function(data) {
					console.log("실패")
				}
			})

		})
		$("#category3").change(function() {
			var cate1 = $("#category3 option:selected").val();
			
			var $select = $("#category4");
			$select.find("option").remove();
			$select.append("<option>4차 카테고리 선택</option>");

			$.ajax({
				url : "/p/cate1",
				data : {
					cate1 : cate1,
					msg : "4차"
				},
				type : "get",
				success : function(data) {
					if (data != null) {
						var $select = $("#category4");
						$select.find("option").remove();

						for (var i = 0; i < data.length; i++) {
							var $option = $("<option>");
							if (i == 0) {
								$select.append("<option>4차 카테고리 선택</option>");
							}

							$option.text(data[i]);

							$select.append($option);
						}
					} else {
						var $select = $("#category4");
						$select.find("option").remove();
						$select.append("<option>4차 카테고리 선택</option>");

					}
				},
				error : function(data) {
					console.log("실패")
				}
			})

		})
	})

</script>


</head>


<body id='body'>
	<%@ include file="../common/header.jsp"%>

	<hr>
	<!-- header 부분 -->

	<div id="Container1">
		<h1 id='h1'>재능등록</h1>
		<ol>
			<li>1. 공유 판매가 아닌 홍보성 글이나 무성의한 글은 승인이 거절됩니다.</li>
			<li>2. 직거래를 유도하는 공유 상품은 사전 경고없이 삭제 처리되며, 서비스 이용에 제한이 있을 수 있습니다.</li>
			<li>3. 연락처, 이메일 등 개인정보가 포함된 글은 관리자에 의해 임의로 삭제될 수 있습니다.</li>
		</ol>
		<%if(detail==null) {%>
	<form action="<%=request.getContextPath()%>/insertProduct" method='post' encType='multipart/form-data' onsubmit="return formcheck()" >
			<h2 class="bor_none m_top20" id='h2'>공유 카테고리 선택 *</h2>

			<input type='hidden' value='<%=loginUser.getC_code()%>' name='c_code'>
			<ul>
				<li id="category" class='cate1'><select id='category1'
					class="btn btn-default" name='category'>
						<option>1차 카테고리 선택</option>
						<option>시간</option>
						<option>재능</option>
						<option>물건</option>
						<option>공간</option>
						<option>차량</option>
				</select></li>

				<li id="category" class='cate2'><select id='category2'
					class="btn btn-default" name='category'>
						<option>2차 카테고리 선택</option>
				</select></li>

				<li id="category" class='cate3'><select id='category3'
					class="btn btn-default" name='category'>
						<option>3차 카테고리 선택</option>
				</select></li>

				<li id="category" class='cate4'><select id='category4'
					class="btn btn-default" name='category'>
						<option>4차 카테고리 선택</option>
				</select></li>

			</ul>


			<h2 class="bor_none m_top20" id='h2'>
				공유 기본정보 입력 <span class="share_star">*별표(*)는 필수 입력사항입니다.</span>
			</h2>
			<table class="table table-bordered">

				<tr>
					<th class="active">재능판매형식</th>
					<td><input type="radio" value="일반형" name="delivery">일반형(비배송형)
						<input type="radio" value="배송형" name="delivery"> 배송형
				</tr>
				<tr>
					<th class="active">재능명*</th>
					<td><input type="text" class="btn btn-default" id='max'
						maxlength='55' placeholder="공유명 단어들이 검색시 반영됩니다(55자 이내)"
						name='title'></td>
				</tr>
				<tr>
					<th class="active">재능간단설명</th>
					<td><textarea placeholder=" 재능 설명 (80자 이내)" cols="100"
							rows="2" id='max2' name='simplecontent'></textarea></td>

				</tr>
				<tr>
					<th class="active">동시공유 가능수*</th>
					<td><input class="btn btn-default" type="number" id='sharecount' name="sharecount"></td>
				</tr>
				<tr>
					<th class="active">주문상황 알림연락처</th>
					<td><select class="btn btn-default" name='tell'>
							<option>010</option>
							<option>011</option>
							<option>018</option>
							<option>016</option>
							<option>019</option>
							<option>02</option>
					</select> <input type="number" class="btn btn-default" maxlength="4" size="4"
						value="" name='tell'> <input type="number"
						class="btn btn-default" maxlength="4" size="4" value=""
						name='tell'></td>
				</tr>
				<tr>
					<th class="active">재능마감일 *</th>
					<td><input class="btn btn-default" type="date" name="g_date"
						id="dp1520352382982">&nbsp; <input class="btn btn-default"
						type="time" name="g_time" id="tp1520352382989"> * 공유종료일이
						지나면 상품이 사이트에 노출되지 않습니다.</td>
				</tr>


				<tr>
					<th class="active">판매상태 *</th>
					<td><input type="radio" value="1" name="sellstate">판매중
						<input type="radio" value="0" name="sellstate">판매대기</td>
				</tr>
			</table>

			<h2 class="bor_none m_top20" id='h2'>공유 가격정보</h2>
			<table class="table table-bordered">
				<tr>
					<th class="active">기본가격*</th>
					<td><input type="number" class="btn btn-default"
						placeholder="내용을입력해주세요" name='price' id='price'> 원</td>
				</tr>
				<tr>
					<th class="active">주문옵션</th>
					<td><input type="radio" value="0" onClick="Toggle('1');"
						checked name='option'> 옵션 없음 <input type="radio" value="1"
						onClick="Toggle('2');" name='option'>옵션 있음
						<button class="btn btn-default">
							<a href="#">옵션등록가이드</a>
						</button></td>
				</tr>

			</table>
			<input type="hidden" name="g_sel" id="g_sel"> <input
				type="hidden" name="g_sel2" id="g_sel2">
			<div class="register_option 2" style="margin: auto">
				<ul>
					<li>주문 옵션 구분1</li>
					<li><select class="select" id="j_sel"
						onchange="getSelectValue();">
							<option value="선택">선택</option>
					</select></li>
					<li>옵션명 :
						<div style='background: red;'>
							<input type="text" name="g_op" id="j_op">
						</div>
					</li>
					<li><a onclick="optionadd();">등록</a> <a
						onclick="optionedit();">수정</a> <a onclick="optiondel();">삭제</a></li>
				</ul>
				<ul>
					<li>주문 옵션 구분2</li>
					<li><select name="j_sel2" class="select" id="j_sel2"
						onchange="getSelectValue2();"  >
							<option value="선택">선택</option>
					</select></li>
					<li>옵션명 :
						<div>
							<input type="text" id="j_op2" placeholder=", / 는 사용하실수 없습니다">
						</div>
					</li>
					<li>추가가격 :
						<div>
							<input type="text" id="j_op3" value="0">
						</div>
					</li>
					<li>추가일 :
						<div>
							<input type="text" id="j_op4" value="0">
						</div>
					</li>
					<li><a onclick="optionadd2();">등록</a> <a
						onclick="optionedit2();">수정</a> <a onclick="optiondel2();">삭제</a></li>
				</ul>
			</div>
			<br>

			<h2 class="bor_none m_top20" id='h2'>공유 이미지등록 *</h2>
			<table class="table table-bordered">

				
					<tr>
						<th class="active">리스트 이미지</th>

						<td>
							<div id='titleImgArea'>
								<img id='titleImg' width="350" height="200">
							</div> <input type='file' id='thumbnail1' name='thumbnailImg1'
							onchange="LoadImg1(this)">
						</td>
					</tr>
		
			</table>

			<h2 class="bor_none" id='h2'>공유 상세설명</h2>

			<textarea cols="150" rows="10" name='content' class='ckeditor'
				id='editor'></textarea>
			
	<input type='hidden' name='option1' id='option1' value=''>




			<div align='center'>
				<button class="btn btn-default" type='submit'>
					재능등록
				</button>
			</div>
			<hr>
			</form>
			<%}else{ %>
			<form action="<%=request.getContextPath()%>/updateProduct?p_code=<%=detail.getP_code() %>" method='post' encType='multipart/form-data' onsubmit="return formcheck()" >
			<h2 class="bor_none m_top20" id='h2'>공유 카테고리 선택 *</h2>

			<input type='hidden' value='<%=loginUser.getC_code()%>' name='c_code'>
			<ul>
				<li id="category" class='cate1'><select id='category1'
					class="btn btn-default" name='category'>
						<option><%=detail.getCate1() %></option>
						<option value='시간'>시간</option>
						<option value='재능'>재능</option>
						<option value='물건'>물건</option>
						<option value='공간'>공간</option>
						<option value='차량'>차량</option>
				</select></li>

				<li id="category" class='cate2'><select id='category2'
					class="btn btn-default" name='category'>
						<option><%=detail.getCate2() %></option>
				</select></li>

				<li id="category" class='cate3'><select id='category3'
					class="btn btn-default" name='category'>
						<option><%=detail.getCate3() %></option>
				</select></li>

				<li id="category" class='cate4'><select id='category4'
					class="btn btn-default" name='category'>
						<option><%=detail.getCate4() %></option>
				</select></li>

			</ul>


			<h2 class="bor_none m_top20" id='h2'>
				공유 기본정보 입력 <span class="share_star">*별표(*)는 필수 입력사항입니다.</span>
			</h2>
			<table class="table table-bordered">

				<tr>
					<th class="active">재능판매형식</th>
					<td><input type="radio" value="일반형" name="delivery">일반형(비배송형)
						<input type="radio" value="배송형" name="delivery"> 배송형
				</tr>
				<tr>
					<th class="active">재능명*</th>
					<td><input type="text" class="btn btn-default" id='max'
						maxlength='55' placeholder="공유명 단어들이 검색시 반영됩니다(55자 이내)"
						name='title' value='<%=detail.getP_name()%>'></td>
				</tr>
				<tr>
					<th class="active">재능간단설명</th>
					<td><textarea placeholder=" 재능 설명 (80자 이내)" cols="100"
							rows="2" id='max2' name='simplecontent'><%=detail.getP_simplecontent() %></textarea></td>

				</tr>
				<tr>
					<th class="active">동시공유 가능수*</th>
					<td><input class="btn btn-default" type="number" id='sharecount' name="sharecount" value='<%=detail.getP_share_count() %>'></td>
				</tr>
				<tr>
					<th class="active">주문상황 알림연락처</th>
					<td><select class="btn btn-default" name='tell'>
							<option>010</option>
							<option>011</option>
							<option>018</option>
							<option>016</option>
							<option>019</option>
							<option>02</option>
					</select> <input type="number" class="btn btn-default" maxlength="4" size="4"
						value="" name='tell'> <input type="number"
						class="btn btn-default" maxlength="4" size="4" value=""
						name='tell'></td>
				</tr>
				<tr>
					<th class="active">재능마감일 *</th>
					<td><input class="btn btn-default" type="date" name="g_date"
						id="dp1520352382982">&nbsp; <input class="btn btn-default"
						type="time" name="g_time" id="tp1520352382989"> * 공유종료일이
						지나면 상품이 사이트에 노출되지 않습니다.</td>
				</tr>


				<tr>
					<th class="active">판매상태 *</th>
					<td><input type="radio" value="1" name="sellstate">판매중
						<input type="radio" value="0" name="sellstate">판매대기</td>
				</tr>
			</table>

			<h2 class="bor_none m_top20" id='h2'>공유 가격정보</h2>
			<table class="table table-bordered">
				<tr>
					<th class="active">기본가격*</th>
					<td><input type="number" class="btn btn-default"
						placeholder="내용을입력해주세요" name='price' id='price' value='<%=detail.getP_price() %>'> 원</td>
				</tr>
				<tr>
					<th class="active">주문옵션</th>
					<td><input type="radio" value="0" onClick="Toggle('1');"
						checked name='option'> 옵션 없음 <input type="radio" value="1"
						onClick="Toggle('2');" name='option'>옵션 있음
						<button class="btn btn-default">
							<a href="#">옵션등록가이드</a>
						</button></td>
				</tr>

			</table>
			<input type="hidden" name="g_sel" id="g_sel"> <input
				type="hidden" name="g_sel2" id="g_sel2">
			<div class="register_option 2" style="margin: auto">
				<ul>
					<li>주문 옵션 구분1</li>
					<li><select class="select" id="j_sel"
						onchange="getSelectValue();">
							<option value="선택">선택</option>
					</select></li>
					<li>옵션명 :
						<div style='background: red;'>
							<input type="text" name="g_op" id="j_op">
						</div>
					</li>
					<li><a onclick="optionadd();">등록</a> <a
						onclick="optionedit();">수정</a> <a onclick="optiondel();">삭제</a></li>
				</ul>
				<ul>
					<li>주문 옵션 구분2</li>
					<li><select name="j_sel2" class="select" id="j_sel2"
						onchange="getSelectValue2();"  >
							<option value="선택">선택</option>
					</select></li>
					<li>옵션명 :
						<div>
							<input type="text" id="j_op2" placeholder=", / 는 사용하실수 없습니다">
						</div>
					</li>
					<li>추가가격 :
						<div>
							<input type="text" id="j_op3" value="0">
						</div>
					</li>
					<li>추가일 :
						<div>
							<input type="text" id="j_op4" value="0">
						</div>
					</li>
					<li><a onclick="optionadd2();">등록</a> <a
						onclick="optionedit2();">수정</a> <a onclick="optiondel2();">삭제</a></li>
				</ul>
			</div>
			<br>

			<h2 class="bor_none m_top20" id='h2'>공유 이미지등록 *</h2>
			<table class="table table-bordered">

				
					<tr>
						<th class="active">리스트 이미지</th>

						<td>
							<div id='titleImgArea'>
								<img id='titleImg' width="350" height="200" src='/p/thumbnail_uploadFiles/<%=detail.getP_image()%>'>
							</div><button class="btn btn-default" id='changeImg'>이미지변경하기</button>
							<input  class="btn btn-default"  type='hidden' id='thumbnail1' name='thumbnailImg1'
							onchange="LoadImg1(this)" >
						</td>
					</tr>
		
			</table>
		

			<h2 class="bor_none" id='h2'>공유 상세설명</h2>

			<textarea cols="150" rows="10" name='content' class='ckeditor'
				id='editor'><%=detail.getP_content() %></textarea>
			
	<input type='hidden' name='option1' id='option1' value=''>


<br><input type='hidden' name='checkIMG' id='checkIMG' value='0'>

			<div align='center'>
				<button class="btn btn-default" type='submit'>
					수정하기
				</button>
			</div>
			<hr>
			</form>
			
			
			
			<%}; %>
			
	</div>
			<script>
			var imgcount=0;
			$("#changeImg").click(function(){
				$("#changeImg").css("display","none")
				$("#thumbnail1").attr("type",'file');
				$("#titleImg").removeAttr("src");
				imgcount=1;
				$("#checkIMG").val('1');
				return false;
			})

		

	

	
	$(function(){
		
		$("#titleImg").click(function(){
			$("#thumbnail1").click();
		});
		

	})
	
	function LoadImg1(value){
			if(value.files && value.files[0]){
				var reader = new FileReader();
				reader.onload = function(e){
					$("#titleImg").attr("src",e.target.result);
				}
				reader.readAsDataURL(value.files[0]);
			}
			
		}
	


	</script>
	

	<%@ include file="../common/footer.jsp"%>
	<!-- footer -->

	<!-- event  -->

	<!-- function -->
	<script type="text/javascript">
	/* 폼 정규화 처리 */
	function formcheck(){
		
		var $cate1 = $("#category1 option:selected");
		var $cate2 = $("#category2 option:selected");
		var $cate3 = $("#category3 option:selected");
		var $cate4 = $("#category4 option:selected");
		
		var $title = $("#max");
		
		var $date = $("#dp1520352382982");
		var $time = $("#tp1520352382989");
	
		var $sellstate= $("input[name=sellstate]");
		
		var $titleImg =$("#titleImg");
		
		var $price = $("#price");
		
		var $sharecount = $("#sharecount");
		
		
		
		 if($cate1.val()=="1차 카테고리 선택"||$cate2.val()=="2차 카테고리 선택"||$cate3.val()=="3차 카테고리 선택"||$cate4.val()=="4차 카테고리 선택"){
			alert("카테고리를 선택하세요");
			$cate1.focus();
			return false;
		}else if($title.val()==""){
			alert("재능명을 입력하세요");
			 $title.focus();
			 return false;
		}else if($date.val()==""){
			alert("마감일을 정하세요");
			$date.focus();
			return false;
		}else if($time.val()==""){
			alert("마감시간을 정하세요");
			$time.focus();1
			return false;
		}else if(!$sellstate.is(":checked")){
			alert("판매상태를 체크하세요");
			$sellstate.focus();
			return false;
		}else if($titleImg.attr('src')==null&&imgcount==1){
			alert("대표이미지를 선택하세요");
			$("#thumbnail1").focus();
			return false; 
		}else if($price.val()==""){
			alert("기본 가격을 입력하세요");
			$("#price").focus();
			return false;
		}else if($sharecount.val()==""){
			alert("공유가능 횟수를 입력하세요");
			$("#sharecount").focus();
			return false;
		}
			
			$("#editor").text(CKEDITOR.instances.editor.getData());
			
			
			return true;
		
		
	} 
	
	

	function textarea_maxlength(obj){
	var maxLength = parseInt(obj.getAttribute("maxlength"));
		if(obj.value.length>maxLength) {
		alert('글자수가 '+(obj.value.length-1)+'자 이내로 제한됩니다');
		obj.value=obj.value.substring(0,maxLength);
		}
	}



 <!-- S 숫자만 입력 중복 체크 처리 -->
function showKeyCode(event) {
			event = event || window.event;
			var keyID = (event.which) ? event.which : event.keyCode;
				if( ( keyID >=48 && keyID <= 57 ) || ( keyID >=96 && keyID <= 105 ) || keyID == 8 || keyID == 9 || keyID == 46 || keyID == 37 || keyID == 39 )
			{
				return;
			}
			else
			{
				return false;
			}
		}  
 <!-- E 숫자만 입력 중복 체크 처리 -->

	function Toggle(item) {
			//obj=document.getElementById(item);
			var x = document.getElementsByClassName("2");
			var i;
				if (item=='1') {
				for(i=0; i<x.length; i++){
				x[i].style.display="none";
				}
				}
				else {
					for(i=0; i<x.length; i++){
					x[i].style.display="inline-block";
					}
				}

			}

			function baesong(item)
			{
				var x = document.getElementsByClassName("baesong99");
				var i;
					if (item=='1') {
					for(i=0; i<x.length; i++){
					x[i].style.display="none";

					}
					}
					else {
						for(i=0; i<x.length; i++){
						x[i].style.display="";

						}
					}
			}


			$('#imgreset').click(function(){

					$('#file_route1').val("");
					$('#imgInp').val("");
					$('#showimg').attr('src', '');
					$('#imgreset').removeAttr('checked');

			});


			function optionadd() {
			    var x = document.getElementById("j_sel");
			    var option = document.createElement("option");

					if(document.getElementById("j_op").value.length > 0){
						if(document.getElementById("j_op").value.split(',').length>1||document.getElementById("j_op").value.split('/').length>1){
							alert(", 또는  /단어는 포함할수 없습니다")
							document.getElementById("j_op").focus();
						}else{ 
					
					add_gubun = document.getElementById("j_op").value;
						option.text = add_gubun.replace( ",", "，");
					add_gubun2 = document.getElementById("j_op").value;
						option.value = add_gubun2.replace( ",", "，");
				    x.add(option);
					alert("등록되었습니다.");}
				}
			}
			function optionadd2() {
				var a1 = $("#j_sel option:selected").val();
				
				var x = document.getElementById("j_sel2");
				
				add_gubun3 = $("#j_op2").val();
				var x1 = add_gubun3.replace( ",", "	，");
				var x2 = $("#j_op3").val();
				var x3 = $("#j_op4").val();
				if(a1 != "선택"){
					if(document.getElementById("j_op2").value.split(',').length>1||document.getElementById("j_op2").value.split('/').length>1){
						alert(", 또는  /단어는 포함할수 없습니다")
						document.getElementById("j_op2").focus();
					
					}else{
					var option = document.createElement("option");

					option.text = "("+a1+")"+" "+x1+" ( "+x2+"원"+" / "+x3+"일)";
					option.value = a1+"/"+x1+"/"+x2+"/"+x3;
					x.add(option);
					
					var values= $.map($('#j_sel2 option'), function(e) { return e.value; });
					values.join(',');
		
					$("#option1").val(values);
					alert("등록되었습니다.");
						}
					
}

			}





			function getSelectValue()
			{
 document.getElementById("j_op").value = document.getElementById("j_sel").options[document.getElementById("j_sel").selectedIndex].text;
			}

			function getSelectValue2()
			{
				var x = document.getElementById("j_sel2").options[document.getElementById("j_sel2").selectedIndex].value;
 				var y = x.split('/');
 document.getElementById("j_op2").value = y[1];
 document.getElementById('j_op3').value = y[2];
 document.getElementById('j_op4').value = y[3];
			}


			function optionedit() {

					var y =  document.getElementById("j_op").value;
					if($("#j_sel option:selected").val() != "선택"){
			  	$("#j_sel option:selected").val(y);
					$("#j_sel option:selected").text(y);
					alert("수정되었습니다.");
				}

			}

			function optionedit2() {
				var a1 = $("#j_sel option:selected").val();
					var y =  document.getElementById("j_op2").value;
					var y1 = document.getElementById("j_op3").value;
					var y2 = document.getElementById("j_op4").value;
					if($("#j_sel2 option:selected").val() != "선택"){
			  	$("#j_sel2 option:selected").val(a1+"/"+y+"/"+y1+"/"+y2);
					$("#j_sel2 option:selected").text("("+a1+")"+" "+y+" ( "+y1+"원"+" / "+y2+"일)");
					alert("수정되었습니다.");
				}
			}


function optiondel() {
	var x = document.getElementById("j_sel");
		if($("#j_sel option:selected").val() != "선택"){
	    x.remove(x.selectedIndex);
			alert("삭제되었습니다.");
		}
}

function optiondel2() {
	var x = document.getElementById("j_sel2");
	if($("#j_sel2 option:selected").val() != "선택"){
	    x.remove(x.selectedIndex);
			alert("삭제되었습니다.");
		}
}

			$(function() {
					$("#imgInp").on('change', function(){
							readURL(this);
					});
			});


			function readURL(input) {
					if (input.files && input.files[0]) {
					var reader = new FileReader();

					reader.onload = function (e) {
									$('#showimg').attr('src', e.target.result);
							}

						reader.readAsDataURL(input.files[0]);
					}
			}
			



	</script>
	</div>
	</div>
	</div>

</body>
</html>
