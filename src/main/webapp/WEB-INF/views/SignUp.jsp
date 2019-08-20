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
	.signup{
        position:absolute;
        top:30%; left:30%;
        margin-top:-100px; margin-left:-100px;
        width:50%; height:200px;
      }
      table{
      	text-align:center;
      }
</style>
</head>
<body>
	<div class="signup">
		<form action="SignUp" method="POST">
			<table class="table table-bordered">
				<tr>
					<td>ID</td>
					<td><input type="text" class="form-control" name="id"></td>
				</tr>
				<tr>
					<td>PW</td>
					<td><input type="text" class="form-control" name="pw"></td>
				</tr>
				<tr>
					<td>NAME</td>
					<td><input type="text" class="form-control" name="name"></td>
				</tr>
				<tr>
					<td>PHONE</td>
					<td><input type="text" class="form-control" name="phone"></td>
				</tr>
				<tr>
					<td>ADDRESS</td>
					<td><input type="text" class="form-control" name="address"></td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" class="btn btn-default" value="SIGNUP"></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>