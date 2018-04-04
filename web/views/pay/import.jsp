<%@page import="com.kh.tc.product.model.vo.Pay"%>
 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <% Pay p =(Pay)request.getAttribute("pay"); %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
 
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>


<script>
var msg ="";
var IMP = window.IMP; // 생략가능
IMP.init('iamport'); 
 
IMP.request_pay({
    pg : 'inicis', // version 1.1.0부터 지원.
    pay_method : '<%= p.getHowtopay() %> ',  
    merchant_uid : 'merchant_' + new Date().getTime(), // 가맹점 고유 주문번호 = 2 승인코드
    name : '<%= p.getP_name() %>', 
    amount : '10'
    
  
}, function(rsp) {
	
    if ( rsp.success ) {   
    	pay.setTotal_price(totalPrice);
    	  msg = "결제완료";   
 
    } else {
       msg = '결제에 실패하였습니다.';
        msg += '에러내용 : ' + rsp.error_msg;
    }
    alert(msg);
});

</script>
</head>
 
 
 
 <body>
 
</body>
</html>