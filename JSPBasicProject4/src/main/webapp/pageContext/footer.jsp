<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
     String pwd=request.getParameter("pwd");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<center>
  <h1>Footer.jsp</h1>
  <h1><%= pwd%></h1>
</center>
</body>
</html>