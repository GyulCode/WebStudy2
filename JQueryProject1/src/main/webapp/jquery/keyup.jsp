<%@page import="com.sist.dao.FoodBean"%>
<%@page import="java.util.List"%>
<%@page import="com.sist.dao.FoodDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    //코드 필요
    //객체 생성
    FoodDAO dao=FoodDAO.newInstance();
    List<FoodBean> list = dao.foodAllData();
    
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
  width:700px;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$('#keyword').keyup(function(){
		let k=$('#keyword').val();
		// text() -> textContent
		// html() -> innerHTML
		
		$('#user-table > tbody > tr').hide();
		let temp=$('#user-table > tbody > tr > td:nth-child(3n+2):contains("'+k+'")')
		/* contains */
		$(temp).parent().show() 
	})
})
</script>
</head>
<body>
<div class=container>
   <h1 class="text-center">맛집 목록</h1>
   <div class=row>
   <table class=table>
     <tr>
   
   </table>
   <table class=table>
     <tr>
       <th class=text-center></th>
       <th class=text-center>맛집명</th>
       <th class=text-center>전하</th>
     </tr>
     <%
     for(FoodBean vo:list){
     %>
     <tr>
       <td>
         <img alt="" src="<%=vo.getPoster()%>" width=35 height=35>
       </td>
       <td><%=vo.getName() %></td>
       <td><%=vo.getTel() %></td>
     </tr>
          
     <%
     }
     %>
   
   </table>
   </div>
</div>

</body>
</html>