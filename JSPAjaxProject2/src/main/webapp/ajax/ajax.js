const xmlHttpRequest=new XMLHttpRequest();

/*
XMLHttpRequest() : 브라우저 내장 객체이다.
전송 (요청), 결과값을 받는다.

1) 연결 : open
2) 데이터 전송 : send()
3) 결과값을 받아서 처리
   처리해 주는 메소드는 2가지가 있다.
   readyState : 준비과정
     0,1,2,3,4 -> send()완료
   status : 상태 200이면 정상
   if(xmlHttpRequest.readyState==4 && xmlHttpRequest.status==200)
   {
	   데이터를 읽어서 출력
	   success:function()
   }

*/

function ajaxConfig(method,url,callback){
	xmlHttpRequest.open(method,url,true);
	xmlHttpRequest.onreadystatechange=callback;
	xmlHttpRequest.send(null);
}
xmlHttpRequest.open(method,url,true); //비동기 일때 true
/*
    $.ajax({
		type:
		url:
		date:{} 이게 센드 역할
		success
	})
*/

