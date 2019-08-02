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

</head>
<body>
	<form action="registerProcessing" method="POST" enctype="multipart/form-data">
		<table>
			<th>REGISTER PRODUCT</th>
			<tr>
				<td>NAME</td>
				<td><input type="text" name="name"></td>
			</tr>
			<tr>
				<td>PRICE</td>
				<td><input type="text" name="price"></td>
			</tr>
			<tr>
				<td>GENDER</td>
				<td>
					<select name="gender">
					    <option value="man">MAN</option>
					    <option value="woman">WOMAN</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>CATEGORY</td>
				<td>
					<select name="category">
					    <option value="top">TOP</option>
					    <option value="bottom">BOTTOM</option>
					    <option value="shoes">SHOES</option>
					    <option value="hat">HAT</option>
					    <option value="acc">ACC</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>STOCK</td>
				<td><input type="text" name="stock"></td>
			</tr>
			<tr>
				<td>STATUS</td>
				<td><select name="status">
					    <option value="0">OFF</option>
					    <option value="1">ON</option>
					</select></td>
			</tr>
			<tr>
				<td>IMAGE</td>
				<td><input type="file" name="file"></td>
			</tr>
			<tr>
				<td><input type="submit" value="SAVE"></td>
			</tr>
		</table>
	</form>
</body>
</html>