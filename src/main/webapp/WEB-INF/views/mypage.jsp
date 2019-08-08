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
	
	<!-- 구매목록 -->
	<table>
		<tr>
			<th>PURCHASE-NO</th>
			<th>PRODUCT</th>
			<th>STATE</th>
			<th>DATE</th>
		</tr>
		<c:forEach var="item" items="${purchase}">
			<tr>
				<td>${item.purchaseno}</td>
				<td>${item.name}</td>
				<td>${item.complete}</td>
				<td>${item.date}</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>