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
	<table>
			<tr>
				<th><label>NO</label></th>
				<th><label>ID</label></th>
				<th><label>ADDRESS</label></th>
				<th><label>PHONE</label></th>
				<th><label>HANDLING</label></th>
			</tr>
			<c:forEach var="item" items="${list}">
				<tr>
					<td>${item.no}</td>
					<td>${item.id}</td>
					<td>${item.address}</td>
					<td>${item.phone}</td>
					<td><button class="${item.no}">HANDLING</button></td>
				</tr>
			</c:forEach>
		</table>
</body>
</html>

<script>
	<c:forEach var="item" items="${list}">
		$('.' + ${item.no}).click(function(){
			location.href = ${item.no} + "/handlingProcessing";
		})
	</c:forEach>
</script>