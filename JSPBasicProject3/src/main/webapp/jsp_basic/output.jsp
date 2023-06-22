<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
       request.setCharacterEncoding("UTF8");
    
    %>
    <jsp:useBean id="bean" class="com.sist.temp.SawonBean"> <!-- 패키지명도 같이 줘야함 -->
      <jsp:setProperty name="bean" property="*"/>
    </jsp:useBean>
    <!-- jsp:useBean id="bean"객체명 class="com.sist.temp.SawonBean"
         sawonBean bean = new sawonbena()
         jsp:setProperty name="bean" property="name만주면 setname만 처리됨" *을 주면 전체
         
         spring은 알아서 해줌
         public void aaa(sawonBean bean) 매개변수로 받아서 해줌
         
         218page 빈을 이용한 jsp파일 작성
         --------------------------
         jsp액션 태그
         -> 화면 이동(jsp:forward),
            ***화면 연결(jsp:include),
            ***값 전송(jsp:param), 
            객체 생성(jsp:useBean),
            멤버변수에 값 주입(jsp:setProperty),
            멤버변수값 읽기(jsp:getProperty)
         
         --------------------------
         <jsp:useBean> : 객체 메모리 할당
         속성
           id : 객체명
           class : 클래스명
           scope : 사용범위
              = page(default) : 한개 jsp에서 사용 (다른 페이지 이동 -> 메모리 해제)
                ***생략가능
              = request -> 사용자 요청이 있는 경우에 사용
              = session -> 프로그램이 유지하고 있는 동안(접속~종료)
              = application -> 프로그램 종료시까지 유지
              <jsp:useBean id="a" class="A"> A가 클래명인것에 유의~
                                  --------패키지명.클래스명 -> Class.forName()
              -> 자바 변경
              A a=new A(); 둘이 같은거임
         --------------------------
         jsp:setProperty : 변수에 값을 설정 (쓰기)
         -> setter와 같음
         name : 객체명
         property : 변수
         value : 값을 설정
         
         
         class A{
            private int no;
            private String name;
            
            setNo() getNo()...
         }
         
         // 1.메모리 할당
         <jsp:useBean id="a" class="A">
          = 초기화
         
          <jsp:setProperty name="a" property="name" value="홍길동">
           A  a=new A()
           -- --id
           class
           a.setName("홍길동")
           
           <jsp:setProperty name="a" property="no" value="10">
           a.setNo(10)
           
           <jsp:setProperty name="a" property="*"/>
           a.setName(request.getParameter("name"))
           a.setNo(Integer.parseInt(request.getparameter("no"))
           
          </jsp:setProperty>
         --------------------------
         jsp:getProperty : 읽기
         -> getter 와 같당.
         <jsp:getProperty name="a" property="name"> -> a.getName()
         <jsp:getProperty name="a" property="no"> -> a.getNo()
         useBean :메모리할당
         
         
         태그 자체가 라이브러리 -> 자바 코드로 변경이 된다.
         
    -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
이름: <%=bean.getName() %>
성별: <%=bean.getSex() %>
부서: <%=bean.getDept() %>
직위: <%=bean.getJob() %>
연봉: <%=bean.getPay() %>

</body>
</html>