<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
 application : ServletContext
 -> 서버관리 ( 서버에 대한 정보, 로그인 정보, 자원관리)
    -> 서버 버전 : servlet에 대한 버전을 나타낸다.
       1. 서버애름 : getServerInfo() : 톰캣
       2. getMajorVersion()
       3. getMinorVersion()
          17.01 -> 17이 메이저  01은 마이너
       4. 로그 -> log 
       5. 자원관리 : getRealPath()

--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
서버이름 : <%=application.getServerInfo() %><br>
메인 버전 : <%=application.getMajorVersion() %><br>
마이너 버전 : <%=application.getMinorVersion() %><br>
MINE : <%=application.getMimeType("applicaiton_1.jsp") %>

</body>
</html>