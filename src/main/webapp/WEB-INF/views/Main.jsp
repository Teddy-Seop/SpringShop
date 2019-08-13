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

</head>
<body>
	<jsp:include page="top.jsp" />
	
	<div class="gender">
		<div class="man"><h2>MAN</h2></div>
		<div class="woman"><h2>WOMAN</h2></div>
	</div>
	
	<div class="target">
		<c:forEach var="product" items="${productList}">
			<div><img src="images/${product.image}" /></div>
			<div>${product.name}</div>
			<div>${product.price}</div>
		</c:forEach>
	</div>
</body>
</html>

<script>
	$('.man').click(function(){
		location.href = "list/man"
	})
	$('.woman').click(function(){
		location.href = "list/woman"
	})
</script>