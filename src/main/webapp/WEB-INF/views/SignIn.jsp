<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>
<title></title>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<style>
	.login{
        position:absolute;
        top:25%; left:50%;
        margin-top:-100px; margin-left:-100px;
        width:200px; height:200px;
      }
</style>
</head>
<body>
	<div class="login">
		<form class="form-horizontal" action="SignIn" method="POST">
			<div class="form-group">
		    	<label class="col-sm-2 control-label">ID</label>
		    	<input type="text" class="form-control" id="inputEmail3" name="id" placeholder="Email">
			</div>
			<div class="form-group">
		    	<label class="col-sm-2 control-label">PW</label>
		    	<input type="password" class="form-control" name="pw" placeholder="Password">
			</div>
		    <div class="col-sm-offset-2 col-sm-10">
		      <button type="submit" class="btn btn-default signin">SIGN IN</button>
		      <button type="button" class="btn btn-default signup">SIGN UP</button>
		  	</div>
		  	<div class="form-group">
				<a id="kakao-login-btn"></a>
				<a href="http://developers.kakao.com/logout"></a>
			</div>
		</form>
	</div>
</body>
</html>

<script type='text/javascript'>
	  //<![CDATA[
	    // 사용할 앱의 JavaScript 키를 설정해 주세요.
	    Kakao.init("0b6dfc31f981d4c71cb940e568f94267");
	    // 카카오 로그인 버튼을 생성합니다.
	    Kakao.Auth.createLoginButton({
	      container: '#kakao-login-btn',
	      success: function(authObj) {
	        alert(JSON.stringify(authObj));
	        
	        Kakao.API.request({
	        	url: '/v1/user/me',
	        	success: function(res){
	        		alert(res.kaccount_email);
	        		location.href = "kakaoLogin/" + res.kaccount_email;
	        	}
	        })
	      },
	      fail: function(err) {
	         alert(JSON.stringify(err));
	      }
	    });
	  //]]>
	  
	$('.signup').click(function(){
		location.href = "SignUp";
	})
	</script>