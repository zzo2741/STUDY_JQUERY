<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" href="../common/bootstrap4.4.1/css/bootstrap.css" />
<script src="../common/jquery/jquery-3.5.1.js"></script>
<script>
	/*  
	$.ajax()
		: jQuery에서 사용되는 AJAX관련 메소드로 load(), get(), post()메소드의 특징을 다 가지고 있다.
		그러므로 가장 활용빈도가 높다. 별도의 인자가 존재하지 않고 JSON형태의 인자 하나만 사용한다.
	
	속성
		url : 요청할 서버의 경오
		type : 요청 시 사용할 전송방식. get / post
		dataType : callback data의 형식, json / xml / script / html / text 등
		success : 요청에 성공했을 때 callback method,
		error : 요청에 실패했을 때 callback method
		contentType : 전송 시 사용할 컨텐츠 타입 (get과 post가 다름)
		data : 서버로 전송할 파라미터. JSON형식.
	 */
	$(function() {
		/*
		해당 메소드는 문서의 로드가 끝난 직 후 js파일의 내용을 읽어와서 현재 문서에 로드한다.
		즉 $.load()메소드와 동일한 역할을 하고 있다.
		 */
		$.ajax({
			url : './common/04JsData.js',
			type : 'get',
			dataType : "script",
			// 요청 성공시의 콜백메소드는 무기명 함수 형태로 정의됨
			success : function(resData) {
				MyAlert("Hello", " AJAX");
			},
			// 요청 실패시 콜백메소드는 외부 JS함수로 정의함
			error : errFunc
		});

		$('#ajaxBtn').click(function() {
			$.ajax({
				url : './common/02PrintToday.jsp',
				dataType : 'html',
				type : 'get',
				contentType : "text/html;charset:utf-8",
				data : {
					msg : $(this).text(),
					varStr : '$.ajax()메소드 열라 짱 좋아요'
				},
				success : sucFunc, // sucFunc(data)형태로 사용하지 않는다.
				error : errFunc
			});
		});
	});
	/*
	콜벡메소드를 외부함수 형태로 정의함. 해당 함수를 호출시에는 함수명 안으로 호출한다.
	매개변수는 사용하지 않는다.
		error : errFunc => O 
		error : errFunc(data) => X 
	 */
	function errFunc() {
		alert("에러발생. 디버깅하세욤.")
	}
	/*
	요청 성공시 호출할 callback method, 외부 함수로 정의되고 있고 함수명만으로 호출하더라도 콜백데이터는 파라미터로 받을 수 있다.
	 */
	function sucFunc(resData) {
		alert("$.ajax()메소드 요청 성공");
		$('#ajaxDisplay').html(resData)
	}
</script>
</head>
<body>
	<h2>$.ajax() 메소드 사용하기</h2>

	<button id="ajaxBtn">ajax()메소드실행하기</button>

	<div id="ajaxDisplay">ajax결과를 여기에 디스플레이</div>
</body>

</html>