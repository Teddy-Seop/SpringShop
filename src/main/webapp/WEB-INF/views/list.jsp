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
	.space{
		float:left;
	}
	img{
		width: 200px;
		height: 200px;
	}
	.target{
		margin:100px;
	}
	.space{
		margin:10px;
	}
</style>
</head>
<body>
	<jsp:include page="top.jsp" />
	
	<div class="target">
		<c:set var="count" value="0" />
		<c:forEach var="product" items="${productList}">
			<c:set var="count" value="${total + 1}" />
			<c:if test="${count == 5}">
				<br>
			</c:if>
			<div class="space">
				<div><a href="/shop/detail/${product.no}"><img src="${pageContext.request.contextPath}/images/${product.image}" /></a></div>
				<div><a href="/shop/detail/${product.no}">${product.name}</a></div>
				<div>${product.price}</div>
			</div>
		</c:forEach>
	</div>
</body>