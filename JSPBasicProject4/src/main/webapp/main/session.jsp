<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%--
    request / response / session -> 웹 개발의 핵심
    ------------------------------------------ 프로그램의 실행하는 중
    session은 서버에 저장 : 사용자의 정보를 지속적으로 관리
    1) 장바구지, 결제, 예약 추천
    2) session에 저장이 되면 모든 jsp에서 사용이 가능하다(전연벽수)
    
    클래스명 -> httpSession
    클라이언트마다 1개 생성 -> id가 부여 (구분자)
                        ---sessionID -> 채팅, 상담..
    주요메소드 177?
    String getId() : 세션마다 저장 구분자
    setmaxinactiveInterval() -> 저장기간 설정
      기본 default -> 1800(초단위 30분) 
      -> 은행페이지, 경매
    isNew() : ID가 할당이 된것인지 확인
      -> 장바구니
    invalidate() : session에 저장된 모든 데이터를 지운다
      -> 로그아웃
    setAttribute() : session에 정보 저장
    getAttribute() : session에 정보 읽기
    removeAttribute() : 저장된 데이터 일부를 지울때 사용
                            
    --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>HttpSession(session):177page</h1>
<pre>
request / response / session -> 웹 개발의 핵심
    ------------------------------------------ 프로그램의 실행하는 중
    session은 서버에 저장 : 사용자의 정보를 지속적으로 관리
    1) 장바구지, 결제, 예약 추천
    2) session에 저장이 되면 모든 jsp에서 사용이 가능하다(전연벽수)
    
    클래스명 -> httpSession
    클라이언트마다 1개 생성 -> id가 부여 (구분자)
                        ---sessionID -> 채팅, 상담..
    주요메소드 177?
    String getId() : 세션마다 저장 구분자
    setmaxinactiveInterval() -> 저장기간 설정
      기본 default -> 1800(초단위 30분) 
      -> 은행페이지, 경매
    isNew() : ID가 할당이 된것인지 확인
      -> 장바구니
    invalidate() : session에 저장된 모든 데이터를 지운다
      -> 로그아웃
    setAttribute() : session에 정보 저장
    getAttribute() : session에 정보 읽기
    removeAttribute() : 저장된 데이터 일부를 지울때 사용
</pre>
</body>
</html>