<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<style>
	.top h1{
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
</style>

</head>
<body>
	<div class="top">
		<div class="menu">
			<button class="close"><h1>X</h1></button>
			<form action="/shop/search" method="POST">
				<input type="text" name="keyword">
				<button type="submit">
					<span class="glyphicon glyphicon-search"></span>
				</button>
			</form>
			<ul>
				<li><h3 class="man">MAN</h3></li>
				<li><button id="top" class="man">TOP</button></li>
				<li><button id="bottom" class="man">BOTTOM</button></li>
				<li><button id="outer" class="man">OUTER</button></li>
				<li><button id="shoes" class="man">SHOES</button></li>
				<li><button id="acc" class="man">ACC</button></li>
			</ul>
			<hr>
			<ul>
				<li><h3 class="woman">WOMAN</h3></li>
				<li><button id="top" class="woman">TOP</button></li>
				<li><button id="bottom" class="woman">BOTTOM</button></li>
				<li><button id="outer" class="woman">OUTER</button></li>
				<li><button id="shoes" class="woman">SHOES</button></li>
				<li><button id="acc" class="woman">ACC</button></li>
			</ul>
			<hr>
			<ul>
				<li><button class="mypage">MY PAGE</button></li>
				<li><button class="logout">LOGOUT</button></li>
			</ul>
		</div>
		<button class="open">MENU</button>
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
	
	//남성 카테고리 이동
	$('.man').click(function(){
		var category = $(this).attr("id");
		location.href = "/shop/list/man/" + category;
	})
	
	//여성 카테고리 이동
	$('.woman').click(function(){
		var category = $(this).attr("id");
		location.href = "/shop/list/woman/" + category;
	})
	
	//메인페이지 이동
	$('.main').click(function(){
		location.href = "/shop/Main";
	})
	
	//마이페이지 이동
	$('.mypage').click(function(){
		location.href = "/shop/mypage";
	})

	//로그아웃
	$('.logout').click(function(){
		location.href = "/shop/logout";
	})
</script>