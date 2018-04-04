<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Page</title>
<style>
.myPurchase_tab {
	width: 100%;
	height: 68px;
	border-top: 1px solid #dedede;
	border-bottom: 1px solid #dedede;
}

.myPurchase_tab li {
	float: left;
	width: 19.94%;
	text-align: center;
	height: 65px;
	font-size: 16px;
	font-weight: 600;
	color: #666666;
	line-height: 24px;
	padding-top: 12px;
	background: url(../image/common/bg_arrow_r.png) no-repeat #efefef right
		center;
}

.myPurchase_tab li:first-child {
	border-left: 1px solid #dedede;
}

.myPurchase_tab li:last-child {
	background: #ffffff;
	border-right: 1px solid #dedede;
}

.myPurchase_tab li:nth-child(4) {
	background: #efefef;
}

.myPurchase_tab li a {
	font-size: 16px;
	font-weight: 600;
	color: #2fa0ee;
}

.myPurchase_tab li a b {
	color: #2fa0ee;
	font-weight: 600;
}

.myPurchase_tab li a em {
	color: #ff4b5c;
	font-weight: 600;
	font-style: normal;
}

.myPurchase_tab li p {
	color: #666666;
}

/* 留덉씠�섏씠吏� - 援щℓ�댁뿭 硫붿씤 */
.purchaseTable {
	width: 100%;
	margin-top: 20px;
	border-top: 1px solid #dedede;
	border-left: 1px solid #dedede;
	font-size: 13px;
	text-align: left;
}

.purchaseTable th, .purchaseTable td {
	font-size: 14px;
	color: #666;
	border-bottom: 1px solid #dedede;
	line-height: 50px;
	padding: 0 20px 0 30px;
}

.purchaseTable th {
	border-right: 0;
	font-weight: 600;
	text-align: left;
	background: #efefef;
}

.purchaseTable td {
	font-weight: normal;
	border-right: 1px solid #dedede;
}

.purchaseTable th span {
	background: #989898;
	padding: 0px 9px;
	float: right;
	border-radius: 20px;
	line-height: 26px;
	margin-top: 12px;
	color: #ffffff;
}

/* 留덉씠�섏씠吏� - 寃��� */
.mypage_search {
	width: 99.8%;
	line-height: 50px;
	background: #efefef;
	border: 1px solid #dedede;
	text-align: center;
}

.mypage_search select, .mypage_search input {
	border: 1px solid #c6c6c6;
	outline: none;
}

.mypage_search select {
	width: 180px;
	height: 28px;
}

.mypage_search input {
	width: 370px;
	height: 26px;
	padding-left: 5px;
}

.mypage_search a {
	padding: 6px 15px;
	background: #2fa0ee;
	font-size: 14px;
	font-weight: 600;
	color: #ffffff;
}

.mypage_table {
	width: 100%;
	border: 1px solid #dedede;
	border-bottom: none;
	margin-bottom: 50px;
	font-size: 14px;
	margin-top: 10px;
}

.mypage_table th {
	text-align: left;
	padding-left: 25px;
}

.mypage_table td {
	color: #666;
	border-bottom: 1px solid #e6e6e6;
}

.mypage_table tr:first-child th {
	border-right: 1px solid #dedede;
}

.mypage_table tr:last-child {
	background: #d8e2e8;
	height: 40px;
}

.mypage_table tr:last-child th, .mypage_table tr:last-child td {
	font-size: 14px;
	font-weight: 600;
	color: #666666;
}

.mypage_table tr:nth-child(1) td {
	padding: 30px;
}

.mypage_table tr:nth-child(2) td:nth-child(1) {
	padding: 30px;
	border-right: 1px solid #e6e6e6;
}

.mypage_table tr:nth-child(2) td:nth-child(2), .mypage_table tr:nth-child(4) td:last-child
	{
	text-align: center;
	padding: 0px;
	border-bottom: none;
}

.mypage_table tr:nth-child(3) td {
	line-height: 40px;
	font-size: 14px;
	font-weight: 600;
	border-right: 1px solid #e6e6e6;
	border-bottom: none;
	padding: 0 30px;
}

.mypage_table tr:nth-child(4) td {
	padding: 10px 0 10px 30px;
}

.mypage_table tr:nth-child(4) td {
	border-right: none;
	position: relative;
}

.mypage_table td a.btn {
	font-size: 12px;
	font-weight: normal;
	color: #ffffff;
	background: #979797;
	padding: 8px;
	border-radius: 2px;
	display: inline-block;
}

.mypage_table li {
	line-height: 24px;
	background: url(../image/common/list_dot.png) no-repeat left center;
	padding-left: 15px;
}

.mypage_table .price {
	font-size: 18px;
	font-weight: 600;
	color: #e14948;
}

.mypage_table img {
	float: left;
	padding-right: 20px;
	width: 120px;
}

.mypage_table em {
	float: right;
	font-style: normal;
}

.mypage_table .num {
	font-size: 16px;
	font-weight: 600;
	color: #444444;
}

.mypage_table .date {
	font-size: 12px;
	font-weight: normal;
	color: #666666;
	padding-top: 20px;
}

.mypage_table .info {
	position: relative;
	float: left;
	width: 380px;
	height:;
}

.mypage_table .info p.cate {
	margin-bottom: 15px;
}

.mypage_table .info div.hit {
	position: absolute;
	top: 0;
	right: 0;
}

.mypage_table .info div.option {
	padding-top: 8px;
}

.mypage_table .inquiry {
	position: absolute;
	top: 5px;
	right: 0;
	background: #444444;
	float: right;
}

.mypage_table .buy_com {
	font-size: 12px;
	font-weight: normal;
	color: #ffffff;
	padding: 8px;
	border-radius: 2px;
	display: inline-block;
}

.list_page {
	margin: 30px auto 0;
	text-align: center;
	zoom: 1;
}

.list_page .first_btn {
	display: inline-block;
	width: 25px;
	height: 24px;
	text-indent: -9999px;
	vertical-align: bottom;
	background: url(https://www.sharepeople.co.kr/image/common/arrow_l.png) no-repeat left top;
}

.list_page .first2_btn {
	display: inline-block;
	width: 24px;
	height: 24px;
	text-indent: -9999px;
	vertical-align: bottom;
	background: url(https://www.sharepeople.co.kr/image/common/arrow_l.png) no-repeat -25px top;
}

.list_page ul {
	display: inline-block;
	overflow: hidden;
	padding: 0 7px;
	vertical-align: bottom;
}

.list_page li {
	float: left;
	margin: 0 5px;
}

.list_page li:hover a, .list_page li a.on {
	color: #fff;
	background: #0eade7;
}

.list_page li a {
	display: block;
	width: 24px;
	height: 24px;
	font-size: 12px;
	color: #444;
	text-align: center;
	line-height: 25px;
}

.list_page .last2_btn {
	display: inline-block;
	width: 25px;
	height: 24px;
	text-indent: -9999px;
	vertical-align: bottom;
	background: url(https://www.sharepeople.co.kr/image/common/arrow_r.png) no-repeat left top;
}

.list_page .last_btn {
	display: inline-block;
	width: 24px;
	height: 24px;
	text-indent: -9999px;
	vertical-align: bottom;
	background: url(https://www.sharepeople.co.kr/image/common/arrow_r.png) no-repeat -25px top;
}

.co444444 {
	color: #444444 !important;
} /*?????*/
.co6393b4 {
	color: #6393b4 !important;
} /*????*/
.co2fa0ee {
	color: #2fa0ee !important;
} /*???*/
.coff4b5c {
	color: #ff4b5c !important;
} /*???*/
.coe14948 {
	color: #e14948 !important;
} /*????*/
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

#A_Container_L {
	float: left;
	width: 200px;
}

#A_Container_C {
	width: 770px;
	float: left;
	overflow: hidden;
	margin: 50px;
}

#A_Container {
	width: 1100px;
	margin: 0 auto;
	margin-top: 50px;
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
</style>
</head>
<body>
	<%@ include file="../common/header.jsp"%>

	<div id='A_Container_Wrap'>
		<div id='A_Container'>
			<%@ include file="../mypage/mypageleft.jsp"%>
			<div id="A_Container_C">

				<h1 class="bor_btm266 m_bottom20">판매내역</h1>
				<ul class="myPurchase_tab">
					<li><a href="pnlist.asp?status=10"><p>공유대기중</p> 0</a></li>
					<li><a href="pnlist.asp?status=20"><p>공유진행중</p>0</a></li>
					<li><a href="pnlist.asp?status=30"><p>공유완료</p>0</a></li>
					<li><a href="pnlist.asp?status=40" class="co444444"><p>거래완료</p>0</a></li>
					<li><a href="pnlist.asp?status=50" class="coe14948"><p>수정요청</p>0</a></li>
				</ul>

				<h2 class="bor_none">공유대기중</h2>
				<div class="mypage_search">
					<form id="searchForm" name="searchForm" method="post"
						action="?status=10&amp;page=1&amp;">

						<select style="width: 82px;" name="keyword_option">
							<option value="d_name">제목</option>
							<option value="d_userid">아이디</option>
						</select> <input name="keyword" type="text" id="keyword" value="">
						<a href="#" onclick="document.searchForm.submit();">검색</a>
					</form>
				</div>


				<table class="mypage_table" cellspacing="0">
					<colgroup>
						<col style="width: 180px">
						<col style="width:">
						<col style="width: 80px">
					</colgroup>
					<tbody>
						<tr>
							<td colspan="3">내역이 없습니다.</td>
						</tr>
					</tbody>
				</table>
				<div class="list_page">
					<a href="#" class="first_btn">처음</a><a
						href="#" class="first2_btn">이전</a>
					<ul></ul>
					<a href="#" class="last2_btn">다음</a><a
						href="#" class="last_btn">맨뒤</a>
				</div>
			</div>

			




		</div>
	</div>

<br><br><br><br>
<%@ include file="../common/footer.jsp" %>
</body>
</html>