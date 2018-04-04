<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.tc.product.model.vo.Income"%>
    <% Income in= (Income)request.getAttribute("income"); %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../_css/jquery-ui.css">
<script src="../js/jquery-ui.js"></script>
<meta charset="UTF-8">
<title>My Page</title>

<style>
   input[type="number"]::-webkit-outer-spin-button,
input[type="number"]::-webkit-inner-spin-button {
    -webkit-appearance: none;
    margin: 0;
}
.btn_bottom { margin-top: 6px; text-align: center; }
.btn_bottom span { display: inline-block; width: 130px; padding: 0; border-radius: 3px; color: #fff; font-size: 16px; font-weight:600; line-height: 40px; background: #2fa0ee; }
.f_left {float:left;}
.f_right { float:right; }



#A_Container_L{ 
   float:left;   width:200px;
}
#A_Container_C {
    width: 770px;
    float: left;
    overflow: hidden;
    margin-left:50px;   
}
#A_Container   { width:1100px; margin:0 auto; margin-top:50px; margin-bottom:20px; clear:both; overflow: hidden; min-height:500px;}
#A_Container_Wrap  { width:100%; clear:both;  height:100%;}

.sharelist_tab { display:inline-block; width:101%; border: 1px solid #dedede; margin-top:50px; }
.sharelist_tab li { float:left; width:49.8%; background:#efefef; line-height:50px; font-size:16px; font-weight:600; color:#666666; text-align:center;  }
.sharelist_tab li:first-child { border-right: 1px solid #dedede; }
.sharelist_tab li.on2, .sharelist_tab li:hover { background:#2d9fee; color:#ffffff; }


table{border-collapse:collapse;border-spacing:0}


</style>
</head>






<body>
   <%@ include file="../common/header.jsp" %>  
 
 <div id='A_Container_Wrap'>
 <div id='A_Container'>
    <%@ include file = "../mypage/mypageleft.jsp" %>
    
    <div id="A_Container_C" >
            <ul class="sharelist_tab">
            <a href="/p/selectIncome?num=1"><li style="width:33%" class="on">수익금정산</li></a>
            <a href="/p/selectIncome?num=2"><li style="width:33%" class='on2'>수익금출금신청</li></a>
            <a href="<%=request.getContextPath()%>/incomeStory"><li style="width:33%" class='on3'>수익금출금신청내역</li></a>
            </ul>
            <br><br>
            <h1>수익금 출금 신청</h1>
            <style>
			.share_calculate { width:100%; border:1px solid #c6c6c6; border-bottom:none; border-right:none; margin-bottom:10px; }
			.share_calculate th, .share_calculate td { border-bottom:1px solid #c6c6c6; border-right:1px solid #c6c6c6; font-size:14px; color:#666}
			.share_calculate th { background: #f6f6f6; font-weight:600; padding:10px 5px; height:21px;}
			.share_calculate td { background: #ffffff; padding:2px 5px; }
			.share_calculate input { width:50%; height:28px; border:1px solid #d2d2d2; font-size:14px; font-weight:600; color:#666666; }
			.bt_txt { font-size:14px; color:#666; }
			</style>
			<meta charset="euc-kr">
			<form name="prochk" method="post" action="<%=request.getContextPath()%>/incomeStory">
<!--form name="frmRequestForm" method="post" onsubmit="return frmRequestForm_Submit(this);" action="query.asp" enctype="multipart/form-data"-->
<table class="share_calculate">
        <colgroup>
            <col width="40%">
              <col>
          </colgroup>
  <tbody><tr>
    <th>총 판매액</th>
    <td><%=String.format("%,d", in.getSumprice()) %></td>
          </tr>
    <tr>
    <th>출금 완료캐쉬</th>
    <td><%=String.format("%,d", in.getOutcash()) %></td>
   	</tr>
     <tr>
    <th>출금 신청캐쉬</th>
    <td>
	     <%=String.format("%,d", in.getRequestout()) %></td>
   	</tr>
          <tr>
            <th>출금 가능캐쉬</th>
            <td><%=String.format("%,d", in.getMycash()) %></td>
            <input type="hidden" name="realMoneyzz" id="rm" value="">
          </tr>
          <tr>
            <th>출금 신청캐쉬</th>
            <td><input type="number" id="getmoney2" name="getmoney" value="" onkeyup="change();" onkeydown="return showKeyCode(event)">&nbsp;원</td>
          </tr>
          <tr>
            <th>가능여부</th>
            <td id="okno"></td>
          </tr>
      </tbody></table>
	  <p class="bt_txt">* 수익금 출금신청을 하시면 영업일 기준 1일 이내에 계좌이체가 완료됩니다.</p>
      <div class="btn_bottom f_right">
        <a href="#" onclick="go();"><span>신청하기</span></a>
      </div>
      <input type="hidden" name="intseq" value="643">
</form>
<script type="text/javascript">
function change(){
//신청금액
var y =$('#getmoney2').val();

if(y > <%=in.getMycash() %> || y <100 ){
document.getElementById('okno').innerHTML = "신청불가";
}else{
  document.getElementById('okno').innerHTML = "신청가능";
  document.getElementById('rm').value = y;
}
}
function showKeyCode(event) {
    event = event || window.event;
    var keyID = (event.which) ? event.which : event.keyCode;
      if( ( keyID >=48 && keyID <= 57 ) || ( keyID >=96 && keyID <= 105 ) || keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 )
    {
      return;
    }
    else
    {
      return false;
    }
  }
function go(){
  if ( document.getElementById('getmoney2').value == "" ) { alert("신청금액을 입력해주세요"); document.getElementById('getmoney2').focus(); return false; }
  if ( document.getElementById('getmoney2').value > <%=in.getMycash() %> || document.getElementById('getmoney2').value <100 ) { alert("신청불가입니다"); return false; }

 document.prochk.submit();
}
</script>


     
   






</div>
</div>
<br><br><br><br>
<%@ include file="../common/footer.jsp" %>

</body>
</html>