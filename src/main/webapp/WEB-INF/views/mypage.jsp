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
	<div role="tabpanel">

	  <!-- Nav tabs -->
	  <ul class="nav nav-tabs" role="tablist">
	    <li role="presentation" class="active"><a href="#purchase" aria-controls="home" role="tab" data-toggle="tab">PURCHASE</a></li>
	    <li role="presentation"><a href="#pick" aria-controls="profile" role="tab" data-toggle="tab">PICK</a></li>
	  </ul>
	
	  <!-- Tab panes -->
	  <div class="tab-content">
	    <div role="tabpanel" class="tab-pane active" id="purchase">
	    	<!-- 구매목록 -->
			<table class="table">
				<tr>
					<th>NO</th>
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
						<c:set var="complete" value="${item.complete}" />
						<c:if test="${complete == 1}">
							<td><button class="btn btn-default ${item.no}">REVIEW</button></td>
						</c:if>
					</tr>
				</c:forEach>
			</table>
	    </div>
	    <div role="tabpanel" class="tab-pane" id="pick">
	    	<!-- 찜 목록 -->
			<table>
				<tr>
					<th>BRAND</th>
					<th>IMAGE</th>
					<th>NAME</th>
					<th>PRICE</th>
				</tr>
				<c:forEach var="item" items="${productList}">
					<tr>
						<td>${item.brand}</td>
						<td><img src="${pageContext.request.contextPath}/images/${item.image}" /></td>
						<td>${item.name}</td>
						<td>${item.price}</td>
					</tr>
				</c:forEach>
			</table>
	    </div>
	  </div>
	
	</div>
</body>
</html>

<script>
	$('#myTab a').click(function (e) {
	  e.preventDefault()
	  $(this).tab('show')
	})
	<c:forEach var="item" items="${purchase}">
		$('.${item.no}').click(function(){
			location.href = "/shop/review/${item.no}";
		})
	</c:forEach>
</script>