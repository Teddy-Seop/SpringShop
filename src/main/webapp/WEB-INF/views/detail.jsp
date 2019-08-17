<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<style>
	img{
		width: 400px;
		height: 400px;
		margin-right: 50px;
	}
	.space{
		position:absolute;
		top: 25%; left:30%;
        width:50%; height:200px;
	}
	.section{
		float:left;
	}
</style>
</head>
<body>
	<jsp:include page="top.jsp" />
	<div class="space">
		<div class="section"><img src="${pageContext.request.contextPath}/images/${product.image}" /></div>
		<div class="section">
			<div><h3>${product.name}</h3></div>
			<div><h3>${product.price}</h3></div>
			<button class="btn btn-default purchase">PURCHASE</button>
			<button class="btn btn-default unpick"><span class="glyphicon glyphicon-star-empty"></span></button>
			<button class="btn btn-default pick"><span class="glyphicon glyphicon-star"></span></button>
		</div>
	</div>
</body>
</html>

<script>
	$('.purchase').click(function(){
		location.href = ${product.no} + "/purchase";
	})
	//PICK, UNPICK
	var pick = new Array();
	pick.push(${pick.no});

	if(pick[0] != null){
		$('.unpick').css("display", "none");
	}else{
		$('.pick').css("display", "none");
		check = "unpick";
	}
	
	//ajax
	$('.pick').click(function(check){
		$.ajax({
			data: "pick",
			type: "POST",
			dataType: "text"
		})
		.done(function(result){
			console.log("1");
			$('.pick').css("display", "none");
			$('.unpick').css("display", "block");
		})
		.always(function(){
			console.log("always1");
		})
	})
	$('.unpick').click(function(check){
		$.ajax({
			data: "unpick",
			type: "POST",
			dataType:"text"
		})
		.done(function(result){
			console.log("2");
			$('.pick').css("display", "block");
			$('.unpick').css("display", "none");
		})
		.always(function(){
			console.log("always2");
		})
	})
</script>