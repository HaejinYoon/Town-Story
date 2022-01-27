<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="b" tagdir="/WEB-INF/tags"%>

<!DOCTYPE html>

<html>
<head>
<meta charset="EUC-KR">
<title>회원가입</title>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.14.0/css/all.css" integrity="sha384-HzLeBuhoNPvSl5KYnjx0BT+WB0QEEqLprO+NBkkk5gbc67FTaL7XIGa2w1L0Xbgc" crossorigin="anonymous">
<link href="<%=request.getContextPath()%>/resource/favicon/favicon.png" rel="icon" type="image/x-icon" />
<style>
/*노랑 배경색 : #ffe164
  파랑 배경색 : #264d73
  빨간 포인트색 : #f0615c
  하늘색 배경색 : #eef2f6 */
* {
	font-family: 'Jua', sans-serif;
}

body {
	background-color: #ffe164;
}

#sign-up-body {
	height: auto;
	/* height: calc(100vh-72px); */
	width: 100%;
	justify-content: center;
	display: flex;
}

label {
	margin-bottom: 0;
}

#inner {
	/* width: 900px; */
	text-align: center;
	height: auto;
	align-items: center;
	background-color: #FFFFFF;
	border-radius: 15px;
	background-color: rgba(255, 255, 255, 0.5);
	margin-top: 50px;
	left: 50%;
	border: 4px solid;
	border-color: #2f6091;
}

#nicknameCheckMessage {
	color: #f0615c
}

.container mt-5 {
	height: auto;
}

.signUpMain {
	margin-bottom: 8px;
}

.row {
	border-radius: 15px;
	margin-left: 30px;
	margin-right: 30px;
}

#icon {
	background-color: #f5f5f5;
	padding: 7px 15px;
	height: 40px;
	border-bottom-right-radius: 4px;
	border-top-right-radius: 4px;
	border: 1px solid black;
	z-index: 999;
}

#submitButton1 {
	margin-top: 6px;
	margin-right: 2px;
	margin-left: 2px;
	border: 3px solid;
	border-color: #2f6091;
	color: white;
	background-color: #2f6091;
}

#alreadyHaveId {
	margin-top: 20px;
}

.input-group {
	width: 320px;
	margin: 0 auto;
}

.input-groupIdEmail {
	margin: 0 auto;
}

#input7, #input5, #input6, #input4, #input8 {
	width: 320px;
	background-color: rgba(255, 255, 255, 0.5);
	margin: 0 auto;
	border: 3px solid;
	border-color: #2f6091;
}

#input1 {
	background-color: rgba(255, 255, 255, 0.5);
	border: 3px solid;
	border-color: #2f6091;
}

#input2 {
	display: inline;
	width: 230px;
	background-color: rgba(255, 255, 255, 0.5);
	border: 3px solid;
	border-color: #2f6091;
}


#input3 {
	background-color: rgba(255, 255, 255, 0.5);
	margin: 0 auto;
	border: 3px solid;
	border-color: #2f6091;
}

#nicknameCheckButton, #emailCheckButton {
	border: 3px solid;
	border-color: #2f6091;
	padding-top: 0px;
	padding-bottom: 0px;
}

.bg-secondary {
	background-color: #FFFFFF;
	background-color: rgba(255, 255, 255, 0.5);
}

.border-bottom-left-radius {
	border-bottom-left-radius: 15px;
}

.border-bottom-right-radius {
	border-bottom-right-radius: 15px;
}

.place {
	margin-top: 8px;
}

.nickNameRed {
	color: #f0615c
}
small{
	width: 320px;
}
</style>
</head>
<body>
	<b:header></b:header>
	<div id="sign-up-body">
		<div id="inner">
			<%-- <b:innerNav></b:innerNav> --%>
			<div class="container mt-4">
				<!-- 입력 박스  -->
				<div class="row">
					<!-- <div class="col-md-4 border-bottom-left-radius">여기에 로고나 장식용 그림같은거 넣기</div> -->
					<!-- <div class="col-md-8  border border-5 border-bottom-right-radius"> -->
					<form method="post" enctype="multipart/form-data">
						<h3 class="signUpMain">회원가입 정보</h3>
						<div class="form-group">
							<label for="input1">아이디 및 별명</label>
							<%-- <input type="text" class="form-control input2" id="input1" required name="nickname" value="${user.nickname }">
										<button class="btn btn-secondary" id="nicknameCheckButton" type="button">중복확인</button> --%>
							<div class="input-group">
								<input type="text" class="form-control" id="input1" maxlength="10" required name="nickname" value="${user.nickname }">
								<div class="input-group-append">
									<button class="btn btn-outline-dark" id="nicknameCheckButton" type="button">중복확인</button>
								</div>
							</div>
							<small class="form-text" id="nicknameCheckMessage"></small>

						</div>
						<div class="form-group place">
							<label for="input2">비밀번호</label>
							<div class="input-group">
								<input type="password" class="form-control" id="input2" required name="pw" value="${user.pw }">
								<small class="form-text" id="pwCheckMessage"></small>
							</div>
						</div>

						<div class="form-group place">
							<label for="input7">비밀번호 확인</label>
							<br>
							<input type="password" class="form-control" id="input7" required>
						</div>

						<div class="form-group place">
							<label for="input3">이메일</label>
							<div class="input-groupIdEmail">
								<div class="input-group">
									<input type="email" class="form-control" id="input3" required name="email" value="${user.email }">
									<div class="input-group-append">
										<button class="btn btn-outline-dark" id="emailCheckButton" type="button">중복확인</button>
									</div>
								</div>
								<small class="form-text" id="emailCheckMessage"></small>
							</div>
						</div>

						<div class="form-group place">
							<label for="input5">지역 선택</label>
							<br>
							<select class="form-control" id="input5" required name="location" value="${user.location }">
								<optgroup label="소식을 전해듣고 싶은 지역을 선택해주세요.">
									<option>강남구</option>
									<option>마포구</option>
									<option>서초구</option>
								</optgroup>
							</select>
						</div>
						<div class="form-group">
							<label for="input6">프로필 사진</label>
							<input type="file" class="form-control-file" id="input6" name="file" accept="image/*" multiple>
				   		 </div>

						<!-- textarea로 바꿔서 여러줄로 나타낼 수 있음 -->
						<div class="form-group place">
							<label for="exampleFormControlTextarea1">자기소개</label>
							<textarea class="form-control" required name="introduce" 
							maxlength="200" id="input4" cols="40" rows="5" value="${user.introduce }" placeholder="나만의 개성을 나타낼수 있는 &#13;&#10;자기소개를 적어보세요! (최대 500글자)"></textarea>
						</div>
						<button class="btn btn-outline-dark btn-lg place" id="submitButton1">가입</button>
						<br>
						<div class="form-group">
							<p class="not-yet" id="alreadyHaveId">
								이미 아이디를 가지고 계신가요?
								<a href="../user/login">로그인</a>
							</p>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<script>
		$(document).ready(function() {

							// 중복체크, 변수선언
							const pwInput = $("#input2");
							const pwConfirmInput = $("#input7");
							const submitButton = $("#submitButton1");

							let emailAble = false;
							let nicknameAble = false;
							let pwCheck = false;

							// 이메일, 닉네임이 중복 안될경우 & pw체크까지 한 경우 서브밋 버튼 활성화
							let enableSubmit = function() {
								if (emailAble && pwCheck && nicknameAble) {
									submitButton.removeAttr("disabled");
								} else {
									submitButton.attr("disabled", true);
								}
							}

							const appRoot = '${pageContext.request.contextPath}';

							// 닉네임 중복 확인 버튼
							$("#nicknameCheckButton")
									.click(
											function() {

												const nicknameValue = $(
														"#input1").val().trim();
												// 닉네임을 안적었을 경우 닉네임 입력하라는 문구 출력
												if (nicknameValue === "") {
													$("#nicknameCheckMessage")
															.text(
																	"닉네임을 입력해주세요!!")
															.removeClass(
																	"text-primary text-danger")
															.addClass(
																	"nickNameRed");
													$("#nicknameCheckButton")
															.removeAttr(
																	"disabled");
													return;
												}

												// ajax 닉네임 중복 눌렀을경우 로직 (1. 사용 가능한 아이디  /  2. 중복되서 불가능한 아이디)

												$
														.ajax({
															url : appRoot
																	+ "/user/nicknamecheckForSignup",
															data : {
																nickname : nicknameValue
															},
															success : function(
																	data) {
																switch (data) {
																// 1. 사용 가능아이디
																case "able":

																	$(
																			"#nicknameCheckMessage")
																			.text(
																					"사용 가능한 닉네임 입니다.")
																			.removeClass(
																					"text-danger nickNameRed")
																			.addClass(
																					"text-primary");

																	nicknameAble = true;
																	break;
																// 2. 중복일 경우
																case "unable":

																	$(
																			"#nicknameCheckMessage")
																			.text(
																					"이미 존재하는 닉네임 입니다.")
																			.removeClass(
																					"text-warning text-primary")
																			.addClass(
																					"nickNameRed");

																	nicknameAble = false;
																	break;

																default:
																	break;
																}
															},
															complete : function() {
																enableSubmit();
																$(
																		"#nicknameButton")
																		.removeAttr(
																				"disabled");
															}
														});
											});
							$("#emailCheckButton")
									.click(
											function() {

												const emailValue = $("#input3")
														.val().trim();

												// 이메일을 안적었을 경우 이메일 입력하라는 문구 출력
												if (emailValue === "") {
													$("#emailCheckMessage")
															.text(
																	"email을 입력해주세요!!")
															.removeClass(
																	"text-primary text-danger")
															.addClass(
																	"nickNameRed");

													$("#emailCheckButton")
															.removeAttr(
																	"disabled");
													return;
												}

												// ajax 닉네임 중복 눌렀을경우 로직 (1. 사용 가능한 이메일  /  2. 중복되서 불가능한 이메일)

												$
														.ajax({
															url : appRoot
																	+ "/user/emailcheck",
															data : {
																email : emailValue
															},
															success : function(
																	data) {
																switch (data) {
																// 1. 사용 가능아이디
																case "able":

																	$(
																			"#emailCheckMessage")
																			.text(
																					"사용 가능한 이메일 입니다.")
																			.removeClass(
																					"text-danger nickNameRed")
																			.addClass(
																					"text-primary");

																	emailAble = true;
																	break;

																// 2. 중복일 경우
																case "unable":

																	$(
																			"#emailCheckMessage")
																			.text(
																					"이미 존재하는 이메일 입니다.")
																			.removeClass(
																					"nickNameRed text-primary")
																			.addClass(
																					"text-danger");

																	emailAble = false;
																	break;

																default:
																	break;
																}
															},
															complete : function() {
																enableSubmit();
																$(
																		"#emailButton")
																		.removeAttr(
																				"disabled");
															}

														});
											});
							// 비밀번호 서로 일치하는지 확인 
							const confirmFunction = function() {

								const pwValue = pwInput.val();
								const pwConfirmValue = pwConfirmInput.val();
								var reg = /^.*(?=^.{8,16}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
								
								var pwTest = reg.test(pwValue);
								
								if (pwTest && pwValue === pwConfirmValue) {
										
								
									pwCheck = true;
									$('#pwCheckMessage').text('비밀번호 확인 완료!')
														.removeClass("nickNameRed")
														.addClass("text-primary");
								
								} else if(!pwTest){
									
									pwCheck = false;
									$('#pwCheckMessage').text('형식에 맞지 않습니다(문자 / 숫자 / 특수문자 포함 형태의 8~16)')
														.removeClass("text-primary")
														.addClass("nickNameRed");

									
								}else if(pwValue !== pwConfirmValue){
									pwCheck = false;
									$('#pwCheckMessage').text('비밀번호를 다시 확인해주세요')
									.removeClass("text-primary ")
									.addClass("nickNameRed");
								}
									
								//일치 할 경우 서브밋 버튼 활성화
								enableSubmit();
							};

							submitButton.attr("disabled", true);
							pwInput.keyup(confirmFunction);
							pwConfirmInput.keyup(confirmFunction);

						});

	</script>
</body>
</html>