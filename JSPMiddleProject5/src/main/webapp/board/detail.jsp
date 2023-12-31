<%@page import="com.sist.dao.ReplyBoardVO"%>
<%@page import="com.sist.dao.ReplyBoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <jsp:useBean id='dao' class='com.sist.dao.ReplyBoardDAO'/>
   <%
   //setProperty는 값이 많을때 한두개는 request사용
   String no=request.getParameter("no");
   ReplyBoardVO vo=dao.boardDetailData(Integer.parseInt(no));
   
   request.setAttribute("vo", vo); //EL 사용할려고 사용
   
   /*
   list.jsp
     -> 새글 -> insert.jsp -> insert_ok.jsp -> list.jsp
     -> 상세보기
   detail.jsp
     -> 답변 -> reply.jsp -> reply_ok.jsp -> list
     -> 수정 -> update.jsp -> reply_ok.jsp -> list
     -> 삭제 -> delet.jsp -> reply_ok.jsp -> list
     -> 목록 -> reply.jsp -> reply_ok.jsp -> list
   */
   
   %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.container{
   margin-top: 50px;
}
.row {
  margin: 0px auto;
  width:800px;
}
</style>
</head>
<body>
  <div class="container">
    <div class="row">
     <div class="text-center">
       <img src="image/qna.jpg" style="width:550px;height: 100px" class="img-rounded">
     </div>
    </div>
    <div style="height: 20px"></div>
    <div class="row">
      <table class="table">
        <tr>
          <th width=20% class="text-center danger">번호</th>
          <td width=30% class="text-center">${vo.no }</td>
          <th width=20% class="text-center danger">작성일</th>
          <td width=30% class="text-center">${vo.regdate }</td>
        </tr>
        <tr>
          <th width=20% class="text-center danger">이름</th>
          <td width=30% class="text-center">${vo.name }</td>
          <th width=20% class="text-center danger">조회수</th>
          <td width=30% class="text-center">${vo.hit }</td>
        </tr>
        <tr>
          <th width=20% class="text-center danger">제목</th>
          <td colspan="3">${vo.subject }</td>
        </tr>
        <tr>
          <td colspan="4" class="text-left" valign="top" height="200">
           <pre style="white-space: pre-wrap;border: none;background-color: white">${vo.content }</pre>
          </td>
        </tr>
        <tr>
          <td colspan="4" class="text-right">
            <a href="reply.jsp?pno=${vo.no }" class="btn btn-xs btn-warning">답변</a>
            <a href="update.jsp?no=${vo.no }" class="btn btn-xs btn-info">수정</a>
            <a href="delete.jsp?no=${vo.no }" class="btn btn-xs btn-info">삭제</a>
            <a href="list.jsp" class="btn btn-xs btn-danger">목록</a>
          </td>
        </tr>
      </table>
    </div>
  </div>
</body>
</html>