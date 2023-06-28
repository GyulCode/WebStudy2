<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.sist.dao.*" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:useBean id=dao class="com.sist.dao.FoodDAO"/>
<%
//코드 전체 복붙 필요
  //1.사용자가 보내준 값을 받는다.
  String fno=request.getParameter("fno");
  FoodVO vo=dao.foodDetailData(Integer.parseInt(fno));
  String address=vo.getAddress();
  String addr1=address.substring(0,address.lastIndexOf("지"));
  String addr2=address.substring(address.lastIndexOf("지")+3);
  String temp=addr1.trim().substring(addr1.indexOf(" "));
  String addr3=temp.substring(0,temp.indexOf(" "));
		  
  


%>
<c:set var="vo" value="<%=vo.getPoster() %>"/>
<c:set var="addr1" value="<%=addr1 %>"/>
<c:set var="addr2" value="<%=addr2 %>"/>
<c:set var="addr3" value="<%=addr3 %>"/>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script type="text/javascript" src="<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6a0ea7566fd277ba692466d2e5949356&libraries=services"></script>"></script>
<style type="text/css">
.container{
 margin-top:50px;
}
.row{
  margin:0px auto;
  width:1200px;
}
.map_wrap, .map_wrap * {margin:0;padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
.map_wrap a, .map_wrap a:hover, .map_wrap a:active{color:#000;text-decoration: none;}
.map_wrap {position:relative;width:100%;height:500px;}
#menu_wrap {position:absolute;top:0;left:0;bottom:0;width:250px;margin:10px 0 30px 10px;padding:5px;overflow-y:auto;background:rgba(255, 255, 255, 0.7);z-index: 1;font-size:12px;border-radius: 10px;}
.bg_white {background:#fff;}
#menu_wrap hr {display: block; height: 1px;border: 0; border-top: 2px solid #5F5F5F;margin:3px 0;}
#menu_wrap .option{text-align: center;}
#menu_wrap .option p {margin:10px 0;}  
#menu_wrap .option button {margin-left:5px;}
#placesList li {list-style: none;}
#placesList .item {position:relative;border-bottom:1px solid #888;overflow: hidden;cursor: pointer;min-height: 65px;}
#placesList .item span {display: block;margin-top:4px;}
#placesList .item h5, #placesList .item .info {text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
#placesList .item .info{padding:10px 0 10px 55px;}
#placesList .info .gray {color:#8a8a8a;}
#placesList .info .jibun {padding-left:26px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;}
#placesList .info .tel {color:#009900;}
#placesList .item .markerbg {float:left;position:absolute;width:36px; height:37px;margin:10px 0 0 10px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat;}
#placesList .item .marker_1 {background-position: 0 -10px;}
#placesList .item .marker_2 {background-position: 0 -56px;}
#placesList .item .marker_3 {background-position: 0 -102px}
#placesList .item .marker_4 {background-position: 0 -148px;}
#placesList .item .marker_5 {background-position: 0 -194px;}
#placesList .item .marker_6 {background-position: 0 -240px;}
#placesList .item .marker_7 {background-position: 0 -286px;}
#placesList .item .marker_8 {background-position: 0 -332px;}
#placesList .item .marker_9 {background-position: 0 -378px;}
#placesList .item .marker_10 {background-position: 0 -423px;}
#placesList .item .marker_11 {background-position: 0 -470px;}
#placesList .item .marker_12 {background-position: 0 -516px;}
#placesList .item .marker_13 {background-position: 0 -562px;}
#placesList .item .marker_14 {background-position: 0 -608px;}
#placesList .item .marker_15 {background-position: 0 -654px;}
#pagination {margin:10px auto;text-align: center;}
#pagination a {display:inline-block;margin-right:10px;}
#pagination .on {font-weight: bold; cursor: default;color:#777;}
</style>

</head>
<body>
<div class='container'>
  <div class='row'>
  <%--
  #{} -> getxxx()...
  ${} -> 일반변수
  ------------? 대신 값을 첨부(mybatis)
  
  
  --%>
    <table class='table'>
      <tr>
        <c:forTokens items="${vo.poster }" delims="^" var="img">
          <td><img alt="" src="" sytle="width:200%"></td>
        
        </c:forTokens>
      </tr>
    </table>
  
  </div>
  <div class='col-sm-7'>
     <table class=table>
       <tr>
         <td colspan=2>
            <h3>${vo.name }&nbsp; <span style="color:orange">${vo.score }</span></h3>
         </td>
       </tr>
       <tr>
         <th width=20% style='color:gray'>주소</th>
         <td width=80%>${vo.phone }</td>
       </tr>
       <tr>
         <th width=20% style='color:gray'>전화</th>
         <td width=80%></td>
       </tr>
       <tr>
         <th width=20% style='color:gray'>음식종류</th>
         <td width=80%></td>
       </tr>
       <tr>
         <th width=20% style='color:gray'>기격대</th>
         <td width=80%></td>
       </tr>
       <tr>
         <th width=20% style='color:gray'>전화</th>
         <td width=80%>${vo.phone }</td>
       </tr>
       <tr>
         <th width=20% style='color:gray'>음식종류</th>
         <td width=80%>${vo.type }</td>
       </tr>
       <tr>
         <th width=20% style='color:gray'>주차</th>
         <td width=80%>${vo.parking}</td>
       </tr>
       <tr>
         <th width=20% style='color:gray'>영업시간</th>
         <td width=80%>${vo.menu!='no' }</td>
       </tr>
       <c:if  test="${vo.menu!='no' }">
       <tr>
         <th width=20% style='color:gray'>메뉴</th>
         <td width=80%>${vo.type }</td>
       </tr>
       </c:if>
     </table>
     
  </div>
  <div class='col-sm-5'>
  
  
  </div>
  
</div>



</body>
</html>