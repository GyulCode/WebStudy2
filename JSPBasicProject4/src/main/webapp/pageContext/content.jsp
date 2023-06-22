<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
 String id=request.getParameter("id");
  if(id==null)
	  id="admin";
%>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<center>
  <h1>Content.jsp</h1>
  <h1><%=id %></h1>
</center>
</body>
</html>