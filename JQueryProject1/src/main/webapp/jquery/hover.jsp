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
	for(let i=1;i<=7;i++){
		$('body').append('<img src=cgv'+i+'.jpg width=120 height180 style="margin:10px">')
	}
	$('img').css('cursor','pointer')
	//$('img')=>[]
	$('img').hover(function(){$(this).css('opacity',0.3);}, //mouse hover
			function(){$(this).css('opacity',1);
		
	})
	

})
</script>
</head>
<body>

</body>
</html>