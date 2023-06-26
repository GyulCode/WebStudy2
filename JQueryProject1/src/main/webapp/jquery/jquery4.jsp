<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	//글자 조작 -> text(),html() (getter/setter)    빈공백 getter 값이 있으면 setter
	//태그 조작 -> append()
	//alert($('h1').text()) //h1태그의 text읽기 -> alert로 출력
	alert($('h1').html()) //h1태그의 text읽기 -> alert로 출력 단 html은 태그가까지 통째로 출력시킴
	//$('#h').text("HELLO~~~~~")
	$('#h').html("<span style="color:green">Hello Green JQuery</span>")
})
</script>
</head>
<body>
<h1><span style="color:red">Hello JQuery</span>
  <div>hello jquery</div>
</h1>
<h1 id=h></h1>

</body>
</html>