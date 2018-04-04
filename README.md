# jsp
기능

ajax 댓글

AJAX를 통해 아이디와 현재시간, 내용을 데이터베이스에 저장한다. 그리고 저장이 성공했다면, 저장된 아이디, 현재시간, 내용을 조회해서 댓글 영역 하단에 출력한다.

![ajax](https://user-images.githubusercontent.com/32535590/38298193-b331ae6e-3831-11e8-86cc-360783483e23.PNG)

아임포트 결제 api
아임포트 자바스크립트 라이브러리를 사용하면 손쉽게 PG사의 결제창을 이용할 수 있다. 
상품명, 상품가격 결제 승인번호 등의 파라미터가 데이터베이스로 저장되며, 결제가 성공하면 결제 완료 페이지로 리다이렉트 된다.

![api](https://user-images.githubusercontent.com/32535590/38298205-b8e0ddb2-3831-11e8-9905-443bfea29ae1.PNG)

회원가입 비밀번호 암호화
빈칸에 적힌 비밀번호는 가입하기 버튼을 눌렀을 때 서블릿을 통해 데이터베이스로 전송 된다.
이때 SHA512 암호화 메소드가 작동하여 암호화된 상태로 데이터베이스에 저장된다.

![1](https://user-images.githubusercontent.com/32535590/38298261-e2beed86-3831-11e8-90de-59d364b30f11.PNG)

![1 sha512](https://user-images.githubusercontent.com/32535590/38298290-f25395bc-3831-11e8-8705-a8ca41085a75.PNG)

회원가입 트랜잭션 처리 
![1-](https://user-images.githubusercontent.com/32535590/38298314-fab5443a-3831-11e8-907b-2ed84993da6e.PNG)

이메일 인증
그리고 관리자 이메일 주소와 비밀번호를 이용하여 미리 작성된 인증번호가 전송된다. 인증번호는 랜덤함수를 사용하여 매번 인증버튼을 누를 때마다 달라진다.

![2](https://user-images.githubusercontent.com/32535590/38298333-04194954-3832-11e8-9a38-4ed0319cfeef.PNG)

![2](https://user-images.githubusercontent.com/32535590/38298346-0c6d9164-3832-11e8-825d-2bd1bcb9a5d7.PNG)

![2](https://user-images.githubusercontent.com/32535590/38298355-1033af0e-3832-11e8-8e2f-7f4f8f0d558c.PNG)

![3](https://user-images.githubusercontent.com/32535590/38298360-143f2b64-3832-11e8-9ca7-b277d690aa0d.PNG)




