<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.dao.*, java.util.*" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <jsp:useBean id="dao" class="com.sist.dao.ReplyBoardDAO"></jsp:useBean>
    
<%
//사용자로부터  페이지 받기
String strPage=request.getParameter("page");

//첫페이지 처리
if(strPage==null)
	strPage="1";

//현재 페이지
int curpage=Integer.parseInt(strPage);
List<ReplyBoardVO> list=dao.boardListData(curpage);

//총페이지
int count=dao.boardRowCount();
int totlapage=(int)(Math.ceil(count/10.0));
count=count-((curpage*10)-(10));

request.setAttribute("curpage",curpage);
request.setAttribute("totalpage", totlapage);
request.setAttribute("list", list);
request.setAttribute("count", count);
request.setAttribute("today", new SimpleDateFormat("yyyy-MM-dd").format(new Date()));



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
  width:800px;
}
</style>
</head>
<body>
<div class='container'>
  <div class='row'>
    <img alt="" src="image/qna.jpg" style='width:800px; hieght:100px'>
  </div>
</div>
<div style='height:20px'></div>
<div class=row>
  <table class=table>
    <tr>
      <td>
        <a href="#" class='btn btn-sm btn-danger'>새글</a>
      </td>
    </tr> 
    </table>
    <table class=table>
    <tr class='success'>
      <th width="10%" class=text-center>번호</th>
      <th width="45%" class=text-center>제목</th>
      <th width="15%" class=text-center>이름</th>
      <th width="20%" class=text-center>작성일</th>
      <th width="10%" class=text-center>조회수</th>
    </tr>
    <%-- for(replyBoardVO vo:list --%>
    <c:set var="count" value="${count }"/>
    <c:forEach var="vo" items="${list }">
    <tr class='success'>
      <td width="10%" class=text-center>${count }</td>
      <td width="45%">
      <c:out value="${vo.getGroup_tab() }"></c:out>
        <c:if test="${vo.group_tab>0 }">
           <c:forEach var="i" begin="1" end="${vo.group_tab }">
           &nbsp;&nbsp;
           </c:forEach>
           <img src="image/re_icon.png">&nbsp;
        </c:if>
        ${vo.subject }
        <sup><img src='image/new.gif'></sup>
        </td>
      <td width="15%" class=text-center>${vo.name }</td>
      <td width="20%" class=text-center>${vo.dbday }</td>
      <td width="10%" class=text-center>${vo.hit }</td>
    </tr>
    <c:set var="count" value="${count-1 }"/>
    </c:forEach>
  </table>
  <table class='table'>
    <tr>
      <td class=text-left>
        Search:<select name=fs class='input-sm'>
          <option value="name">이름</option>
          <option value="subject">제목</option>
          <option value="content">내용</option>
        </select>
        <input type='text' name=ss size=15 class='input-sm'>
        <button class='btn btn-sm btn-danger'>검색</button>
      </td>
      <td class=text-right>
        <a href="list.jsp?page=${curpage>1?curpage-1:curpage }" class='btn btn-sm btn-info'>이전</a>
        ${curpage } page / ${totalpage } pages
        <a href="list.jsp?page=${curpage<totalpage?curpage+1:curpage }" class='btn btn-sm btn-warning'>다음</a>
      </td>
    </tr>
  </table>
</div>

</body>
</html>


