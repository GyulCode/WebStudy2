<%@page import="java.util.StringTokenizer"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%--
6.28(수)
EL(Expression language)
<%= %> 대체하기 위해 사용한다 -> 가급적 자바코딩을 제거하기위해 사용한다.

형식)
${출력물} 이런형식으로 사용하는데 -> view(태그형으로 프로그램 제작) 

표현식)
연산자
	1.산술
	   + : 순수 덧셈만 제공 문자열 덧셈은 += 사용해야 한다.
	   numll : 연산시 0으로 취급한다.
	   "1" : 문자 연산시 자동으로 integer형으로 변환되어 연산된다.
	   / : 연산시 정수/정수 => 실수 항상 실.수.를 리턴한다.
	2.비교
	   == (eq) : ${10 eq 10} => ${10 == 10}
	   != (ne)
	   <  (lt)
	   >  (gt)
	   <= (le)
	   >= (ge)
	   날짜, 문자열을 포함한다.
	3.논리
	   && (and) : 예약 가능 날짜 확인 등에 사용
	   || (or) : 예약 불가능 날짜 확인 등에 사용
	4.삼항
	   페이지, select, radio ... 등에 사용된다.
	   ${조건 ? "true일경우" : "false일경우"}
	   ${sex == '남자'?"checked":""}
   
내장객체
	일반 JSP -> 자바/HTML 분리
	자바/HTML 분리 : 모든처리는 자바가 하고 결과값만 출력한다. 분리시 전송되는 java소스는 컴파일되어 .java만 전송된다 (보안성이 향상됨)
	JSP : 자바,html이 혼합되어 있다.
	requestScope
	   기존의 request + 추가 데이터 설정 (자바에서DAO에서 값을 받아서 jsp가 처리 이걸 이제분리 시킴 -> MVC구조 )->
	      1. requset.setAttribute("key",값) : 오라클에서 얻은 값을 추가
	      2. requset.getAttribute("key") :
	         -> ${requestScope.key} -> ${key}
	session.Scope         
	         session.Scope -> session에 저장된 값을 읽기
	         -> ${sessionScope.key} -> ${key}
	         우선순위는 request 보다 session이 높다.******
	param : 
	paramValues : ${paramValues.key} -> request.getparamter
	
	자바의 일반변수는 사용이안됨
		string name="내용"
		${name} -> 출력이 안됨
	
	request.setAttribute("name","값") -> ${name}
	session.setAttribute("name","값") -> ${name}
	si/sm	   sm/sol


제어문
	뭐있음
	core : 제어문, URL관련, 변수설정(request.setAttribute())
	조건문
	  <c:if test="조건식">
	     true일 경우 처리
	  </c:if>
		-> 다중 조건문, if~else가 없다.
		-> 자바
		   if(조건식)
		   {
		     위에 jstl과 같은 내용임 컴파일되면 이렇게 된다~
		   }
	선택문
	   <c:choose>
	     <c:when test="키값">처리문장</c:when>
	     <c:when test="키값">처리문장</c:when>
	     <c:when test="">처리문장</c:when>
	   </c:choose>
	   -> switch, 다중 if와 동일
	반복문
	   <c:forEach> -> for문
	   <c:forEach var="i" begin="0" end="10" step="1"> 이문장은
	   for(int i=0; i<=10; i++)과 동일하다 유의점은 end가 10을 포함한다는 것이다!!!
	   단점
	   --스텝이 없다
	   for(int i=10; i>=0; i--)이게 forEach에는 없다 감소스텝이 없음
	   
	   ***향상된 for문 : for-each***
	      for(BoardVO vo:list)
	      -> <c:forEach var="vo" items="list">(가장 많이 사용)
	   ******                       
	      
	   URL : 화면 이동
	   ------------
	   response.sedRedirect(url)
	   -> <c:redirect url="url">
	   request.setAttribute("a",값)
	   -> <c:set var="a" value="값">
	   out.println()
	   -> <c:out value="">
	   자바스크립트에서 자바데이터를 받아서 출력
	   jquery -> $() ${}
	   
	   </c:forTokens> -> stringTokenizer
	   
	   fmt : 변환(날짜 변환, 숫자변환 : DecimalFormat)
	             --  --
	             simpleDataFormat <fmt:formatNumber value="" pattern="999,9999">
	             <fmt:formatDate value="" patter="yyyy-MM-dd">
	             
	   fn : string메소드 처리 -> string이 갖고 있는 모든 메소드를 처리할 수 있다.
	        ${fn:length(문자열)}
	        ${fn:substring(문자열,start,end)}
	   sql : DAO
	   xml : OXM
	         -> 자바 자체에서 처리(사용 빈도가 거의 없다)

 --%>
 
<%-- import --%>
<%-- 제어문, URL, 변수선언 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- format --%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%-- function: fn --%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%--
	prefix 는 사용자가 지정할수 있다.
	prefix = "c"
	
	<c:~>
	
	prefix="core"
	<core:~> 
 --%>
 
<%
//데이터 설정 -> 오라클
List<String> names=new ArrayList<String>();
names.add("홍길동");
names.add("심청이");
names.add("이순신");
names.add("박문수");
names.add("강감찬");
//EL은 사용할 수 없다 (EL ${} => request,session에 저장을 해야 사용이 가능)
request.setAttribute("names", names);


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <h1>자바를 이용한 for문</h1>
  <h3>이름 목록</h3>
  <ul>
  <%
    for(String name:names){ //names는 js안에 선언된 arraylist 배열이다.
  %>
     <li><%=name %></li>
  <%
    }
  %>
  </ul>
  
  <h3>JSTL 출력</h3>
  <ul>
   <%-- 여기 names는array가 아니라 request의 setAttribute 꺼임 --%><!-- html주석  -->
     <c:forEach var="name" items="${names }">
        <li>${name }</li>
     </c:forEach>
  </ul>
 <!-- -------------------------------------------------------------------- --> 
  <h3>자바 StringTokenizer</h3>
  <ul>
     <%
       String color="red,blue,green,yellow,black";
       StringTokenizer st = new StringTokenizer(color,",");
       while(st.hasMoreTokens()){
     %>
        <li><%=st.nextToken() %></li>
     <%
       }
     %>
  </ul>
  
  <h3>JSTL (forTokens)</h3>
  <ul>
  <c:forTokens var="color" items="red,blue,green,yellow,black" delims=",">
     <li>${color }</li>
  </c:forTokens>
  </ul>

</body>
</html>