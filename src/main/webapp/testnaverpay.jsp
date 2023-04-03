<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image/x-icon" href="./img/favicon.png">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css" href="${ctx}/css/app.css">
<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js'></script>
<html>
<head>
    <meta charset="UTF-8">
    <title>Kakao Maps API</title>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=179f363c46033b4ddf8ac7037fe8b753"></script>
</head>
<body>
   	<div id="map" style="width:500px;height:400px;"></div>
	<script>
		function test() {
			$.ajax({
				type : "POST",
				url : "https://map.kakao.com/link/search/카카오",
				success : function(data) {
					alert(data);
					
				}
			});
		}
	
	</script>
	<button onclick="test()">맵ID 가져오기 버튼</button>
</body>
</html>