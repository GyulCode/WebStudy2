<%@page import="com.sist.dao.FoodDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.sist.dao.*" %>
    <!-- 
    6월 26일 (월)
       293page DBCP -> DataBaseConnectionPool
       1. 연결/해제 반복
          -> 시간 소모가 많다!(오라클 연결시에 시간이 많이 소모된다)
          -> 이 소모를 줄이기 위해 사용
          미리 Connection객체를 생성해서 저장후에 사용한다.
          일반적으로 웹프로그램에서는 일반화
          Connection객체 생성을 제한
          사용후에는 재사용이 가능
       2. Connection을 미리 생성하기 때문에 -> Connection객체 관리가 쉽다.
       3. 쉽게 서버가 다운되지 않는다
       4. 라이브러리가 만들어져 잇다(common-dbcp, common-pool)
       
       Pool에 미리 생성된 connection을 저장시켜두고 요청이 올때마다 pool에서 나눠주고 다쓰면 반환받음
       
       280page
       목적 : 웹 사용자는 빠른 응답시간을 원한다
             DB 연결(효율적으로 데이터베이스 연동) -> Backend가 빠르다 -> frontend의 처리가 빨라지면됨
       DBCP
       방법 -> 1. Connection 객체 생성(maxActive:최대,maxIdle:풀)
             2. Pool영역에 저장
             3. 사용자가 요청시에 connection의 주소를 얻어온다
             4. 사용자 요청에 따라 수행
             5. 반드시 pool안에 connection객체를 반환
             -------------------------------------------------
             1. server.xml -> connection객세 생성
             2. 코딩 방법
                1) getConnection() : 미리 생성된 Connection 객체 얻기
                2) disConnection() : 반환
                3) 기능 -> 이전하고 동일 -> 보안이 좋다.
                
                톰캣 연결시 removeall 하면 다 날아가니까 메모장에 저장해둘것
                Servers -> 톰캣 -> server.xml
    
     -->
     <%
     // 1. 사용자가 전송한 데이터를 받는다(page)
     String strPage=request.getParameter("page");
     // 2. 실행과 동시에 페이지 전송이 불가능 -> 첫페이지는 default 설정(1)
     if(strPage==null){
    	 strPage="1";
     }
     // 3. 현제페이지 지정
     int curpage=Integer.parseInt(strPage);
     // 4. 현제페이지에 대한 데이터 읽기(DAO->오라클)
     FoodDAO dao=FoodDAO.newInstance();
     List<FoodBean> list=dao.foodListData(curpage);
     // 5. 총페이지 읽기
     int totalpage=dao.foodTotalPage();
     //6. 블록별 처리
     final int BLOCK=10;
     //1~10 11~20
     // 7.시작위치
     int starPage=((curpage-1)/BLOCK*BLOCK)+1;//1 11 21
     // 8.끝위치
     int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;//10 20 30
     
     
     
      
      %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.container{
 margin-top:50px;
}
.row{
  margin:0px auto;
  width:960px;
}
</style>
</head>
<body>
<div class=container>
  <div class=row>
    <%
       for(FoodBean vo:list){
	%>  
	<div class="col-md-3">
    <div class="thumbnail">
      <a href="/w3images/lights.jpg">
        <img src="<%=vo.getPoster() %>"  style="width:100%">
        <div class="caption">
          <p><%=vo.getName()%></p>
        </div>
      </a>
    </div>
    </div>
	<%
       }
    %>
  </div>
</div>

</body>
</html>