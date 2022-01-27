<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="b" tagdir="/WEB-INF/tags/"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="EUC-KR">
<title>내 프로필</title>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />


<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<link href="<%=request.getContextPath()%>/resource/favicon/favicon.png" rel="icon" type="image/x-icon" />

<style>
a {
	text-decoration: none;
	color: inherit;
}

a:hover {
	text-decoration: none;
	color: inherit;
}

#body {
	height: auto;
	/* height: calc(100vh-72px); */
	width: 100%;
	justify-content: center;
	display: flex;
}

#inner {
	width: 900px;
	height: 100%;
}

#profile-modify {
	background-color: #264d73;
	color: white;
	font-size: large;
}

#profile-remove {
	background-color: #f0615c;
	color: white;
	font-size: large;
	/* margin-top: 5px; */
}

#img-profile {
	width: 200px;
	height: 200px;
	max-width: 200px;
	max-height: 200px;
	object-fit: cover;
}

#profilebox {
	background-color: #eef2f6;
	border: 3px solid #264d73;
	border-radius: 10px;
	border-color: #264d73;
}

/* #profilebox{
	font-family: 'IBM padding: ;lex Sans KR', sans-serif;
	} */
table {
	border-radius: 0.7em;
	overflow: hidden;
}

.프로필-수정삭제버튼 {
	margin-top: 40px;
}
.프로필-닉네임{
font-weight: bold;
}

#selfintro {
	border-style: hidden;
	box-shadow: 0 0 0 2px #264d73;
	margin-bottom: 30px;
	margin-top: 30px;
	font-family: 'IBM padding: ;lex Sans KR', sans-serif;
}

#selfintrohead {
	background-color: #264d73;
	color: white;
	font-size: 20px;
	padding-left: 30px;
}

#selfintrobody {
	background-color: white;
	font-size: 20px;
	padding-left: 30px;
}

#userintrohead {
	padding-left: 20px;
}

#userintrobody {
	white-space: pre-wrap;
	margin-bottom: 0px;
	margin-left: 10px;
}
.프로필-내가-쓴-글{
font-weight:bold;
font-family: 'IBM padding: ;lex Sans KR', sans-serif;
}
#mypost {
	border-style: hidden;
	box-shadow: 0 0 0 2px #264d73;
	margin-bottom: 30px;
	margin-top: 10px;
	font-family: 'IBM padding: ;lex Sans KR', sans-serif;
}

#myposthead {
	background-color: #264d73;
	color: white;
	text-align: center;
}

#mypostbody {
	background-color: white;
	text-align: center;
}
</style>
</head>
<body>

	<b:header></b:header>
	<div id="body">
		<div id="inner">
			<b:innerNav></b:innerNav>
			<div id="profilebox" class="container-fluid my-1">
				<div class="row md mx-3 mt-4 mb-2">
					<c:choose>
						<c:when test="${user.fileName !='' }">
							<div class="col-md-3 my-auto align-self-center ">

								<img src="${user.url}" id="img-profile" class="img-thumbnail rounded-circle mx-auto d-block " alt="..." />
							</div>

						</c:when>
						<c:when test="${user.fileName =='' }">
							<div class="col-md-3 my-auto align-self-center ">

								<img src="${user.profileurl}" id="img-profile" class="img-thumbnail rounded-circle mx-auto d-block " alt="..." />
							</div>

						</c:when>
					</c:choose>
					<div class="col-md-9 프로필-수정삭제버튼">
						<div class="col-md-12 mx-3 my-auto align-self-center 프로필보기-개인정보">
							<div class="h1 프로필-닉네임">${user.nickname }</div>
							<span class="h4 mt-3">${user.location }</span>
							<span class="h4 mt-3 ms-3">#${user.id }</span>
							<div class="h4 mt-3">${user.signupday }</div>
						</div>
	
						<c:if test="${not empty sessionScope.loginUser && sessionScope.loginUser.id eq user.id}">
	
							<div class="col-md-12 mx-auto my-auto 프로필보기-수정-탈퇴-버튼 text-right">
								<button type="button" id="profile-modify" class="btn btn-lg">정보수정</button>
								<button type="button" id="profile-remove" class="btn btn-lg ">회원탈퇴</button>
							</div>
	
						</c:if>
					</div>
				</div>
				<div class="container">
					<div class="row">
						<div class="col">
							<table id="selfintro" class="table">
								<thead id="selfintrohead">
									<tr>
										<th id="userintrohead">인사글</th>
									</tr>
								</thead>
								<tbody id="selfintrobody">
									<tr>
										<td>
											<p id="userintrobody">${user.introduce }</p>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>

				<!-- 내가 쓴 글 테이블 -->
				<div class="container">
					<div class="row">
						<div class="col">
							<h3 class="프로필-내가-쓴-글">내가 쓴 글</h3>
							<table id="mypost" class="table">
								<thead id="myposthead">
									<tr>
										<th>게시판</th>
										<th>Tag(태그)</th>
										<th>제목</th>
										<th>작성 일자</th>
									</tr>
								</thead>
								<tbody id="mypostbody">
									<c:forEach items="${list }" var="list">
										<tr>
											<td>
												<a href="/controller1/${list.link}/list">${list.boardType }</a>
											</td>
											<td>
												<a href="/controller1/${list.link }/list?tag=${list.tag }"> ${list.tag } </a>
											</td>
											<td>
												<a href="/controller1/${list.link}/list/${list.postId}"> ${list.title } </a>
											</td>
											<td>${list.inserted }</td>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		$("#profile-modify").click(function() {
			location.href = "/controller1/user/infoModify"
		});

		$("#profile-remove").click(function() {
			location.href = "/controller1/user/remove"
		});
	</script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>

</body>
</html>