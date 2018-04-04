<h1>팀프로젝트</h1>

프로젝트명: 오늘의 동료

<h2>개발기간</h2>

3.4 ~ 3.20

<h2>개발 목표</h2>

JSP, 서블릿을 이용하여 재능을 판매하고 구매할 수 있는 쇼핑몰 개발
 
<h2>개발 환경</h2>

운영체제- Window8

사용 언어- Java, Javascript, Html, css

라이브러리, 프레임워크- Jquery, Bootstrap

IDE- 이클립스


<h2>DB설계</h2>

![1](https://user-images.githubusercontent.com/32535590/38300341-7d5216ca-3837-11e8-8e05-c15ccfef4e13.png)


<h2>구현기능</h2>

<h2>ajax 댓글</h2>

addReply아이디가 클릭되면 사용자를 구분할 수 있는 p_code와 content(댓글내용)을 insertReply.do로 ajax통신을 이용해 전송
아이디와 현재시간, 내용을 데이터베이스에서 조회해옴.
조회가 성공했다면 저장된 아이디, 현재시간, 내용을 조회해서 댓글 영역 하단에 출력한다.

![ajax](https://user-images.githubusercontent.com/32535590/38298193-b331ae6e-3831-11e8-86cc-360783483e23.PNG)


<h2>아임포트 결제 api</h2>

아임포트 자바스크립트 라이브러리를 사용하면 손쉽게 PG사의 결제창을 이용할 수 있다. 
상품명, 상품가격 결제 승인번호 등의 파라미터가 데이터베이스로 저장되며, 결제가 성공하면 결제 완료 페이지로 리다이렉트 된다.

![api](https://user-images.githubusercontent.com/32535590/38298205-b8e0ddb2-3831-11e8-9905-443bfea29ae1.PNG)

<h2>회원가입 비밀번호 암호화</h2>

SHA암호화 방식 이란?
복호화가 불가능한 암호화 방식
그 중 대표적인 것이 SHA 암호화이다

빈칸에 적힌 비밀번호는 가입하기 버튼을 눌렀을 때 서블릿을 통해 데이터베이스로 전송 된다.

이때 SHA512 암호화 메소드가 작동하여 암호화된 상태로 데이터베이스에 저장된다.

![1](https://user-images.githubusercontent.com/32535590/38298261-e2beed86-3831-11e8-90de-59d364b30f11.PNG)

![1 sha512](https://user-images.githubusercontent.com/32535590/38298290-f25395bc-3831-11e8-8705-a8ca41085a75.PNG)


<h2>이메일 인증</h2>

이메일인증은 다음과 같은 순서로 작동한다

사용자A 메일 프로그램-메일 데몬-메일서버- TCP/IP -메일서버-메일데몬-사용자B 메일프로그램

이메일 인증의 경우 javax.mail.jar 파일을 이용해서한다

![2](https://user-images.githubusercontent.com/32535590/38298333-04194954-3832-11e8-9a38-4ed0319cfeef.PNG)
메일세션을 생성하고 빈 메시지를 만든다
관리자 이메일 주소와 비밀번호를 이용하여 미리 작성된 인증번호가 전송된다. 

![2](https://user-images.githubusercontent.com/32535590/38298346-0c6d9164-3832-11e8-825d-2bd1bcb9a5d7.PNG)

![2](https://user-images.githubusercontent.com/32535590/38298355-1033af0e-3832-11e8-8e2f-7f4f8f0d558c.PNG)


인증번호는 랜덤함수를 사용하여 매번 인증버튼을 누를 때마다 달라진다.
![3](https://user-images.githubusercontent.com/32535590/38298360-143f2b64-3832-11e8-9ca7-b277d690aa0d.PNG)


<h2>개선사항</h2>

1 코드 리팩토링

2 인터페이스 사용하여 클래스간 의존성 낮추기

3 테스트 코드 추가



