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
	img{
		width: 400px;
		height: 400px;
	}
	.space{
		position:absolute;
		top: 25%; left:30%;
        width:50%; height:50%;
	}
	.section{
		float:left;
		margin-right: 50px;
		margin-bottom: 30px;
	}
</style>
</head>
<body>
	<jsp:include page="top.jsp" />
	
	<div class="space">
		<div class="section"><img src="${pageContext.request.contextPath}/images/${product.image}" /></div>
		<div class="section">
			<div><h2>${product.brand }</h2></div>
			<div><h3>${product.name }</h3></div>
			<div><h3>${product.price }</h3></div>
		</div>
		<form action="purchaseProcessing" method="POST">
			<input type="hidden" value="${product.brand}" name="brand">
			<input type="hidden" value="${product.name}" name="name">
			<table>
				<tr>
					<th colspan="2">구매자 정보 작성</th>
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
					<td><button class="btn btn-default" type="submit">PURCHASE</button></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>

<script>
  //<![CDATA[
    // // 사용할 앱의 JavaScript 키를 설정해 주세요.
    Kakao.init('0b6dfc31f981d4c71cb940e568f94267');
    // // 카카오링크 버튼을 생성합니다. 처음 한번만 호출하면 됩니다.
    function sendLink() {
      Kakao.Link.sendDefault({
        objectType: 'feed',
        content: {
          title: '딸기 치즈 케익',
          description: '#케익 #딸기 #삼평동 #카페 #분위기 #소개팅',
          imageUrl: 'http://mud-kage.kakao.co.kr/dn/Q2iNx/btqgeRgV54P/VLdBs9cvyn8BJXB3o7N8UK/kakaolink40_original.png',
          link: {
            mobileWebUrl: 'https://developers.kakao.com',
            webUrl: 'https://developers.kakao.com'
          }
        },
        social: {
          likeCount: 286,
          commentCount: 45,
          sharedCount: 845
        },
        buttons: [
          {
            title: '웹으로 보기',
            link: {
              mobileWebUrl: 'https://developers.kakao.com',
              webUrl: 'https://developers.kakao.com'
            }
          },
          {
            title: '앱으로 보기',
            link: {
              mobileWebUrl: 'https://developers.kakao.com',
              webUrl: 'https://developers.kakao.com'
            }
          }
        ]
      });
    }
  //]]>
</script>