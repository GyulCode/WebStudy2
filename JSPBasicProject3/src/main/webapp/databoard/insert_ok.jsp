<%@page import="java.io.File"%>
<%@page import="com.sist.vo.DataBoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.dao.*"%>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
    
<%
  //ok.jsp : 기능처리 (member_ok, update_ok) : 처리하고 이동만 하는 jsp 출력은 없음
  //데이터베이스 처리 -> list.jsp
  //1.한글 처리
  request.setCharacterEncoding("UTF-8");
  
  //1-1.파일업로드 클래스 생성
  String path="c:\\download";
  int size=1024*1024*100;
  String enctype="UTF-8";
  
  MultipartRequest mr=new MultipartRequest(request,path,size,enctype,
		  new DefaultFileRenamePolicy());//new defaultFileRenamePolicy() 파일 중복시 rename으로 설정
  //변수명 mr 데이터 요청
  
  //2.요청데이터 받기
  String name=mr.getParameter("name");
  String subject=mr.getParameter("subject");
  String content=mr.getParameter("content");
  String pwd=mr.getParameter("pwd");
  
  //3.vo에 묶기
  DataBoardVO vo=new DataBoardVO();
  vo.setName(name);
  vo.setSubject(subject);
  vo.setContent(content);
  vo.setPwd(pwd);
  //-> setProperty
  
  //String filename=mr.getOriginalFileName("upload");
  String filename=mr.getFilesystemName("upload"); //파일이 중복명ㅇ으로 저장시 원본을 삭제하니 직접 접근해서 삭제하겠다!
  if(filename==null){//업로드가 안된상태 
	  vo.setFilename("");
      vo.setFilesize(0);
  }else{
	  File file=new File(path+"\\"+filename);
	  vo.setFilename(filename);
	  vo.setFilesize((int)file.length());
  }
  
  
  //4.DAO전송
  DataBoardDAO dao=DataBoardDAO.newInstance();
  dao.databoardInsert(vo);
  //-> useBean
  
  //5.화면이동(list.jsp)
  response.sendRedirect("list.jsp");
  
%>

