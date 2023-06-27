<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>switch(자바)</h1>

<%
int i=3;
switch(i){
case 0:
	%>
	0번
	<%
	break;
case 1:
	%>
	1번
	<%
	break;
case 2:
	%>
	2번
	<%
	break;
case 3:
	%>
	3번
	<%
	break;
}
%>

<h1>JSTL(choose))</h1>
<c:set var="i" value="4">
<c:choose>
  <c:when test="${i==0 }">1번</c:when>
  <c:when test="${i==1 }">2번</c:when>
  <c:when test="${i==2 }">3번</c:when>
  <c:when test="${i==3 }">4번</c:when>
</c:choose>
</c:set>





</body>
</html>