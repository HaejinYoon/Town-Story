<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<style>
#modal-body {
	color: #264d73;
}

.back-ground {
	background-color: #ffe164;
	border: 0px;
	  font-family: 'Jua', sans-serif;
}

.header-color {
	background-color: #264d73;
}

#exampleModalLabel {
	color: white;
}

#m_label {
	float: left;
	margin-top: -38px;
	background-color: #f5f5f5;
	padding: 7px 15px;
	height: 38px;
	border-bottom-left-radius: 4px;
	border-top-left-radius: 4px;
	border: 0px solid black;
	position: relative;
	z-index: 999;
}

#m_label {
	background-color: #ffe164;
	border: solid;
	border-color: #264d73;
}

#modal-email, #modal-pw {
	position: relative;
	padding-left: 52px !important;
	border: solid;
	border-color: #264d73;
	background-color: rgba(255, 255, 255, 0.7);
}

.modal-end {
	display: flex;
	justify-content: flex-end;
	align-items: flex-end;
	border-top-color: #264d73;
}
#modal-go-sign-up{
	display: flex;
	justify-content: flex-end;
	color:#f0615c;
	font-size:large;
}


#modal-login-button {
    background-color: #264d73;
    color: white;
    font-size: x-large;
        }


</style>
<!-- Modal HTML -->
<div id="myModal" class="modal fade " tabindex="-1">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content back-ground">

			<div class="modal-header header-color">
				<h5 class="modal-title" id="exampleModalLabel">로그인하기</h5>
				<button type="button" id="close" class="btn-close" data-bs-dismiss="modal">X</button>
			</div>
			<div class="modal-body " id="modal-body">
				<form action="${pageContext.request.contextPath }/user/login" method="post">
					<div class="mb-3">
						<label class="form-label">이메일</label>
						<input type="text" class="form-control" id="modal-email" name="email" placeholder="Email" />
						<label id="m_label" for="Profile-pic">
							<i class="fa fa-envelope modal-icon" aria-hidden="true"></i>
						</label>
					</div>
					<div class="mb-3">
						<label class="form-label">비밀번호</label>
						<input type="password" class="form-control" id="modal-pw" name="pw" placeholder="Password" />
						<label id="m_label" for="Profile-pic">
							<i class="fa fa-key modal-icon" aria-hidden="true"></i>
						</label>
					</div>
<!-- 					<div class="mb-3 form-check">
						<input type="checkbox" class="form-check-input" id="rememberMe" />
						<label class="form-check-label" for="rememberMe">아이디와 비밀번호 기억하기</label>
					</div> -->
					<div class="mb-3 form-check">
						<label class="form-check-label" id="findPWButton">비밀번호 찾기</label>
					</div>
					<div class="modal-footer modal-end">
						<p class="float-start">
							아직 계정이 없으시다면,
							<a href="/controller1/user/signup" id="modal-go-sign-up">회원 가입</a>
						</p>
						<button type="submit" id="modal-login-button" class="btn float-end">로그인</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script>
	$("#close").click(function() {
		$("#myModal").modal("hide");
	});
	
	$("#findPWButton").click(function() {
		$("#myModal").modal("hide");
		$("#pwModal").modal("show");
	});
</script>
