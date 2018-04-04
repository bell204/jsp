<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<title>회원가입</title>
<style>
 #next {
 font-family: 'LotteMartDream';
	width: 200px;
	height: 50px;
	border:none;
	border-radius:10px;
	background:#336699;
	color: white;
}
 .bor_none { border:none !important; margin-left:380px; font-family: 'LotteMartDream'; }
 div.textarea { width:850px; margin-left:auto; margin-right:auto; margin-bottom:30px; padding:15px; border:1px solid /* #e6e6e6 */black; }
div.textarea textarea		{ width:800px; height:145px; overflow-y:auto; border:0; color:#666; font-size:14px; font-weight:600; line-height:140%; }
.agreeCk					{ margin:-20px 0 30px 0;  color:#666; font-size:12px; font-weight:600;  margin-left:300px;}
.agreeCk input				{ vertical-align:top;}
.joinTable {
	border: 1px solid #b4b4b4;
	width: 400px;
	height: 50px;
text-align: center;
}
#step1 {
color:white;
	background:#336699;
}
</style>
</head>
<body>
	<%@ include file="../common/header.jsp"%>
	<br>
	<br> 
	<div class="BigContainer">
<br>
<h2 style="font-family: 'LotteMartDream'; text-align:center">회원가입</h2>
<br>
<table class="joinTable" border="1" align="center">
	<tr>
		<td id="step1">STEP1</td>
		<td>STEP2</td>
	</tr>
</table>
<br>
<h2 class="bor_none sub_title">이용약관 동의</h2>
	<div class="textarea">
		<textarea>제 1장 총칙 

제 1조 (목적) 
본 약관은 (주)오늘의동료(이하 “회사”라 함)이 운영하는 “오늘의동료” 사이트(www.todayscolleague.co.kr, 이하 “오늘의동료”이라 함)와 스마트폰 등 이동통신기기를 통해 제공되는 ‘오늘의동료’ 모바일 애플리케이션(이하 “모바일오늘의동료”이라고 합니다)을 통해서 제공하는 중개 서비스 및 기타 정보서비스 (이하 “서비스”라 함)와 관련하여, 회사와 이용자의 권리, 의무 및 책임사항을 정하는 것을 목적으로 합니다.

제 2조 (용어의 정의) 
본 약관에서 사용하는 용어의 정의는 아래와 같습니다. 
① "오늘의동료"라 함은 회사가 재화 또는 용역을 이용자에게 제공하기 위하여 단말기(PC, TV, 휴대형단말기 등의 각종 유무선 장치를 포함) 등 정보통신설비를 이용하여 재화 또는 용역을 거래할 수 있도록 설정한 웹사이트(www.todayscolleague.co.kr)를 말합니다. 
② “서비스"라 함은 회사가 판매자 또는 구매자의 거래를 목적으로 등록하는 자료를 DB화하여 각각의 목적에 맞게 분류 가공, 집계하여 정보를 제공하는 서비스와 해당 인터넷 주소에서 제공하는 모든 부대 서비스를 말합니다. 
③ “회원”이라 함은 회사에 개인정보를 제공하여 회원등록을 한 개인 또는 법인으로서, 다음과 같이 일반회원과 판매회원으로 구분이 됩니다. 
1. 일반회원(구매자): 회사에서 제공하는 구매서비스를 이용할 수 있는 14세 이상의 개인이나 법인 
2. 판매회원(판매자): 회사에서 제공하는 구매서비스 및 판매서비스를 이용할 수 있는 14세 이상의 개인이나 법인 
④ “아이디(ID)”라 함은 회원의 식별과 서비스 이용을 위하여 회원이 설정하고 회사가 승인하여 등록된 문자와 숫자의 조합을 말합니다. 
⑤ “비밀번호”라 함은 회원의 동일성 확인과 회원의 권익 및 비밀보호를 위하여 회원 스스로가 설정하여 회사에 등록한 영문과 숫자의 조합을 말합니다. 
⑥ “공유정보”라 함은 회원이 서비스를 이용함에 있어 서비스상에 게시한 부호?문자?음성?음향?화상?동영상 등의 정보 형태의 글, 사진, 동영상 및 각종 파일과 링크 등을 의미합니다 
⑦ “직거래”라 함은 회사가 제공하는 서비스를 이용하지 않고 이메일, 연락처, 메신저 아이디 등 교환을 통한 개인간 거래를 통한 거래를 말합니다 
⑧ “프로필”이라 함은 회원이 경력, 자기소개, 포트폴리오를 관리할 수 있는 란을 말합니다 
⑨ “중개서비스”라 함은 회사의 서비스(www.todayscolleague.co.kr)을 통하며 회원들에게 제공하는 중개서비스 및 관련 부가서비스 일체를 말합니다. 
⑩ “안전거래서비스”라 함은 회사가 구매자의 결제대금의 보호를 위하여 일정 기간 동안 결제대금을 예치하는 서비스를 말합니다. </textarea>
	</div>
<p class="agreeCk"><input type="checkbox" name="strAgree" id="check1"> 위의 이용약관에 동의합니다. <a href="#"><span>이용약관 전문보기</span></a></p>

<br><br><br>
<h2 class="bor_none">개인정보처리방침 동의</h2>
<div class="textarea">
	<textarea>주식회사 오늘의동료(이하 “회사”)는 회사가 운영하는 인터넷 사이트(www.sharepeople.co.kr, 이하 “오늘의동료”)를 이용하는 이용자님들의 개인정보를 매우 중요하게 생각하며 아래와 같은 개인정보처리방침을 가지고 있습니다. 이 개인정보처리방침은 개인정보와 관련한 법령 또는 지침의 변경이 있는 경우 갱신되고, 정책의 변화에 따라 달라질 수 있으니 이용자께서는 오늘의동료 사이트를 방문 시 수시로 확인하여 주시기 바랍니다. 오늘의동료의 개인정보처리방침은 다음과 같은 내용을 담고 있습니다.
	
1. 개인정보의 수집·이용
가. 회사가 개인정보를 수집하는 목적은 이용자의 신분과 서비스 이용의사를 확인하여 최적화되고 맞춤화된 서비스를 제공하기 위함입니다. 회사는 최초 회원가입 시 서비스의 본질적 기능을 수행하기 위해 반드시 필요한 최소한의 정보만을 수집하고 있으며 회사가 제공하는 서비스 이용에 따른 대금결제, 물품배송 및 환불 등에 필요한 정보를 추가로 수집할 수 있습니다. 나. 회사는 개인정보를 수집·이용목적 이외에 다른 용도로 이를 이용하거나 이용자의 동의 없이 제3자에게 이를 제공하지 않습니다.다. 회사는 다음과 같은 목적으로 개인정보를 수집하여 이용할 수 있습니다. 다만, 전자상거래 등에서의 소비자보호에 관한 법률, 국세기본법, 전자금융거래법 등 관련법령에 따라 주민등록번호 및 은행계좌번호의 수집·보관이 불가피한 경우나, 휴대폰 소액결제 등 요금정산을 위하여 이동전화번호정보의 수집·보관이 불가피한 경우에는 이용자에게 고지하여 해당 정보를 수집할 수 있습니다.</textarea>
</div>

<p class="agreeCk"><input type="checkbox" name="strAgree2" id="check1"> 위의 개인정보처리방침에 동의합니다.<a href="#"><span>개인정보처리방침 전문보기</span></a></p>

<br><br><br>
	<div align="center">
		<button id="next" onclick="goNext();">동의</button>
	</div> 
</div>
	<script>
		function goNext() {
			if($("#check1:checked").length == 2){
				location.href = "join_step2.jsp";
			}else{
				alert("약관에 전부 동의하셔야 됩니다.");
			}
		}
	</script>
	<br>
	<br>
	<br>
	<br>

	<br>
	<br>
	<%@ include file="../common/footer.jsp"%>
</body>
</html>