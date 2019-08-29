<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		margin:10px;
	}
	.img{
		width: 300px;
		height: 300px;
	}
	.target{
		margin:100px;
	}
	a{
		color:black;
	}
	.clear{
        clear:both;
    }
    .postLoader{
    	text-align: center;
    }
    .loader{
    	height:100px;
    	width:100px;
    }
</style>
</head>
<body>
	<c:choose>
	    <c:when test="${login eq 'login'}">
	        <jsp:include page="top.jsp" />
	    </c:when>
	    <c:otherwise>
	        <jsp:include page="nTop.jsp" />
	    </c:otherwise>
	</c:choose>
	
	<div class="target">
		<c:forEach var="product" items="${productList}">
			<div class="space">
				<div><a href="/shop/detail/${product.no}"><img class="img" src="${pageContext.request.contextPath}/images/${product.image}" /></a></div>
				<div><a href="/shop/detail/${product.no}">${product.name}</a></div>
				<div><a href="/shop/detail/${product.no}">${product.price}</a></div>
			</div>
		</c:forEach>
	</div>
	<div class="clear"></div>
	<div class="postLoader"></div>
</body>

<script>
	//상품 목록 무한 스크롤
	function postFunc(){
    	$('.postLoader').html('<img class="loader" src="${pageContext.request.contextPath}/images/loading.gif">');
  	}
	
	function showProduct(index){
		$.ajax({
			headers: {
				"content-type": "application/json",
				"X-HTTP-Method-Override": "POST"	
			},
			data: JSON.stringify({
				no: index
			}),
			type: "POST",
			dataType: "json"
		})
		.done(function(result){
			console.log(result);
			var str = '';
			if(result != ''){
				$(result).each(function(){
					console.log(this);

					str += '<div class="space">'
					str += '<div><a href="/shop/detail/' + this.no + '"><img class="img" src="${pageContext.request.contextPath}/images/' + this.image + '" /></a></div>'
					str += '<div><a href="/shop/detail/' + this.no + '">' + this.name + '</a></div>'
					str += '<div><a href="/shop/detail/' + this.no + '">' + this.price + '</a></div>'
					str += '</div>'
				})
				$('.target').append(str);
			}
		})
		.always(function(){
			console.log("always1");
		})
	}
	var processScroll = true;
	var count = 0;
	$(window).scroll(function() {
	    if (processScroll  && $(window).scrollTop() > $(document).height() - $(window).height() - 100) {
	        processScroll = false;
	        if($('.postLoader').html() != '<img class="loader" src="${pageContext.request.contextPath}/images/loading.gif">'){
		       	postFunc();
		        setTimeout(function(){
		        	$('.postLoader').empty();
		        	showProduct(count);
		        }, 2000);
		        count++;
	    	}
	    }
	    processScroll = true;
	})
</script>