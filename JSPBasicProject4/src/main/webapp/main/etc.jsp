<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>config,Exception,page // etc</h1>
<table class=table>
  <tr>
   <th width=20% class="text-center">클래스명</th>
   <td width=80% >ServletConfig,Exception, Object</td>
  </tr>
  <tr>
   <th width=20% class="text-center">주요기능</th>
   <td width=80% >
     <ul>
       <li>config:서블릿에서 주로 사용(web.xml의 데이터를 읽을 수 있다.)-> MVC에서 주로 사용</li>
       <li>Exception: 예외처리 관리 -> try~catch : 사용시에는 page지시자 - >isErrorpage등록 = true로 해둬야 함</li>
       <li>page -> this(자신의 객체 -> Object))</li>
     </ul>
   </td>
  </tr>
  
</table>
</body>
</html>