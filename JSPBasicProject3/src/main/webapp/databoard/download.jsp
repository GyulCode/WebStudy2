<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.io.*,java.net.*,com.sist.dao.*"%>
    
    <%
		 
		/*
	     %E%EDF -> 디코딩
	     Post : setCharacterEncoding("UTF-8")
	     Get : winodw10은 자동 처리
	     */
	     String fn=request.getParameter("fn");
	     //System.out.println(fn); //한글 디코딩 확인
		
		try{
			File file=new File("c:\\download\\"+fn);
			response.setHeader("Content-Disposition","attachment;filename="+URLEncoder.encode(fn,"UTF-8"));
			response.setContentLength((int)file.length());
			BufferedInputStream bis= new BufferedInputStream(new FileInputStream(file));
			BufferedOutputStream bos= new BufferedOutputStream(response.getOutputStream());
	    			 
	    	 int i=0;
	    	 byte[] buffer=new byte[1024];
	    	 while((i=bis.read(buffer,0,1024))!=-1){
	    		 bos.write(buffer, 0, i);
	    	 }
	    	 bis.close();
	    	 bos.close();
	    	 out.clear();
	    	 out=pageContext.pushBody();
	    	 
	    	 
	     } catch(Exception ex){
	    	 ex.printStackTrace();
	     }
		
    %>
