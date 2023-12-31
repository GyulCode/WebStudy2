<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.dao.*"%>
<%--
   6.22(목)
    page177
	//integer.tostring -> null값이 예외처리가 될수 있다.
	//Integer.toString() 은 주어진 Integer 객체가 null 인 경우 NullPointerException 을 던질 수 있습니다 .
	//string.valueof(내부적으로 Integer.toString() 메서드를 사용한다. )
	//String.valueOf() 는 String.valueOf(Object obj) 메서드 로 이동하여 null 을 반환 하기 때문에 예외를 throw하지 않습니다.
	//https://recordsoflife.tistory.com/997
   
   JSP
   1) 지시자 : page / include / taglib
      page지시자 : JSP파일에 대한 정보
      1. contentType : 브라우저에 실행하는 타입
                       html : text/html
                       xml : text/xml
                       json : text/plain(***) 여기가 핵심
                       ------------------------------
                       Ajax / Vue / React
                       ---------------------RestFul
                       
      2. import : 여러번 사용이 가능, 라아브러리 읽기
      3. errorPage : 에러시에 에러 출력 화면으로 이동
      4. buffer : html 태그를 저장하는 공간
                  소스미리보기
                  -> 사용자마다 한개만 생성해준다(브라우저가 연결해서 읽어옴)
   2) 스크립트 : 자바/HTML을 분리해서 소스코딩
      스크립트 자체는 자바언어의 코딩위치임(벗어나면 일반 텍스트 -> html??)
      <%! %> : 선언문(멤버변수,메소드선언) : 자바 클래스를 만들어서 메소드를 호출 -> 사용빈도가 없다
      <% %> : 일반 메소드 영역
              _jspService()
              {
                 JSP에 첨부하는 소스
              }
      <%= %> : 화면 출력(변수, 문자열) -> out.println(<%= %>)
      -----out과 같은 역할
   3) 내장객체 : 미리 객체를 생성해서 필요한 위치에서 사용이 가능
      request : HttpServletRequest
                사용자 정보(요청정보, 추가정보, 브라우저 정보)
                = 요청 정보
                * getParameter() : 사용자 전송한 데이터를 한개만 받는다
                -> 문자열 : String
                * getPararmeterValues() : 여러개를 동시에 받을 경우
                -> String[] : 체크박스 select의 멀티
                * setCharacterEncoding() : 디코딩
                -> post에서만 사용
                   get은 자동화 처리 -> win10이상
                   ------------- server.xml(한글처리, 포트)
                   8080은 프록시 서버
              = 추가정보(MVC,MV) -> 오라클에서 받은 값을 추가 -> JSP
                *setAttribute() : 기존에 있는 request값에 출력에 필요한 데이터를 추가해서 전송
                *getAttribute() : 추가해서 보낸 데이터를 받을 경우에 사용
                -------------- session에도 있다
              = 브라우저 정보
                getRemoteAddr() : 접속자의 IP
                getRequestURL(), getRequestURI(), getContextPath()
                
      response : 응답 정보, 화면 이동정보 -> httpServletResponse
                 ------
                 = setContextType() -> Html,XML
                   -> page 지시자
                 = addCookie() : 쿠키전송
                 ------------- 한번만 수행할 수 있다.
                 화면 이동 정보
                    필요시 서버에서 화면을 요청화면이 아닌 다른 화면으로 이동
                    login = main
                    insert -> list
                    delete -> list
                    update -> datail
                 -> sendRedirect() -> get방식, request를 초기화한 다음 이동
                 Header 정보 : 실제 데이터 전송 전에 처리
                 setHeader() -> 한글 변환 / 다운로드시에 파일명, 크기 -> 다운로드창을 보여준다.
      out : JspWriter(출력 버퍼 관리)
            출력 (메모리)
            println() <%= %>
            
            메모리 확인
             getBufferSize() : 총버퍼 크기
             getRemaining() : 사용중인 버퍼 크기
             ---둘이 빼면 남은버퍼
      session
      application
      pageContext
      ----------------------------아래로는 잘 안씀
      config : web.xml처리(환경설정)
      exception try~catch
      page : this
      
      
      
        
 --%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- out 출력(복잡한 HTML구조) print -->
<%
EmpDAO dao = new EmpDAO();
List<EmpVO> list=dao.empListData();

  out.print("<!DOCTYPE html>");
  out.print("<html>");
  out.print("<head>");
  out.print("<meta charset=\"UTF-8\">");
  out.print("<title>Insert title here</title>");
  out.print("<link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css\">");
  out.print("<style>");
  out.print(".container{margin-top:50px}");
  out.print(".row{margin:0px auto; width:800px}");
  out.print(".h1{text-align:center}");
  out.print("</style>");
  out.print("</head>");
  out.print("<body>");
  out.print("<div class=container>");
  
  out.print("<h1>사원목록</h1>");
  out.print("<div class=row>");
  out.print("<table class=\"table table-striped\">");
  out.print("<tr class=success>");
  out.print("<th class=text-center>사번</th>");
  out.print("<th class=text-center>이름</th>");
  out.print("<th class=text-center>직위</th>");
  out.print("<th class=text-center>입사일</th>");
  out.print("<th class=text-center>급여</th>");
  out.print("<th class=text-center>성과급</th>");
  out.print("<th class=text-center>부서명</th>");
  out.print("<th class=text-center>근무지</th>");
  out.print("<th class=text-center>호봉</th>");
  out.print("</tr>");
  for(EmpVO vo:list) {
	  out.print("<tr>");
      out.print("<td class=text-center>"+vo.getEmpno()+"</td>");
      out.print("<td class=text-center><a href=\"EmpDetailServlet?empno="+vo.getEmpno()+"\">"+vo.getEname()+"</td>");
      out.print("<td class=text-center>"+vo.getJob()+"</td>");
      out.print("<td class=text-center>"+vo.getDbday()+"</td>");
      out.print("<td class=text-center>"+vo.getDbsal()+"</td>");
      out.print("<td class=text-center>"+vo.getComm()+"</td>");
      out.print("<td class=text-center>"+vo.getDvo().getDname()+"</td>");
      out.print("<td class=text-center>"+vo.getDvo().getLoc()+"</td>");
      out.print("<td class=text-center>"+vo.getSvo().getGrade()+"</td>");
      out.print("</tr>");
  }
  
  out.print("</table>");
  out.print("</div>");
  out.print("</div>");
  out.print("</body>");
  out.print("</html>");

%>

</body>
</html>