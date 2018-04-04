<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.tc.product.model.vo.Dealrecord"%>
    <% Dealrecord dr = (Dealrecord)request.getAttribute("dr"); 
    String com = (String)request.getAttribute("com"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Page</title>
<style>

/* 怨듯넻 */
.content { display:block; width:1000px; margin:0 auto; }
h1 { color:#444; font-size:26px; font-weight:600; padding-bottom:20px; }
h2 { color:#444; font-size:18px; font-weight:600; margin-top:60px; border-bottom:2px solid #666; line-height:40px; }
h3 { color:#666; font-size:16px; font-weight:600; }
h4 { color:#666; font-size:14px; font-weight:600; }

* {margin:0; padding:0; list-style:none; text-decoration:none; font-family: 'Nanum Gothic', sans-serif;}
ul>li>a { text-decoration:none; }
a { color:#666666;}

#A_Container_C {
    width: 770px;
    float: left;
    overflow: hidden;
    margin:50px;
}
#A_Container   { width:1100px; margin:0 auto; margin-top:50px; margin-bottom:20px; clear:both; overflow: hidden; min-height:500px;}
#A_Container_Wrap  { width:100%; clear:both;  height:100%;}

* {
    margin: 0;
    padding: 0;
    list-style: none;
    text-decoration: none;
    font-family: 'Nanum Gothic', sans-serif;
}

.mymain_tab { width:100%; height:68px; border-top:1px solid #dedede;  border-bottom:1px solid #dedede; margin-bottom:20px; }
.mymain_tab li { float:left; width:25%; text-align:center; height:68px; font-size:16px; font-weight:600; color:#666666; background:#efefef; line-height:24px; padding-top:12px;
             border-right:1px solid #ffffff; border-left:1px solid #dedede; box-sizing:border-box; }
.mymain_tab li:first-child { border-left:1px solid #dedede; }
.mymain_tab li:last-child { border-right:1px solid #dedede; }
.mymain_tab li a { font-size:16px; font-weight:600; color:#666666; }
.mymain_tab li a b { color:#2fa0ee; font-weight:600; }
.mymain_tab li a em { color:#ff4b5c; font-weight:600; font-style:normal; }


.mymain_info { width:100%; }
.mymain_info>dd { display:inline-block; width:378px; border:1px solid #dedede; }
.mymain_info .title { text-align:center; height:150px; padding-top:42px; border-bottom:1px solid #e6e6e6; }
.mymain_info .title p { font-size:24px; font-weight:600; color:#666666; padding-top:16px; }
.mymain_info .list { padding:15px 30px 15px 30px; background:#efefef;}
.mymain_info .list li { width:100%; font-size:14px; font-weight:600; color:#666666; line-height:38px; display:inline-block }
.mymain_info .list li a { font-size:14px; font-weight:normal; color:#888888; }
.mymain_info .list li a span { float:right; }
.mymain_info .list li a b { font-size:18px; font-weight:600; color:#2fa0ee; }
.mymain_info .red li a b { color:#e14948; }


.myPurchase_tab { width:100%; height:68px; border-top:1px solid #dedede;  border-bottom:1px solid #dedede; }
.myPurchase_tab li { float:left; width:19.94%; text-align:center; height:56px; font-size:16px; font-weight:600; color:#666666; line-height:24px; padding-top:12px;
                background: url(../image/common/bg_arrow_r.png) no-repeat #efefef right center; }
.myPurchase_tab li:first-child { border-left:1px solid #dedede; }
.myPurchase_tab li:last-child { background:#ffffff; border-right:1px solid #dedede; }
.myPurchase_tab li:nth-child(4) { background:#efefef; }
.myPurchase_tab li a { font-size:16px; font-weight:600; color:#2fa0ee; }
.myPurchase_tab li a b { color:#2fa0ee; font-weight:600; }
.myPurchase_tab li a em { color:#ff4b5c; font-weight:600; font-style:normal; }
.myPurchase_tab li p {color: #666666;}





</style>
</head>
<body>
  <%@ include file="../common/header.jsp" %>  
 
 <div id='A_Container_Wrap'>
 <div id='A_Container'>
<%@ include file = "../mypage/mypageleft.jsp" %> 
   
  <div id="A_Container_C">
<ul class="mymain_tab">

  <%int buy5 = dr.getSumbuy5();
     int sell5 = dr.getSumsell5();
     int bs5 = buy5+sell5;   %>
     
        <li><a href="#"><p>구매 중</p> <b><%=dr.getSumbuy() %></b> 건</a></li>
        <li><a href="/p/selectMyProduct"><p>판매 중</p> <b><%=dr.getSumsell() %></b> 건</a></li>
        <li><a href="#"><p>요청 중</p> <b><%= bs5 %></b> 건</a></li>
        <li><a href="#"><p>총수익금</p> <em><%=String.format("%,d", dr.getTotalprice()) %></em> 원</a></li>

    </ul>

    <div class="mymain_info">
      <dd class="f_left">
          <div class="title"><img src="../image/common/ico_cart.png"><p>구매 현황</p></div>
          <ul class="list">
                <li><a href="#">공유대기중 (입금전/입금확인중)   <span><b><%=dr.getSumbuy1() %></b> 건</span></a></li>
                <li><a href="#">공유진행중 (입금/결제완료)      <span><b><%=dr.getSumbuy2() %></b> 건</span></a></li>
                <li><a href="#">공유완료 (구매결정대기/발송중)    <span><b><%=dr.getSumbuy3() %></b> 건</span></a></li>
                <li><a href="#">거래완료 (구매결정완료)          <span><b><%=dr.getSumbuy4() %></b> 건</span></a></li>
                <li><a href="#">수정요청                   <span><b><%=dr.getSumbuy5() %></b> 건</span></a></li>
            </ul>
        </dd>
        <dd class="f_right">
          <div class="title"><img src="../image/common/ico_house.png"><p>판매 현황</p></div>
          <ul class="list red">
                <li><a href="#">공유대기중 (입금전/입금확인중)   <span><b><%=dr.getSumsell1() %></b> 건</span></a></li>
                <li><a href="#">공유진행중 (입금/결제완료)      <span><b><%=dr.getSumsell2() %></b> 건</span></a></li>
                <li><a href="#">공유완료 (구매결정대기/발송중)    <span><b><%=dr.getSumsell3() %></b> 건</span></a></li>
                <li><a href="#">거래완료 (구매결정완료)          <span><b><%=dr.getSumsell4() %></b> 건</span></a></li>
                <li><a href="#">수정요청                   <span><b><%=dr.getSumsell5() %></b> 건</span></a></li>
            </ul>
        </dd>
    </div>
   <!-- <div class="share"><a href="#" class="btn_joinS" onclick="popupOpen()">공유진행가이드</a></div> -->
   
   

</div>

<script>
$(function(){
   var com = <%=com %>
   if(com==1){
      alert("공유가 완료되었습니다 상대방의 완료를 기달려주세요.")
   }else if(com==2){
      alert("거래가 완료되었습니다 감사합니다!")
   }else if(com==3){
	   alert("수정요청 되었습니다")
   }else if(com==4){
	   alert("판매 취소 되었습니다")
   }else if(com==5){
	   alert("판매 취소 불가")
   }else if(com==6){
	   alert("구매 취소 되었습니다")
   }else if(com==7){
	   alert("구매  취소 불가")
   }
   
   
})
</script>





</div>
</div>

<br><br><br>
<%@ include file="../common/footer.jsp" %>

</body>
</html>