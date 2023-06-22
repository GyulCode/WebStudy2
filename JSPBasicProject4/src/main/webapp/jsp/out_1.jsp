<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" buffer="16kb"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 버퍼크기 : <%= out.getBufferSize() %><br>
 남아 있는 버퍼 크기: <%= out.getRemaining() %><br> <!-- 뭔가 잘못 알려주신듯 남아 있는 버퍼의 크기 중 사용 가능한 비율을 알려준다 -->
 사용 중인 크기 : <%= out.getBufferSize()-out.getRemaining() %><br>

</body>
</html>