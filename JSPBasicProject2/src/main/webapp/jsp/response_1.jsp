<%@page import="java.lang.ProcessBuilder.Redirect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
  //response.sendRedirect("response_2.jsp"); //바로 2로 가서 request가 새거라 사라짐
  // 파일명이 바뀌기 때문인데 이걸 안바뀌게 하고 옮길수 있음
  
  RequestDispatcher rd=request.getRequestDispatcher("response_2.jsp");
  rd.forward(request,response); //request를 안 잊고 옮기는 방법
  //response_1.jsp?id=admin&pwd=1234 url을 보면 이런데 response2를 1로 불러옴 -> forward기법 아에 새로 만들면 sendredirect
  System.out.println(request);
%>
<%
      String id=request.getParameter("id");
      String pwd=request.getParameter("pwd");
      System.out.println(request);
    %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
ID:<%= id %><br>
PWD:<%= pwd %>
</body>
</html>