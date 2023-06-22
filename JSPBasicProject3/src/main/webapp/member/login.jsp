<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css2?family=Diphylleia&family=Noto+Sans+KR:wght@400;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.container{
  margin-top: 50px;
}
.row{
margin: 0px auto;
width:450px;
}
h1{
text-align:center;
font-family:'gasoek One', sans-serif;
}
</style>
<!-- jquery import 해주는 구문 http://code.jquery.com -->
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
/* 
window.onload()=function=>{
	
}
자바스크립트 라이브러리
let id=document.querySelector("#id")
       ---------------------
       값을 읽는 경우
       id.value -> $('#id').val()
       --------
       id.textContent -> $('#id').text()
       --------
       id.innerHTML -> $('#id').html()
       -------- ------ $('#id').attr()
JQUERY => $('#id')
아래가 jquery구문임
*/

$(function(){//window.onload=function(){}
	/* $('#logBtn').click(function(){
		alert("Hello JQeury!!")
	}) */
	//이벤트 등록
	$('#logBtn').on('click',function(){
	//	alert("Hello JQeury!!")
	//위랑 같은 코드임
	
	let id=$('#id').val();
	//let it=document.querySelector('#id').value
	if(id.trim()==""){
		$('#id').focus();
		return;
	}
	let pwd=$('#pwd').val();
	//let it=document.querySelector('#id').value
	if(pwd.trim()==""){
		$('#pwd').focus();
		return;
	}
	//$('frm').submit();
	$.ajax({
		type:'post',
		url:'login_ok.jsp',
		data:{"id":id, "pwd":pwd},
		success:function(result){
			let res=result.trim();
			if(res==="NOID"){
				$('#id').val("");
				$('#pwd').val("");
				$('#id').focus();
				$('#print').text("ID존재하지 않습니다..");
			}else if(res==="NOPWD"){
				$('#pwd').val("");
				$('#pwd').focus();
				$('#print').text("비밀번호가 틀립니다.");
				
			}else{
				location.href="../databoard/list.jsp"
			}
				
		}
	})
			
	
	})
	
	
})
</script>

</head>
<body>
<div class=container>
  <h1>Login</h1>
    <div class=row>
    <form method=post action="login_ok.jsp"></form>
      <table class=table>
        <tr>
          <td width=20%>ID</td>
          <td width=80%>
            <input type=text name=id size=15 class='input-sm' id=id>
          </td>
        </tr>
        <tr>
          <td width=20%>PasssWord</td>
          <td width=80%>
            <input type=password name=pwd size=15 class='input-sm' id=pwd>
          </td>
        </tr>
        <tr>
          <td colspan=2  class=text-center>
            <span id=print style='color:red'></span>
          </td>
        </tr>
        <tr>
          <td colspan=2  class=text-center>
            <input type=button class='btn btn-sm btn-danger' value=로그인 id='logBtn'>
          </td>
        </tr>
      </table>
    </div>
</div>
</body>
</html>