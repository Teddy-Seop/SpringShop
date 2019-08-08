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

</head>
<body>
	<jsp:include page="top.jsp" />
	
	<div><img src="../images/${product.image}" /></div>
	<div>${product.name}</div>
	<div>${product.price}</div>
	<button class="purchase">PURCHASE</button>
	<button class="unpick">
		<span class="glyphicon glyphicon-star-empty"></span>
	</button>
	<button class="pick">
		<span class="glyphicon glyphicon-star"></span>
	</button>
</body>
</html>

<script>
	$('.purchase').click(function(){
		location.href = ${product.no} + "/purchase";
	})
	//PICK, UNPICK
	var check;
	var pick = new Array();
	pick.push(${pick.no});

	if(pick[0] != null){
		$('.unpick').css("display", "none");
		check = "pick";
	}else{
		$('.pick').css("display", "none");
		check = "unpick";
	}
	
	//ajax test
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
			check = "pick";
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
			check = "unpick";
		})
		.always(function(){
			console.log("always2");
		})
	})
</script>