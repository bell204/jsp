<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<meta charset="UTF-8">
<title>FAQ</title>
<style>


#A_Container_L {
	float: left;
	width: 200px;
}

#A_Container_C {
	width: 770px;
	float: left;
	overflow: hidden;
	margin-left:40px;
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

table {
    display: table;
    border-collapse: separate;
    border-color: grey;
}

li {
    display: list-item;
    text-align: -webkit-match-parent;
    font-size:20px;
}
tabUl{
display:inline;
}
 
 .jq_hide{
 	font-size:17px;
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
        <h1>FAQ</h1>
          <a href="#tab1" class="btn btn-default">사이트 이용</a>
          <a href="#tab2" class="btn btn-default">구매자</a>
          <a href="#tab3" class="btn btn-default">판매자</a>
          <a href="#tab4" class="btn btn-default">기타</a>
 	 <hr>
        <!-- s : 메인 리스트 -->
        <div class="tab_container">
          <div id="tab1" class="tab_content">
              
    	<div class="onoff">
            <ul class="jq_onoff">
				  
                <li class="on" >
				
                	<p class="jq_toggle"><span>Q</span>오늘의동료 종합공유마켓은 무엇인가요?</p>
                    <p class="jq_hide">
                    	쉐어피플은 종합 공유마켓 플랫폼을 통해 누구나 시간, 재능, 물건, 공간, 차량을 공유하고 거래할 수 있는 서비스를 제공합니다. 등록된 회원만 거래를 할 수 있으며, 회원가입 및 판매상품 등록은 무료입니다.
                    </p>
                </li>
				  <hr/>
				<li>
				
                	<p class="jq_toggle"><span>Q</span>회원가입은 어떻게 하나요?</p>
                    <p class="jq_hide">
                    	만 14세 이상이면 누구나 회원가입이 가능합니다.
                    </p>
                </li>
				  <hr/>
				<li>
				
                	<p class="jq_toggle"><span>Q</span>본인인증은 왜 해야 하나요?</p>
                    <p class="jq_hide">
                    	오늘의동료에서는 보다 안전한 온라인 거래를 위해 본인 확인을 실시하고 있습니다. 이는 명의도용 등으로 인한 개인정보의 악용 방지를 위해서입니다. 서비스를 이용하기 위해서는 회원가입시 반드시 인증 절차를 진행해야합니다.
                    </p>
                </li>
				  <hr/>
				<li>
				
                	<p class="jq_toggle"><span>Q</span>아이디, 비밀번호가 기억나지 않을때는?</p>
                    <p class="jq_hide">
                    	아이디 또는 비밀번호가 기억나지 않으실 경우 홈페이지 최상단의 로그인을 누르신 후 "ID/PW 찾기"를 통해 회원 가입시 입력하셨던 이메일 등으로 해당 정보를 전송 받으실 수 있습니다. 이메일 등을 정확하게 입력하셔야 아이디와 비밀번호를 찾으실 수 있습니다.
                    </p>
                </li>
				  <hr/>
				<li>
				
                	<p class="jq_toggle"><span>Q</span>안전거래 서비스는?</p>
                    <p class="jq_hide">
                    	오늘의동료에서는 공유거래가 안전하게 이루어질 수 있도록, 결제시 결제대금은 매매대금 보호서비스(에스크로)를 통해 안전하게 보관되며 구매자의 구매확정 후 주문이 완료되었을 시 판매자에게 수수료를 제외한 수익금이 지급 됩니다. 거래에 이상이 생길 경우 구매취소 요청을 통해서 환불 등이 가능하므로 안심하고 거래할 수 있습니다.&nbsp;&nbsp;
                    </p>
                </li>
				  <hr/>
				<li>
				
                	<p class="jq_toggle"><span>Q</span>인기/신규/추천/테마 서비스란?</p>
                    <p class="jq_hide">
                    	메인화면에 나오는 인기/신규/추천/테마 서비스에 대한 설명입니다.<br>1. 인기 서비스: 상품/서비스 주간 판매 순으로 노출됩니다. 판매순이 같은 경우 조회순으로 노출됩니다.<br>2. 신규 서비스: 신규 등록순으로 노출됩니다.<br>3. 추천 서비스: 상품/서비스 중에 상세 내용이 잘 작성된 것을 회사에서 선정하거나 메인노출상품(광고) 계약을 맺은 상품/서비스가 노출됩니다.<br>4. 테마 서비스: 종합 공유마켓 플랫폼이다 보니 다양한 공유 카테고리가 존재합니다. 주기적으로 공유 테마를 정해서 카테고리별 상품을 선정해서 노출됩니다. 추가로 메인노출상품(광고) 계약을 맺은 상품/서비스가 함께 노출됩니다.<br><br>
                    </p>
                </li>
				   <hr/>
				<li>
				
                	<p class="jq_toggle"><span>Q</span>사이트 이용제한은?</p>
                    <p class="jq_hide">
                    	안전한 거래를 위해 쉐어피플에서 이용 규정을 지키지 않는 이용자는 이용제한이 될 수 있습니다.<br>직거래유도, 연락처, 타 광고 등은 관리자에 의해 지속적으로 필터링 되고 있습니다.<br>아래와 같이 이용약관에서 설명한 안전거래를 위한 규정을 어길시 이용에 제한이 될 수 있습니다.<br>① 직거래 유도(메세지에 연락처, 이메일, 메신저 아이디 기재)<br>② 쉐어피플과 관련 없는 홍보, 광고 메시지 발송 및 사이트 게시<br>③ 일방적인 주문취소<br>④ 사기성 판매 (판매되고 있는 내용과 전혀 다를 경우)<br>⑤ 불건전한 상품 판매 <br>⑥ 기타 악용 등
                    </p>
                </li>
				   <hr/>
				<li>
				
                	<p class="jq_toggle"><span>Q</span>직거래와 주의할점은?</p>
                    <p class="jq_hide">
                    	직거래는 판매자가 구매자에게 쉐어피플의 결제시스템을 이용하지 않고, 돈을 판매자의 계좌로 직접 이체를 요구하는 등의 행위를 말합니다. 쉐어피플의 결제 시스템을 이용하지 않고, 직거래시 발생하는 피해에 대하여 일체 책임을 지지 않습니다.
                    </p>
                </li>
				   <hr/>
				<li>
				
                	<p class="jq_toggle"><span>Q</span>모바일을 통해 쉐어피플 이용 가능한가요?</p>
                    <p class="jq_hide">
                    	모바일 웹버전, 앱(안드로이드, iOS 버전)을 통해 모바일 이용 가능합니다.
                    </p>
                </li>
				   <hr/>
            </ul>
        </div>

          </div>
                  
          
        </div><!-- e : 메인 리스트 -->
         <script>
        $(document).ready (function () {
            $('.jq_onoff .jq_hide').css('display', 'none');
            $('.jq_autoonoff .jq_hide').css('display', 'none');
            
            //리스트(ul) onoff
            $('.jq_onoff').delegate('.jq_toggle', 'click', function() {
                $(this).parent().toggleClass('on');
                $(this).siblings('.jq_hide').stop('true','true').slideToggle('fast');
            });
        
        });
        </script>
         
    </div>
 

</div>



<hr>
<%@ include file="../common/footer.jsp" %>

</div>

</body>
</html>