<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.oreilly.servlet.*"%>
    <%@ page import="com.oreilly.servlet.multipart.*" %>
    <%
      request.setCharacterEncoding("UTF-8");
      
      //image전까지의 경로 = RealPath
      String path=application.getRealPath("/image");
      
      int max=1024*1024*100;
      String enctype="UTF-8";
      MultipartRequest mr= new MultipartRequest(request,path,max,enctype,new DefaultFileRenamePolicy());
    
      String name=mr.getOriginalFileName("upload");
      
      //이동
      response.sendRedirect("list.jsp?fn="+name);
    %>
