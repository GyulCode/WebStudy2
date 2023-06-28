<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
String name="홍길동";
//request에 저장(데이터 추가) name이라는 키값에 name이 갖고 있는 데이터 "홍길동"저장
//request.setAttribute("name", name);

%>
<%--EL에서 출력이 가능하게 변수를 설정한다. --%>
<c:set var="name" value="심청이"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <h1>자바에서 출력</h1>
  이름1 :<%=name %>
  이름2 :<%=request.getAttribute(name) %> 
  <h1>EL</h1>
  이름3 : ${name } <%-- request.setAttribute("name", name); 둘이 동일함--%>
  <br>
  <%-- jquery와 충돌 방지 --%>
       출력 -> $
       VueJS =>{{}}
       React =>{}
  이름4 : <c:out value="${name }"/><br>
  이름5 : <c:out value="<%=name %>"/><br>
  <%-- 자바스크립트에서 JSTL 사용이 가능
       JS와 Java는 엄연히 다름 array같은 요소는 JS에서 처리가 불가능하다
       그래서 JSON을 필요로 한다.
  --%>
  
  
  
</body>
</html>










