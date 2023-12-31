<%@page import="com.sist.dao.CategoryVO"%>
<%@page import="java.util.Locale.Category" import="com.sist.dao.*, java.util.*" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
    <jsp:useBean id="dao" class="com.sist.dao.FoodDAO"></jsp:useBean>
    
<%
   String cno=request.getParameter("cno");
   CategoryVO cvo=dao.foodcategoryInfoData(Integer.parseInt(cno));
   List<FoodVO> list=dao.foodCategoryListData(Integer.parseInt(cno));


%>
JSTL,EL에서 사용하는 변수 설정
    <c:set var="cvo" value="<%=cvo %>"/>
    <c:set var="list" value="<%=list %>"/>
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
  width:850px;
}
</style>
</head>
<body>
  <div class=container>
    <div class='umbotron'>
       <h1 class=text-center>${cvo.title }</h1>
       <h3 class=text-center>${cvo.subject }</h3>
    </div>
    <div style="height:10px"></div>
    <div class=row>
       <table  class=table>
          <tr>
            <td>
               <%--for(foodvo vo:list) --%>
               <c:forEach var="vo" items="${list }">
                  <table class=table>
                    <tr>
                      <td class=text-center width=35% rowspan="4">
                      <a href="food_detail.jsp?fno=${vo.fno }">
                        <img src="${vo.poster }" style='width:250px; height:200px' class='img-rounded'>
                      </a>
                      </td>
                      <td width=65%>
                        <h3>${vo.name }&nbsp;<span style="color:orange">${vo.score }</span></h3>
                      </td>
                    </tr>
                    
                    <tr>
                      <td>${vo.address }</td>
                    </tr>
                    <tr>
                      <td>${vo.phone }</td>
                    </tr>
                    <tr>
                      <td>${vo.address }</td>
                    </tr>
                    
                  </table>
               </c:forEach>
            </td>
          </tr>
       
       </table>
    </div>
  </div>

</body>
</html>