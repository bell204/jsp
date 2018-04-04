<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>캐시충전</title>
<style>
#A_Container_L {
	float: left;
	width: 200px;
}

#A_Container_C {
	width: 770px;
	float: left;
	overflow: hidden;
}

#A_Container {
	width: 1000px;
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

/*  */
.chargeArea {
	float: left;
}

.chargeTable {
	border: 1px solid #e6e6e6;
	margin-left: 20px;
	width: 500px;
	height: 700px;
	font-size: 12px;
}

.td {
	padding-left: 30px;
}

.showBonus {
	margin-left: 10px;
	background: #ff4d4d;
	color: white;
	width: 120px;
	height: 25px;
	border-radius: 10px;
	border: none;
}

.myMoneyArea {
	position: relative;
	float: right;
	left: 10px;
	bottom: 750px;
	width: 250px;
	height: 600px;
	background:#ffffe6;
	border: 1px solid #ffffe6;
}

.howtoPay{
	width:800px;
}
.payArea{
	text-align:center;
	border: 1px solid #f2f2f2;
}
.payment{
	width:200px;
	border: 1px solid #cccccc;
}
.payAreatr{
	height:50px;
}
.tr:hover{
	background:#ffffe6;
}
</style>
</head>
<body>
	<%@ include file="../common/header.jsp"%>

	<div id='A_Container_Wrap'>
		<div id='A_Container'>
			<%@ include file="../mypage/mypageleft.jsp"%>

			<!--  -->
			<div class="chargeArea">
				<!-- 캐시충전 공간 -->
				<h2 style="margin-left: 30px;">캐시 충전</h2>
				<div class="chargeOption">

					<table class="chargeTable" border="1">
						<tr class="tr">
							<td class="td"><input type="radio" name="money" id="50000">
								<label for="50000">\ 50,000</label></td>
						</tr>
						<tr class="tr">
							<td class="td"><input type="radio" name="money" id="100000">
								<label for="100000">\ 100,000</label></td>
						</tr>
						<tr class="tr">
							<td class="td"><input type="radio" name="money" id="200000">
								<label for="200000">\ 200,000</label></td>
						</tr>
						<tr class="tr">
							<td class="td"><input type="radio" name="money" id="300000">
								<label for="300000">\ 300,000</label></td>
						</tr>
						<tr class="tr">
							<td class="td"><input type="radio" name="money" id="500000">
								<label for="500000">\ 500,000</label></td>
						</tr>

						<tr class="tr">
							<td class="td"><input type="radio" name="money" id="1000000">
								<label for="1000000">\ 1,000,000
									<button class="showBonus" disabled>+10,000 보너스</button>
							</label></td>
						</tr>

						<tr class="tr">
							<td class="td"><input type="radio" name="money" id="2000000">
								<label for="2000000">\ 2,000,000
									<button class="showBonus" disabled>+40,000 보너스</button>
							</label></td>
						</tr>

						<tr class="tr">
							<td class="td"><input type="radio" name="money" id="3000000">
								<label for="3000000">\ 3,000,000
									<button class="showBonus" disabled>+90,000 보너스</button>
							</label></td>
						</tr>

						<tr class="tr">
							<td class="td"><input type="radio" name="money" id="5000000">
								<label for="5000000">\ 5,000,000
									<button class="showBonus" disabled>+200,000 보너스</button>
							</label></td>
						</tr>

					</table>
				</div>
				<div class="myMoneyArea">
					<img src="/p/Pimages/won.png"
						style="margin-left: 30px; margin-top: 30px; /* border:1px solid red; */ width: 70px;">
					<label>보유 캐시</label> <label
						style="color: red; font-size: 15px; position: relative; top: 25px; right: 50px;">0원</label>
					<hr
						style="border: 1px solid black; width: 200px; margin-left: 20px; border-style: dotted;">
					<br>
					<div style="margin-left: 50px;">
						<p>
							<b>충전 캐시</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							\0원
						</p>

						<p>ㄴ 적립금&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							\0원</p>
						<p>
							<b>총 충전 캐시</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \0원
						</p>
					</div>
					<hr
						style="border: 1px solid black; width: 200px; margin-left: 20px; border-style: dotted;">
					<br>
					<p style="margin-left: 45px;">
						<b>총 결재 금액</b>
					</p>

					<label
						style="color: red; float: right; font-size: 30px; margin-right: 20px; margin-top: 150px;">
						\0 원</label>
				</div>


				
			<!-- 결제방법 -->
				<div class="howtoPay">
				<h2 style="margin-left:30px;">결제 방법</h2>
				<br>
					<table class="payArea" >
						<tr class="payAreatr">
							<td class="payment">
								<input type="radio" name="payment" id="creditcard">
								<label for="creditcard">신용카드</label>
							</td>
							<td class="payment"> 
								<input type="radio" name="payment" id="sendAccount">
								<label for="sendAccount">무통장입금</label>
							</td>
							<td class="payment">
								<input type="radio" name="payment" id="payPhone">
								<label for="payPhone">휴대폰</label>
							</td>
							<td class="payment">
								<input type="radio" name="payment" id="realtimePay">
								<label for="realtimePay">실시간 계좌이체</label>
							</td>
						</tr>
					</table>
					<br>
					<!-- 이버튼은 api로 넘어가유 -->	
					<button style="float:right;background:#ff4d4d; border-radius:5px; color:white; border:none; width:130px; height:40px;" >결제하기</button>				
				</div>
			</div>
		</div>
	</div>
	<br>
	<%@ include file="../common/footer.jsp"%>
</body>
</html>