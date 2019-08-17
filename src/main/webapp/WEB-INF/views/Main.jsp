<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	.img{
		width: 200px;
		height: 200px;
	}
	.space{
		float:left;
		margin:10px;
	}
	.tapSpace{
		margin:100px;
	}
	a{
		color:black;
	}
</style>

</head>
<body>
	<jsp:include page="top.jsp" />
	
	<div class="tapSpace">
		<div role="tabpanel">
		  <!-- Nav tabs -->
		  <ul class="nav nav-tabs" role="tablist">
		    <li role="presentation" class="active"><a href="#rank" aria-controls="rank" role="tab" data-toggle="tab">RANK</a></li>
		    <li role="presentation"><a href="#new" aria-controls="new" role="tab" data-toggle="tab">NEW ARRIVAL</a></li>
		  </ul>
		  <!-- Tab panes -->
		  <div class="tab-content">
		    <div role="tabpanel" class="tab-pane active" id="rank">
		    	<c:forEach var="product" items="${productRank}">
					<div class="space">
						<div><a href="/shop/detail/${product.no}"><img class="img" src="${pageContext.request.contextPath}/images/${product.image}" /></a></div>
						<div><a href="/shop/detail/${product.no}">${product.name}</a></div>
						<div><a href="/shop/detail/${product.no}">${product.price}</a></div>
					</div>
				</c:forEach>
		    </div>
		    <div role="tabpanel" class="tab-pane" id="new">
		    	<c:forEach var="product" items="${productNew}">
					<div class="space">
						<div><a href="/shop/detail/${product.no}"><img class="img" src="${pageContext.request.contextPath}/images/${product.image}" /></a></div>
						<div><a href="/shop/detail/${product.no}">${product.name}</a></div>
						<div><a href="/shop/detail/${product.no}">${product.price}</a></div>
					</div>
				</c:forEach>
		    </div>
		  </div>
		</div>
	</div>
</body>
</html>