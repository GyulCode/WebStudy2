<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.dao.*"%>
    <jsp:useBean id="dao" class="com.sist.dao.DataBoardDAO"></jsp:useBean>
    
    <%
     String no= request.getParameter("no"); //삭제대상
     String bno= request.getParameter("bno"); //게시글 안에 댓글 번호?
     
     dao.replyDelete(Integer.parseInt(no));
     
     //이동
     response.sendRedirect("detail.jsp?no="+bno);
    		 
    		 
    
    %>
    
    
