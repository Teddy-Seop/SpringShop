<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<style>
	.top > h1{
		text-align: center;
	}
	.menu{
		float:left;
		border:0.1em solid #cccccc; 
		width:30%; 
		height:100%;
		left:-1500px; 
		position:absolute; 
		background-color:white;
	}
	.open{
		float:left;
		width:45px;
		height:45px;
		margin-left:10px;
	}
</style>

</head>
<body>
	<img class="open" src="${pageContext.request.contextPath}/images/topMenu.jpg">
	<div class="top">
		<div class="menu">
			<button class="close"><h1>X</h1></button>
			<ul>
				<li><button class="logout">LOGOUT</button></li>
			</ul>
		</div>
		
		<h1 class="main">KOHO</h1>
	</div>
</body>
</html>

<script>
	//상단 메뉴
	$('.open').click(function(){
		$('.menu').animate({left:0}, 300);
	})
	$('.close').click(function(){
		$('.menu').animate({left:'-1500px'}, 300);
	})
	
	//메인페이지 이동
	$('.main').click(function(){
		location.href = "/shop/seller";
	})
	
	//로그아웃
	$('.logout').click(function(){
		location.href = "/shop/logout";
	})
</script>