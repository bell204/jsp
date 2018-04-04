<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오동 캐시</title>
<style>
.tcArea {
	/* border: 1px solid black; */
	width: 80%;
	height: 1000px;
	margin-left: auto;
	margin-right: auto;
}

.leftProfile {
	float: left;
	width: 300px;
	margin-left: 10px;
}

.charge {
	border: none;
	border-radius: 5px;
	background: #ff6666;
	color: white;
	width: 100px;
	height: 40px;
}

.Cashrecord {
	/* border: 1px solid black; */
	width: 800px;
	float: left;
	margin-left: 30px;
}

.payRecordArea {
	border: 1px solid #d9d9d9;
	width: 800px;
	height: 250px;
	background: #f2f2f2;
}
/* 캐시내역 아래 select */
.cashUse {
	width: 110px;
	height: 30px;
	padding-left: 20px;
	margin-right: 10px;
	margin-left: 10px;
	border: 1px solid #d9d9d9;
}

.count {
	height: 30px;
	width: 90px;
	padding-left: 20px;
	margin-left: 10px;
	border: 1px solid #d9d9d9;
}

.date {
	height: 30px;
	border: 1px solid #d9d9d9;
}
/* 달력 */
.padding-right-0 {
	padding-right: 0 !important;
}

.line-panel, .my-profile-menu-list, .padding-left-0 {
	padding-left: 0 !important;
}
.panel-body{
	border:1px solid black;
}
</style>
</head>
<body>
	<%@ include file="../common/header.jsp"%>
	<!-- 전체 틀 -->
	<div class="tcArea">
		<h2 style="margin-left: 30px;">오동 캐시</h2>
		<div
			class="leftProfile text-center panel panel-default user-profile-bottom-container margin-bottom-0 margin-top-0">
			<div class="user-profile-body">
				<br> <img src="/p/Pimages/city1.PNG" id="profileImg"
					class="img-circle" alt="프로필 사진" width="200" height="200">
			</div>
			<ul class="list-group margin-top-10">
				<li class="list-unstyled margin-bottom-20">
					<h3 class="margin-bottom-20">닉네임</h3>
					<div class="font-color-lighter font-size-h6">오동캐시</div>
					<h3 class="margin-bottom-15 margin-top-5 link-color-blue NGB">
						0 원</h3>
					<div>
						<button onclick="location.href='/p/views/pay/ChargeCash.jsp'"
							class="charge">충전하기</button>
					</div> <br>
				</li>
				<li class="list-group-item padding-all-15">
					<div class="row">
						<div class="col-xs-4 text-left  padding-right-0">
							<div class="font-color-lighter">적립캐시</div>
						</div>
						<div class="col-xs-8 text-right">
							<b>0&nbsp;원</b>
						</div>
					</div>
				<li class="list-group-item padding-all-15">
					<div class="row">
						<div class="col-xs-4 text-left padding-right-0">
							<div class="font-color-lighter">충전캐시</div>
						</div>
						<div class="col-xs-8 text-right">
							<b>0&nbsp;원</b>
						</div>
					</div>
				</li>

			</ul>
		</div>
		<button style="float:right; background:white; border-radius:5px; border:1px solid darkgray;"
		onclick="location.href='/p/views/member/myPage.jsp'"
		>마이페이지로 돌아가기</button>
		<!-- 좌측 프로필 끝  -->
		<div class="Cashrecord">
			<h3>캐시 내역</h3>
			<br>
			<div>
				<select class="cashUse">
					<option>전체</option>
					<option>적립</option>
					<option>사용</option>
					<option>취소</option>
					<option>만료</option>
				</select> <input class="date" type="date" name="startdate">&nbsp;
				~&nbsp; <input class="date" type="date" name="enddate"> <select
					class="count">
					<option>5개</option>
					<option>10개</option>
					<option>15개</option>
				</select>
				<button
					style="background: black; border: none; border-radius: 5px; color: white; width: 120px; height: 30px;">조회</button>
				<br>
				<br>
				<br>
				<div class="payRecordArea"></div>
				<br><br>
				<div class="panel-body">

					<h6 class="NGB margin-all-0 padding-bottom-5">
						<i class="fa fa-exclamation-circle" aria-hidden="true"></i> <b>오동캐시 소개</b>
					</h6>
					<div class="row">
						<div class="col-xs-8">
							<ul
								class="font-color-light margin-top-5 margin-top-5 margin-bottom-0 font-size-h6 padding-left-20">
								<li>오동캐시는 서비스 구매 후 구매확정 시점 또는 이벤트 등을 통해 적립됩니다.</li>
								<li>오동캐시는 서비스 구매 시 사용할 수 있으며, cash는 현금 1원의 의미가 있습니다.</li>
								<li>충전캐시가 아닌 무상으로 적립된 크몽캐시는 현금 환불이 불가능합니다.</li>
								<li>오동캐시의 유효기간은 적립일 기준 10년이며, 만료일 순으로 사용 처리됩니다.</li>
								<li>캐시 환불 신청 시, 충전캐시 전액이 환불되며 부분 환불은 불가능합니다.</li>
								<li>오동캐시 환불 접수는 평일 오후 4시에 마감되며, 접수된 시점에서 영업일 기준 2일 이내에
									처리됩니다.</li>
								<li>환불 신청하신 금액을 서비스 구매 시에 사용할 경우, 환불 요청이 자동으로 취소됩니다.</li>
							</ul>
						</div>
						<div class="col-xs-4">
							<div class="pull-right margin-top-40">
								<a class="btn btn-default btn-sm padding-top-5 padding-bottom-5 margin-top-10"
									>캐시 환불</a>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>

	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>

	<%@ include file="../common/footer.jsp"%>
</body>
</html>