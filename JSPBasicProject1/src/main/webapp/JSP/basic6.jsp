<%--
   import -> 라이브러리
   <%@ page 속성=값...%> -> 속성마다 1번만 사용이 가능
   page import = "java.util.* , java.io.* ";
   
    
 --%>

<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import ="java.util.*, java.text.* "%>
<%@ page import="com.sist.*" %>

<%
   Date date=new Date();
   SimpleDateFormat sdf=new SimpleDateFormat("yyy-MM-dd");
   String today=sdf.format(date);
   
   MainClass m= new MainClass();
   String msg=m.display();

%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
오늘 날짜는 : <%= today %>
<h1><%= msg %></h1>
<h1>총버퍼 : <%= out.getBufferSize() %></h1>
<h1> 남아있는 버퍼 : <%= out.getRemaining() %></h1>
<h1>사용중 : <%= out.getBufferSize() - out.getRemaining()%></h1>

</body>
</html>