<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 
   out.print() 이거랑 <%= %> 이거는같음
   

 --%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
   for(int i=1;i<=10;i++){
	   if(i%2==0){
		   out.println(i+"&nbsp;");// 굳이 태그 안닫고 이렇게 쓰는것도 있음
	   }
			   
   }
%>

</body>
</html>