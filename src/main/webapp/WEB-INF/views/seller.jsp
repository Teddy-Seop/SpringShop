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
	.space{
		position:absolute;
		top: 25%; left:30%;
        width:50%; height:200px;
	}
	.btn{
		margin:30px;
	}
</style>
</head>
<body>
	<jsp:include page="sellerTop.jsp" />
	
	<div class="space">
		<button class="btn btn-default supervise">SUPERVISE</button>
		<button class="btn btn-default management">MANAGEMENT</button>
		<button class="btn btn-default handling">HANDLING</button>
	</div>
</body>
</html>

<script>
	$('.supervise').click(function(){
		location.href = "register";
	})
	$('.management').click(function(){
		location.href = "management";
	})
	$('.handling').click(function(){
		location.href = "handling";
	})
</script>