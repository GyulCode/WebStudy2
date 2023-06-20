<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%--
     JSP
     1. 동작순서
        1) client 요청(주소창을 이용해서 서버에 연결)
        http://localhost:8080 / JSPBasicProject2/jsp/request.jsp
        ----   -------------     -------------
                                  ContextPath
                ServerIP port
        프로토콜
        --------------------- + ------------------------------  둘이 합치면 = URL
               서버관련                     클라이언트 요청 관련 요부분 하나만은 (URI)
        2) DNS를 거쳐서 -> localhost(도메인) -> ip변경 197.182.255.33
        3) ip/port를 이용해서 서버에 연결
           new Socket(ip,port) -> TCP
           ---------------------------------연결
        4) Web Server
           http
           = HTML, XML, CSS, JSON -> Web Server 자체에서 처리후에 브라우저로 전송 
           = JSP/Servlet은 처리하지 못한다
             -----------------------그래서 이걸 아래의 웹 컨테이너에 전달해주고 was에서 처리
             Web Container(Was) -> java로 변경 -> 컴파일 -> 실행 -> 결과를 메모리에 저장
        5) 메모리에 저장한 내용을 브라우저로 응답
        
        JSP(java sever page) : 서버에서 실행되는 자바파일
           _sjpInit() -> web.xml 초기화
           _jspServlet() -> 사용자 요청을 처리하고 결과값을 html로 전송
           _jspDestroy() -> 새로고침 , 화면이동...메모리에서 해제시키는 역할
           public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
           {
                final javax.servlet.jsp.PageContext pageContext;
			    javax.servlet.http.HttpSession session = null;
			    final javax.servlet.ServletContext application;
			    final javax.servlet.ServletConfig config;
			    javax.servlet.jsp.JspWriter out = null;
			    final java.lang.Object page = this;
			    javax.servlet.jsp.JspWriter _jspx_out = null;
			    javax.servlet.jsp.PageContext _jspx_page_context = null;
			    -------------------------------------------------------- => 내장객체
			    
			    소스코딩 영역
			    -> JSP
           
           }
               
     2. 지시자
        page 형식) <%@ page 속성="" 속송="" %>
        ----
        JSP 파일에 대한 정보
        속성 : 
              contentType=""
              브라우저에 어떤 파일인지 알려준다.(HTML, XML, JSON)외에는 일반 텍스트
              text/html or xml  or plain -> ResetFul
              
              import : 라이브러리 읽기
              import ="java.util.*, java.io.*"
              errorPage : error시에 이동하는 페이지
              buffer="8kb" -> 16 32kb....
              
     3. 스크립트 사용법
        자바가 코딩되는 영역
        <%! %> : 선언문(메소드, 멤버변수) -> 사용빈도 x
        <% %> : 일반 자바 코딩 : 제어문, 메소드호출, 지역변수
        <%= %> : 화면출력 out.println(여기에 들어가는 코딩)
        JSP = Model1 2003년유행 -> model2(MVC) - Spring4 -> Domain(MSA)-Spring(5,6)
        
        표현식, 스크립트릿
        ${}   JSTL
        JSP안에서는 태그형으로 제작
        
     4. 내장객체
        => 171page
        9가지 지원
        = *****request -> HttpServletRequest
          request는 관리자 -> 톰캣
          1) 서버정보 / 클라이언트 브라우저 정보
             getServerInfo()
             getPort()
             getMethod()
             getProtocol()
             ***getRequsetURL()
             ***getRequsetURI()
             ***getcontextPath()
             
          2) 사용자 요청정보
             데이터 전송시 데이터가 request에 묶여서 들어온다
             = 단일 데이터()
               String getPararmeter() 스트링하나
             = 다중데이터 : 스트링 배열
               String[] getParameterValues() -> checkbox,select -> multiline()
             = 한글변환(디코딩)
               setCharacterEncdoing -> UTF-8
             = 키를 읽는다.
               GetParameterNames()
               받는파일명?no=1&name=aaa
               -----
               a.jsp?no=1&name=aaa & hobby=a&hobby=b&hobby=c
             
          3) 추가정보 -> MVC
          setAttribute() : request 데이터 추가 전송
          getAttribute() : 전송된 데이터 읽기
        = *****response -> HttpServletResponse
          = Header 정보
            다운로드 -> 파일명, 크기
            setHeader()
          = 응답정보
            = HTML전송 -> text/html
            = cookie전송 -> addCookie
          = 화면 이동
            = sendRedirect()
        = *****session -> httpSession
        = **out -> JspWriter
        = ***application -> ServletContext
        = *****pageContext -> pageContext
        = page -> Object(this)
        = exception -> Exception -> try~catch
        = config -> ServletConfig -> web.xml
        ------------------------------------
        페이지 입출력
          request, response, out
        ------------------------------------
        외부 환경정보
          config
        ------------------------------------
        서블릿 관련
          application, pageContext, session
        ------------------------------------
        예외처리 관련
          exception
        ------------------------------------
        
        
     5. 액션태그
     6. include
     7. cookie
     8. JSTL
     9. EL
     10. MVC
    --%>
    
<%

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<style type="text/css">
.container-fluid{
  margin-top: 50px;
}
.row {
  margin: 0px auto;
  width: 800px;
  height:700px;
}
h1{
    text-align: center
}
</style>
</head>
<!-- 170page : getParameter, getParameterValues -->
<body>
  <div class="container">
    <h1>개인정보</h1>
    <div class="row">
      <form method=post action="request_ok.jsp">
      <table class="table">
        <tr>
          <th class=text-center width=20%>이름</th>
          <td width=80%>
            <input type=text name=name size=15 class="input-sm">
          </td>
        </tr>
        <tr>
          <th class=text-center width=20%>성별</th>
          <td width=80%>
            <input type=radio name=sex value="남자" checked>남자
            <input type=radio name=sex value="여자">여자
          </td>
        </tr>
        <tr>
          <th class=text-center width=20%>전화번호</th>
          <td width=80%>
          <%-- 
          getParameter("tel") -> name="tel
           --%>
            <select name="tel" class=input-sm>
              <option>010</option>
            </select>
            <input type=text name=tel2 size=15 class="input-sm">
          </td>
        </tr>
        <tr>
          <th class=text-center width=20%>소개</th>
          <td width=80%>
            <textarea rows="8" cols="50" name="content"></textarea>
          </td>
        </tr>
        <tr>
          <th class=text-center width=20%>취미</th>
          <td width=80%>
            <input type=checkbox name=hobby value="운동">운동
            <input type=checkbox name=hobby value="등산">등산
            <input type=checkbox name=hobby value="낚시">낚시잼~
            <input type=checkbox name=hobby value="게임">게임
            <input type=checkbox name=hobby value="자전거">자전거
            <input type=checkbox name=hobby value="여행">여행
          </td>
        </tr>
        <tr>
          <td colspan=2 class="text-center">
            <button class="btn btn-sm btn-danger">전송</button>
          </td>
        </tr>
      </table>
      </form>
    </div>
  </div>
</body>
</html>





