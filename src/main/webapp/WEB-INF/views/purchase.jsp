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
	
	<div><img src="${pageContext.request.contextPath}/images/${product.image}" /></div>
	<div>${product.brand }</div>
	<div>${product.name }</div>
	<div>${product.price }</div>
	<form action="purchaseProcessing" method="POST">
		<input type="hidden" value="${product.brand}" name="brand">
		<input type="hidden" value="${product.name}" name="name">
		<table>
			<tr>
				<th>구매자 정보 작성</th>
			</tr>
			<tr>
				<td><label>ID</label></td>
				<td><input type="text" value="${user.id}" name="id" readonly></td>
			</tr>
			<tr>
				<td><label>ADDRESS</label></td>
				<td><input type="text" value="${user.address}" name="address"></td>
			</tr>
			<tr>
				<td><label>PHONE</label></td>
				<td><input type="text" value="${user.phone}" name="phone"></td>
			</tr>
			<tr>
				<td><input type="submit" value="PURCHASE"></td>
			</tr>
		</table>
	</form>
</body>
</html>