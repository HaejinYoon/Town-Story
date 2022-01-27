<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="b" tagdir="/WEB-INF/tags/"%>

<!DOCTYPE html>

<html>
<head>
<meta charset="EUC-KR">
<title>회원정보 수정</title>

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
#modify-body {
	height: auto;
	/* height: calc(100vh-72px); */
	width: 100%;
	justify-content: center;
	display: flex;
}
.row {
	border-radius: 15px;
	margin-left: 30px;
	margin-right: 30px;
}
label {
	margin-bottom: 0;
}
.container mt-4 {
	height: auto;
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

#icon {
	float: right;
	margin-top: -39px;
	background-color: #f5f5f5;
	padding: 7px 15px;
	height: 40px;
	border-bottom-right-radius: 4px;
	border-top-right-radius: 4px;
	border: 1px solid black;
	position: relative;
	z-index: 999;
}
.modifyMain {
	margin-bottom: 8px;
}

#submitButton1 {
	margin-top: 6px;
	margin-bottom: 10px;
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
.input-groupIdEmail{
	margin: 0 auto;
}

#input1 {
	background-color: rgba(255, 255, 255, 0.5);
	border: 3px solid;
	border-color: #2f6091;
}

#nicknameCheckButton{
	border: 3px solid;
	border-color: #2f6091;
	padding-top: 0px;
	padding-bottom: 0px;
}
#input2 {
	display: inline;
	width: 230px;
	background-color: rgba(255, 255, 255, 0.5);
	border: 3px solid;
	border-color: #2f6091;
}

#input2-1 {
	width: 320px;
}

#input7, #input5, #input6, #input4  {
	width: 320px;
	background-color: rgba(255, 255, 255, 0.5);
	margin: 0 auto;
	border: 3px solid;
	border-color: #2f6091;
}


.input2 {
   display: inline;
   width: 230px;
}
.input-group {
	width: 320px;
	margin: 0 auto;
}
.nickNameRed {
	color: #f0615c
}
#pwCheckMessage{
	width: 320px;
}

</style>
</head>

<body>
	<b:header></b:header>
	<div id="modify-body">
		<div id="inner">
		<div class="container mt-4">
			<div class="row">
				<form method="post" enctype="multipart/form-data">
					<h3 class= "modifyMain">회원정보 수정</h3>
					<div class="form-group">
						<label for="input1">아이디 및 별명</label>
						<div class="input-group">
							<input type="text" class="form-control" id="input1" maxlength="10" required name="nickname" value="${sessionScope.loginUser.nickname }">
							<div class="input-group-append">
								<button class="btn btn-outline-dark" id="nicknameCheckButton" type="button">중복확인</button>
							</div>
						</div>
						<small class="form-text" id="nicknameCheckMessage"></small>

					<!--  email hidden -->
					<input type="id" style="display:none" name="id" value="${sessionScope.loginUser.id }">
					
					</div>
					<div class="form-group">
						<label for="input2">비밀번호</label>
						<div class="input-group" id="input2-1">
							<input type="password" class="form-control" id="input2" required name="pw" value="${sessionScope.loginUser.pw }">
							<small class="form-text" id="pwCheckMessage"></small>
						</div>
					</div>

					<div class="form-group">
						<label for="input7">비밀번호 확인</label>
						<br> 
						<input type="password" class="form-control" id="input7" required>
					</div>


					<div class="form-group">
						<label for="input5">지역 선택</label> <br>
						 <select class="form-control" id="input5" required name="location">
							<optgroup label="소식을 전해듣고 싶은 지역을 선택해주세요.">
								<option>강남구</option>
								<option>마포구</option>
								<option>서초구</option>
							</optgroup>
						</select>
					</div>
					
					<table class="table table-hover table-bordered">
						<thead class="thead-dark">
							<tr>
								<th>선택(기존/변경)</th>
								<th>기존 이미지</th>
							</tr>
						</thead>
						<c:if test="${not empty user.url }">
							
								<tbody>
									<tr>
										<td>
											<div class="col d-flex justify-content-center align-items-center">변경하기
												<input class="check" type="checkbox" name="removeFile" value="${user.url}">
											</div>
										</td>
										<td rowspan="2">
										<c:choose>
										<c:when test="${user.fileName !='' }">
											<div class="col">
												<img class="img-fluid" width="160" height="160" src="${user.url}" >
											</div>
										
										</c:when>
										<c:when test="${user.fileName =='' }">
											<div class="col">
												<img class="img-fluid" width="160" height="160" src="${user.profileurl}" >
											</div>
										
										</c:when>
										</c:choose>
										</td>
									</tr>
									<tr>
										<td>
											<div class="col d-flex justify-content-center align-items-center">이전사진 그대로 사용하기
												<input class="check" type="checkbox" name="noImg">
											</div>
										</td>
									</tr>
								</tbody>
							
						</c:if>
					</table>
					
					<div class="form-group">
							<label for="input6">프로필 사진</label>
							<input type="file" class="form-control-file" id="input6" name="file" accept="image/*">
				   	</div>
					<!-- textarea로 바꿔서 여러줄로 나타낼 수 있음 -->
					<div class="form-group">
						<label for="exampleFormControlTextarea1">자기소개</label>
						<textarea class="form-control" required name="introduce" 
						id="input4" maxlength="200" cols="40" rows="5" placeholder="나만의 개성을 나타낼수 있는 자기소개를 적어보세요!(최대 500글자)">${sessionScope.loginUser.introduce }</textarea>
					</div>
					<button class="btn btn-outline-dark btn-lg place" id="submitButton1">수정</button>
				</form>
			</div>
		</div>
		</div>
	</div>

	<script>
		$(document).ready(function() {
				
				const pwInput = $("#input2");
				const pwConfirmInput = $("#input7");
				const appRoot = '${pageContext.request.contextPath}';
				const modifyButton = $("#submitButton1");


							let nicknameAble = false;
							let pwCheck = false;
							
							
						
							// 패스워드 확인과 닉네임 중복확인이 완료되었을 때만 수정버튼 활성화
							
							let enableSubmit = function() {
								if (pwCheck && nicknameAble) {
									modifyButton.removeAttr("disabled");
								} else {
									modifyButton.attr("disabled", true);
								}
							}

							// nicknameCheckButton 클릭 시 -> user/nicknameCheck 이동 후 확인
							// 받은 결과에 따라 수정버튼 활성화 또는 비활성화 AND 적절한 메세지 출력
							$("#nicknameCheckButton").click(
									
											function() {
												$("#nicknameCheckButton").attr("disabled", true);

												const nickname = $("#input1").val().trim();

												if (nickname === "") {
													$("#nicknameCheckButton").removeAttr("disabled");
													return;
												}

												$.ajax({
															url : appRoot + "/user/nicknamecheck",
															
															data : {
																nickname : nickname
															},
															success : function(data) {
																switch (data) {
																case "able":
																	// 사용가능 할 때
																	$("#nicknameCheckMessage")
																			.text("사용 가능한 닉네임입니다.")
																			.removeClass("text-warning text-danger")
																			.addClass("text-primary");


																	nicknameAble = true;
																	break;

																case "unable":
																	// 사용 불가능 할 때
																	$("#nicknameCheckMessage")
																			.text("이미 있는 닉네임입니다.")
																			.removeClass("text-warning text-primary")
																			.addClass("text-danger");

																	nicknameAble = false;
																	
																	break;
																	
																case "same":
																	// 같을 때
																	$("#nicknameCheckMessage")
																			.text("기존 닉네임입니다.")
																			.removeClass("text-warning text-danger")
																			.addClass("text-primary");

																	nicknameAble = true;
																	
																	break;
																	
																default:
																	break;
																}
															},
															complete : function() {
																enableSubmit();
																$("#nicknameCheckButton").removeAttr("disabled");
															}
														});
											});
							
							// 패스워드, 패스워드확인 인풋요소 값 일치할 때만 수정버튼 활성화
							
						
							
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
									$('#pwCheckMessage').text('비밀번호 형식에 맞지 않습니다(문자 / 숫자 / 특수문자 포함 형태의 8~16)')
														.removeClass("text-primary")
														.addClass("nickNameRed");

									
								}else if(pwValue !== pwConfirmValue){
									pwCheck = false;
									$('#pwCheckMessage').text('비밀번호를 다시 확인해주세요')
									.removeClass("text-primary")
									.addClass("nickNameRed");
								}
									
								//일치 할 경우 서브밋 버튼 활성화
								enableSubmit();
							};
			
							modifyButton.attr("disabled", true);
							pwInput.keyup(confirmFunction);
							pwConfirmInput.keyup(confirmFunction);
						
				$('input[type="checkbox"]').click(function(){
								 
					
								  if($(this).prop('checked')){
								 
								     $('input[type="checkbox"]').prop('checked',false);
								 
								     $(this).prop('checked',true);
								 
								    }
								if($('input[name="noImg"]').prop('checked')){
								
								$("#input6").attr("disabled",true);

							}
								if($('input[name="removeFile"]').prop('checked')){
									
									$("#input6").attr("disabled",false);

								}
						});
							
			});
							
		</script>
</body>
</html>














