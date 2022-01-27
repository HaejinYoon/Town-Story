<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri= "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


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

#removeText {
	color: #3e4041;
	position: relative;
	margin-bottom:45px; 
}

#remove {
	position: absolute;
	width: 600px;
	height: 500px;
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



#pw {
	background-color: rgba(255, 255, 255, 0.5);
	text-align: center;
	border: 3px solid;
	border-color: #2f6091;
	
}
#lead{
	position: relative;
	margin-bottom:5px;
}
.context{
	text-align: left;
	position: relative;
	margin-bottom:10px;
	margin-top: 15px;
}
#pwCheckMessage{
	color: #f0615c
}
</style>
<title>회원탈퇴</title>
</head>
<body>

	<div class="container">
		<div class="row" id="remove">
			<div class="col">
				<br>
				<h1 id="removeText">회원탈퇴</h1>
					<form method="post" id = "removeForm">
    			
                	<div class="lead">${sessionScope.loginUser.nickname }님! 탈퇴 확인을 위해, 본인 계정의 비밀번호를 입력해주세요!</div>
                <!--  email hidden -->
                	<div class="remove-group email" style="display: none;">
						<input type="email"  name="email" value="${sessionScope.loginUser.email }">
					</div>	
                   	<div class="remove-group">
                   		<input type="password" id = "pw" required name="pw" class="form-control form-control-inline text-center" placeholder="탈퇴 확인을 위한 비밀번호" />
               	 	</div>
              	 	<c:if test="${msg == false}">
						<small id="pwCheckMessage">비밀번호가 맞지 않습니다</small>
					</c:if>
    				<div class="context">
    					<h5>* 아래 조항을 반드시 읽고 동의하신다면 체크해 주세요 *</h5>
    						<ul style="border:1px dashed red;" >
    							<li>탈퇴하셔도 다른 올뺌들이 ${sessionScope.loginUser.nickname}님의 게시글을 읽을 수 있어요</li>
    							<li>사용하신 아이디(${sessionScope.loginUser.nickname})는 복구가 불가능해요</li>
    							<li>다른 올뺌들이 슬퍼해요</li>
    							<li>노력하는 '올뺌'이 되겠습니다..!!</li>
    							<li>다음에 오셨을 땐, 사이트가 더 발전해있을거에요!!!</li>
    						</ul>
    					<input class="check" type="checkbox" name="agree"><span> 동의합니다.</span> 
    				</div>
                	<button type="button" id="removeButton" name="remove" class="btn btn-danger">회원탈퇴</button> <a href="../user/profile/${sessionScope.loginUser.nickname }" class="btn btn-primary">취소</a>
    				</form>
            </div>
    		
			
		</div>
	</div>
	
	<script>
	$(document).ready(function(){
		
		const removeButton = $("#removeButton");
		removeButton.attr("disabled", true);
		
		$('input[type="checkbox"]').click(function(){
			
			if($(this).prop('checked')){
				removeButton.removeAttr("disabled");
			}else{
				removeButton.attr("disabled", true);
			}
		})
		$("#removeButton").click(function(e) {
			if($("#pw").val()==""){
				alert("비밀번호를 입력해주세요.");
				$("#pw").focus();
				return false;
			}	
			
			if(confirm("정말 탈퇴 하시겠어요?? ㅜㅜ")){
                removeForm.submit();
            }
		});
	
	});
	

             
	</script>
	
</body>
</html>