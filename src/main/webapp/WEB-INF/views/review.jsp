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
	.text{
		width:70%;
	}
	.space{
		position:absolute;
		top: 25%; left:30%;
    	width:50%; height:200px;
	}
</style>
</head>
<body>
	<jsp:include page="top.jsp" />
	<div class="space">
		<form method="POST" enctype="multipart/form-data">
		<table class="table">
			<tr>
				<td>REVIEW</td>
				<td><textarea class="form-control text" rows="3" name="content"></textarea></td>
			</tr>
			<tr>
				<td>IMAGE</td>
				<td><input type="file" id="exampleInputFile" name="file"></td>
			</tr>
			<tr>
				<td colspan="2"><button type="submit" class="btn btn-default">WRITE</button></td>
			</tr>
			
		</table>
	</form>
	</div>
</body>
</html>