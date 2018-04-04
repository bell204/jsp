<%@page import="com.kh.tc.product.model.vo.Advertise"%>
 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <% Advertise ad =(Advertise)request.getAttribute("ad"); %>

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
    pay_method : '카드 결제',  
    merchant_uid : 'merchant_' + new Date().getTime(), // 가맹점 고유 주문번호 = 2 승인코드
    name : '<%= ad.getP_name() %>', 
    amount : '10'
   
  //  buyer_email : 'iamport@siot.do',
  //  buyer_name : '구매자이름',
  //  buyer_tel : '010-1234-5678',
  //  buyer_addr : '서울특별시 강남구 삼성동',
  //  buyer_postcode : '123-456',
  
}, function(rsp) {
   
    if ( rsp.success ) {
       console.log(rsp.paid_amount);
       location.href="/p/adApply?p_code=<%=ad.getP_code()%>&ad_time=<%= ad.getAd_time() %>&ad_price=<%= ad.getAd_price() %>&p_name=<%= ad.getP_name() %>&odongcash=<%= ad.getOdongcash() %>&total_price=<%= ad.getTotal_price() %>&ad_code=<%= ad.getAd_code() %>&acCode="+rsp.merchant_uid;
    
     
         msg = "결제완료";   
 
    } else {
       msg = '결제에 실패하였습니다.';
        msg += '에러내용 : ' + rsp.error_msg;
    }
    
 //   $.ajax({
//        url:"/p/insertPay.do",
//        
//        data:{acCode:rsp.merchant_uid, 
//           pName:rsp.name, 
//           pPrice:rsp.paid_amount, 
//           howtopay:rsp.pay_method,
//           <!-- pCount: '  p.getP_count() --%>',
//           <!-- p_code: ' p.getP_code() --%>'
//           },
 
  
//        type:"post",
//        success:function(data){
           
//        },
//       error:function(msg){
//            alert(msg);
//         }
//});
    alert(msg);
});

</script>
</head>
 
 
 
 <body>
 
</body>
</html>