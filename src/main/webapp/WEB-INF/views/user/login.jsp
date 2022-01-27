<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="b" tagdir="/WEB-INF/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.14.0/css/all.css" integrity="sha384-HzLeBuhoNPvSl5KYnjx0BT+WB0QEEqLprO+NBkkk5gbc67FTaL7XIGa2w1L0Xbgc" crossorigin="anonymous">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<link href="<%=request.getContextPath()%>/resource/favicon/favicon.png" rel="icon" type="image/x-icon" />
<style>
/*노랑 배경색 : #ffe164
  파랑 배경색 : #264d73
  빨간 포인트색 : #f0615c
  하늘색 배경색 : #eef2f6 
  태그 보더색 : #aa80ff
  대댓글 하늘색: #b3cae6;
  */


* {
	font-family: 'Jua', sans-serif;
}
body{
background-color: #ffe164;}

#loginText {
	color: #3e4041;
}

#loginForm {
	position: absolute;
	width: 400px;
	height: 435px;
	padding: 30px, 20px;
	background-color: #FFFFFF;
	text-align: center;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	border-radius: 15px;
	background-color: rgba(255, 255, 255, 0.5);
	border: 4px solid;
	border-color: #2f6091;
}

#inputEmail {
	background-color: rgba(255, 255, 255, 0.5);
	text-align: center;
	border: 3px solid;
	border-color: #2f6091;
}

#inputPw {
	background-color: rgba(255, 255, 255, 0.5);
	text-align: center;
	border: 3px solid;
	border-color: #2f6091;
}

#korean {
	color: 0c0d0d;
	position: relative;
	top: 5px;
}

#loginButton {
	display : block;
	position: relative;
	top: 20px;
	border: 3px solid;
	border-color: #2f6091;
	width: 70px;
    margin: auto;
    margin-bottom: 55px;
}

.pw {
	position: relative;
	top: 6px;
}

p {
	position: relative;
}

#goSignUp {
	position: relative;
	
	color: #f0615c;
}

#result{
	color: #f0615c;
	display: block;
    position: relative;
    margin-top: 7px;
}

#login-findPWButton {
	
	cursor: pointer;
	color: #264d73;
}
#noId{
	width: 50%;
	float: left;
    box-sizing: border-box;
}

#findPw{
	width: 50%;
	float: right;
    box-sizing: border-box;
}

</style>
<title>Login!</title>
</head>
<body>
	<b:header></b:header>
	<div class="container" id="login-back-ground">
		<div class="row" id="loginForm">
			<div class="col">
				<br>
				<h1 id="loginText">Login</h1>
				<form method="post">
					<div class="login-group">
						<br>
						<label for="input1" id="korean">아이디</label>

						<input id="inputEmail" type="email" class="form-control" name="email" required placeholder="childhood@naver.com">
					</div>
					<div class="login-group pw">
						<label for="input2" id="korean">패스워드</label>
						<input id="inputPw" type="password" class="form-control" name="pw" required>
					</div>
					<c:if test="${not empty result }">
          				<small id="result">${result }</small>
    				</c:if> 			
					
					
					<button class="btn btn-outline-dark" id="loginButton">로그인</button>
					
					<div id="noId">만약 계정이 없으시다면,<br>
						<a href="${pageContext.request.contextPath }/user/signup" id="goSignUp">회원가입</a>
					</div>
					<div id="findPw">비밀번호를 잊으셨나요?<br>
						<p  id="login-findPWButton">비밀번호 찾기</p>
					</div>
					
				</form>
			</div>
		</div>
	</div>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
	<script>
	$("#login-findPWButton").click(function() {
		console.log("ccccc");
		$("#pwModal").modal("show");
	});
	</script>
	
</body>
</html>