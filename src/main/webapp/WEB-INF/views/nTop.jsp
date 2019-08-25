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
		z-index:100;
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
				<li><h3 id="man" class="gender">MAN</h3></li>
				<li><h4 id="top" class="man">TOP</h4></li>
				<li><h4 id="bottom" class="man">BOTTOM</h4></li>
				<li><h4 id="outer" class="man">OUTER</h4></li>
				<li><h4 id="shoes" class="man">SHOES</h4></li>
				<li><h4 id="acc" class="man">ACC</h4></li>
			</ul>
			<hr>
			<ul>
				<li><h3 id="woman" class="gender">WOMAN</h3></li>
				<li><h4 id="top" class="woman">TOP</h4></li>
				<li><h4 id="bottom" class="woman">BOTTOM</h4></li>
				<li><h4 id="outer" class="woman">OUTER</h4></li>
				<li><h4 id="shoes" class="woman">SHOES</h4></li>
				<li><h4 id="acc" class="woman">ACC</h4></li>
			</ul>
			<hr>
			<ul>
				<li><button class="login">LOGIN</button></li>
			</ul>
		</div>
		<img class="open" src="${pageContext.request.contextPath}/images/topMenu.jpg">
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
	
	//성별별 카테고리 이동
	$('.gender').click(function(){
		var gender = $(this).attr("id");
		console.log(gender);
		location.href = "/shop/list/" + gender;
	})
	
	//남성 카테고리 이동
	$('.man').click(function(){
		var category = $(this).attr("id");
		console.log(category);
		location.href = "/shop/list/man/" + category;
	})

	//여성 카테고리 이동
	$('.woman').click(function(){
		var category = $(this).attr("id");
		console.log(category);
		location.href = "/shop/list/woman/" + category;
	})
	
	//메인페이지 이동
	$('.main').click(function(){
		location.href = "/shop/Main";
	})
	
	//로그인 페이지 이동
	$('.login').click(function(){
		location.href = "/shop/SignIn";
	})
</script>