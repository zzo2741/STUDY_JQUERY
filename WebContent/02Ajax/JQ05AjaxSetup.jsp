<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JQ05AjaxSetup.jsp</title>
<link rel="stylesheet" href="../common/bootstrap4.4.1/css/bootstrap.css" />
<script src="../common/jquery/jquery-3.5.1.js"></script>
<script>
/* 
ajaxSetup()
	: 동일하게 반복되는 $.ajax()의 인자를 설정하여 반복되는 인자를 생략하게 해주는 메소드
	
	url, type, data, dataType등의 속성은 기본적으로 사용되므로 묶어주면 편리하다.
	
	$.ajaxSetup()에서 정의된 속성을 상속받아서 $.ajax()메소드를 실행하는 방식이라 보면 된다.
 */
$(function(){
	// ajaxSetup()에서 url과 dataType을 설정한다.
	$.ajaxSetup({
		url : "./common/05JSONData.json",
		dataType : "json"
	});
	// 위에서 미리 정의했으므로 callback메소드만 정의한다.
	$('#btn').click(function () {
		$.ajax({
			success : function(responseData) { 
				/*
				callback되는 JSON배열 데이터를 each()로 읽어서 배열의 갯수만큼 반복한다. 이 때 각 반복시 JSON객체를 파싱하게 된다.
				파싱할 때 .(점) 과 [](배열) 두 가지 형태를 사용할 수 있다.
				*/
				$.each(responseData, function(index, value) {
					var htmlStr = "<tr>";
					htmlStr += " <td>" + (index+1) + "</td>";
					htmlStr += " <td>" + value.name + "</td>";
					htmlStr += " <td>" + value["age"] + "</td>";
					htmlStr += " <td>" + value["주소"] + "</td>";
					htmlStr += " </tr>";
					// 해당 요소 뒷부분에 컨텐츠를 추가한다.
					$('#tbl1').append(htmlStr);
				});
			},
			error : errorFunc
		});
	});
});
/*
실패 시 호출되는 callback method도 callback data를 가지고 있으며 아래와 같이 사용한다.
 */
function errorFunc(errData) {
	alert("실패 : " + errData.status + " : " + errData.statusText);
}
</script>
</head>
<body>
<div class="container">
	<h2>$.ajaxSetup() 메소드 사용하기</h2>
	
	<table class="table table-bordered" id="tbl1">
		<tr>
			<td>NO</td>
			<td>이름</td>
			<td>나이</td>
			<td>출신지역</td>
		</tr>
	</table>
	
	<button id="btn">JSON데이터 가져오기</button>	
</div>
</body>

</html>