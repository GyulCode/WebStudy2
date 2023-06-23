<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!--  -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css2?family=Diphylleia&family=Noto+Sans+KR:wght@400;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.container{
  margin-top: 50px;
}
.row{
margin: 0px auto;
width:900px;
}
h1{
text-align:center
}
</style>
</head>
<body>
<h1>HttpSession(session:177page)</h1>
<table>
  <tr>
    <td width=20% class="text-center">클래스명</td>
    <td width=80% class="text-center">HttpSession(request로 생성이 가능 : request.getsession())</td>
      <br>
      <sub>request: session/cookie </sub>
  </tr>
  <tr>
    <td width=20% class="text-center">주요기능</td>
    <td width=80% class="text-center">
      <ul>
        <li> 서버에서 클라이언트의 정보 저장</li>
        <li> 저장된 정보를 지속적으로 관리</li>
        <li> 전역변수로 사용기 가능(모든 JSP에서 사용이 가능)</li>
        <li> 사용처:예약, 장바구니, 구매 ..</li>
      </ul>
    </td>
  </tr>
  <tr>
    <td width=20% class="text-center">주요메소드</td>
    <td width=80% >
      <ul>
        <li>***저장:setAttribute(String key, Object obj)</li>
        <li>***저장 데이터 읽기 : Object getAttribute(String key) : 사용시 형변환</li>
        <li>***저장 데이터 해제 : invalidate</li>
        <li>***일부 데이터 삭제 : removeAttribute(String key)</li>
        <li>저장 기간 설정 : setMaxinactiveInterval(int time):1/1000->default</li>
        <li>저장되는 기간 : 30분</li>
        <li>생성여부를 확인 : isNew()</li>
        <li>클라이언트당 1개의 session 공간 : getId():websocket</li>
        <li>해당 세션이 생성ㅇ된 시간 : getCreadtTime()</li>
        
      </ul>
    </td>
  </tr>
</table>
</body>
</html>