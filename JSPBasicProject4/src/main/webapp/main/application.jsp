<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>Servletcontext(application) : 180page</h1>
<table class=table>
  <tr>
   <th width=20% class="text-center">클래스명</th>
   <td width=80% >ServletContext</td>
  </tr>
  <tr>
   <th width=20% class="text-center">주요기능</th>
   <td width=80% >
     <ul>
       <li>서버정보</li>
       <li>로그정보</li>
       <li>자원정보(자원:이미지,파일...)<br> mac이랑 window랑 파일의 경로가 다른데 이걸 해결해줌..?</li>
     </ul>
   </td>
  </tr>
  <tr>
   <th width=20% class="text-center">주요메서드</th>
   <td width=80%>
     <ul>
       <li>
         서버정보
         <ul>
           <li>getServerInfo()</li>
         </ul>
       </li>
       <li>
         로그정보
         <ul>
           <li>log()</li>
         </ul>
       </li>
       <li>
         자원정보(자원:이미지,파일...)
         <ul>
           <li>***getInitParameter():web.xml에 등록된 데이터</li>
           <li>***getRealPath()</li>
         </ul>
       </li>
     </ul>
   </td>
  </tr>
  <tr>
   <th width=20% class="text-center">주요메소드</th>
   <td width=80% >HttpServletRequest</td>
  </tr>
</table>
</body>
</html>