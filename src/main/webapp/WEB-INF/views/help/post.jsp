<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="b" tagdir="/WEB-INF/tags/"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="EUC-KR">
<title>${post.title}-${post.nickname}</title>

<!-- 게시물 상세보기 페이지 -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
	integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn"
	crossorigin="anonymous">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
	integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />


<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
	integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
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
	height: 120vh;
	/* height: calc(100vh-72px); */
	width: 100%;
	justify-content: center;
	display: flex;
}

#inner {
	border: 2px;
	width: 900px;
	height: auto%;
}

#postBody {
	width: 100%;
	border: 3px solid #264d73;
	border-radius: 10px;
	margin-top: 5px;
	background-color: #eef2f6;
	margin-bottom: 40px;
	padding-block: 15px;
	padding-right: 15px;
	padding-left: 15px;
	/* letter-spacing: 1px; */
}

.상세보기-헤더 {
	padding-bottom: 10px;
}

.상세보기-게시물-내용 {
	border-bottom-color: darkgray;
	border-bottom-style: solid;
	margin-bottom: 10px;
}

.게시물-조회수-작성시간 {
	font-weight: 200;
	font-size: 17px;
}

#tag {
	font-size: large;
	font-weight: bold;
	text-align: center;
	justify-content: center;
	border-radius: 5px;
	border: 3px solid #f0615c;
	background-color: white;
}

#buttonmenu {
	margin-bottom: 10px;
}

.상세보기-제목 {
	font-weight: bold;
}

.상세보기-업로드이미지-배경 {
	color: black;
	background-color: #ffe164;
	border-top-right-radius: 8px;
	border-top-left-radius: 8px;
	border-top: none;
	border-top-width: 0px;
}

.table thead th {
	border-bottom: none;
}

#id {
	font-size: large;
}

.상세보기-본문 {
	font-size: large;
	white-space: pre-wrap;
	word-wrap: break-word;
}

.게시글-수정-삭제, .게시글-목록가기 {
	background-color: #264d73;
	color: white;
	font-weight: bold;
}

.table th {
	border-bottom: none;
}

.table td, .table th {
	padding: 0.5rem;
}

.상세보기-이미지 {
	width: 50%;
}

/* 댓글 관련------------------------------------- */
table {
	border-radius: 0.7em;
	overflow: hidden;
}

.table {
	margin-bottom: 0rem;
}

.table td {
	vertical-align: middle;
}

/* .img-thumbnail{
max-width:50%;
} */
/* th, td {

  padding: 1em;

  border-bottom: 2px solid white; 

} */
#replyListContainer {
	margin-top: 16px;
}

.기본댓글-테이블 {
	border-style: hidden;
	box-shadow: 0 0 0 2px #264d73;
	margin-bottom: 0px;
	margin-top: 10px;
}

#userprofile {
	height: 60px;
	width: 90px;
}

#replyhead {
	background-color: #264d73;
	color: white;
}

#replybody {
	background-color: white;
}

.replyinput {
	padding-block: 15px;
	padding-inline: 0px;
}

#replyTextarea {
	padding: 5px;
	border: 2px solid #264d73;
}

#sendReply {
	margin-top: 15px;
	height: 60px;
	padding-top: 12px;
	background-color: #264d73;
	color: white;
}

.댓글아이콘 {
	border-bottom: solid 2px;
	margin: 0px;
}

.댓글입력창 {
	border-bottom: solid 2px;
	margin: 0px;
}

.상세보기-댓글칸 {
	padding-right: 0px;
}

#reply-profile {
    width: 45px;
    height: 45px;
    max-width: 45px;
    max-height: 45px;
    object-fit: cover;
}

#reply-nickname {
	width: 460px;
	font-weight: bold;
}

#replymenu {
	width: 105px;
}

#replytime {
	vertical-align: middle;
}

#reply-time {
	vertical-align: middle;
	font-size: 17px;
	float: right;
	font-weight: 500;
	white-space: nowrap;
}

#rereplyfold {
	text-align: center;
}

.대댓글-작성-이모티콘 {
	border: none;
	background-color: white;
}

.대댓글달기-이모티콘 {
	color: #264d73;
}
.대댓글달기-이모티콘:hover{
	color:#b3b3ff;
}

.댓글-내용칸-패딩없애기 {
	padding-left: 0px;
}

.댓글-내용칸 {
	padding-left: 0px;
}

#replyModify {
	width: 40px;
	margin-right: 5px;
}

/* 댓글 관련 끝 ----------------------------------*/
.댓글-신고버튼, .대댓글-신고버튼 {
	float: right;
}
/* 대댓글 관련 ----------------------------------*/
.대댓글-테이블 {
	border-style: hidden;
	box-shadow: 0 0 0 2px #264d73;
}

.대댓글-아이콘 {
	margin: 7px;
}

.대댓글-위치 {
	width: 97%;
	margin-left: 30px;
}

.상세보기-대댓글-전송이모티콘 {
	border-top-left-radius: none;
	border-bottom-left-radius: none;
	background-color: #b3cae6;
}

#rereplyhead {
	background-color: #b3cae6;
}

#rereplybody {
	background-color: white;
}

#rereply-profile {
	width: 45px;
    height: 45px;
    max-width: 45px;
    max-height: 45px;
    object-fit: cover;
}

#rereply-nickname {
	font-weight: bold;
	width: 440px;
}

#rereplytime {
	vertical-align: middle;
}

#rereply-time {
	vertical-align: middle;
	font-size: 17px;
	float: right;
	font-weight: 500;
	vertical-align: middle;
	white-space: nowrap;
}

.re-reply-modi{
margin-left: 90px;
}
.rereplyinput {
	padding-inline: 0px;
	margin-top: 10px;
}

.re-reply-input {
	padding: 5px;
	border: 2px solid #264d73;
	margin-left: 20px;
	margin-right:0px;
}

.대댓글-내용칸 {
	white-space: pre-wrap;
	overflow: initial;
	word-break: break-all;
	padding-left: 90px;
}

.send-rereply-btn {
	color: black;
	height: 64px;
	border-radius: 5px;
}

#rereplyModify {
	margin-right: 5px;
}


.대댓글-전체아래마진 {
	margin-bottom: 20px;
}
#replyModify,#replyDelete,#rereplyModify,#rereplyDelete{
background-color: #eef2f6;
}
#상세보기-프로필{
	width : 65px;
	height : 65px;
	max-width : 65px;
	max-height : 65px;
	object-fit: cover;
}
/* 대댓글 관련 끝 ----------------------*/
</style>
</head>
<body>

	<b:header></b:header>
	<div id="body">
		<div id="inner">
			<b:innerNav></b:innerNav>
			<div id="postBody">
				<div class="container-fluid 상세보기-게시물-내용">
					<!-- 헤더 -->
					<div class="row md ms-4 px-2 align-middle 상세보기-헤더 상세보기-게시물-내용">
						<div class="col-md-1 px-1 py-0 my-0">
							<!--  img id="상세보기-프로필" 
							src="${post.url }" class="img-thumbnail rounded-circle mx-auto d-block " alt="..." />-->
						<c:choose>
							<c:when test="${post.fileName !='' }">
							<img src="${post.url}"  id="상세보기-프로필" class="img-thumbnail rounded-circle mx-auto d-block " alt="..." />
							</c:when>
							<c:when test="${post.fileName =='' }">
							<img src="${post.profileurl}"  id="상세보기-프로필" class="img-thumbnail rounded-circle mx-auto d-block " alt="..." />
							</c:when>
						</c:choose>
						</div>
						
						<div class="col-md-7 my-auto h2 align-middle 상세보기-제목"> 
							<a href = "${pageContext.request.contextPath }/user/profile/${post.nickname}"> ${post.nickname} (${post.location })</a>
						</div>

						<div class=" my-auto h4 ml-auto 게시물-조회수-작성시간">
							<i class="fas fa-eye "></i>
							${post.views } ||
							<i class="far fa-calendar-alt"></i>
							${post.inserted}
							<c:if test="${post.inserted ne post.updated}">(수정됨)</c:if>
						</div>
					</div>

					<!-- body -->
					<div class="row md ms-4 my-2 align-middle">

						<!-- tag -->
						<div class="col-md-2 my-auto px-auto 상세보기-태그">
							<div id="tag">${post.tag }</div>
						</div>
						<!-- 제목  -->
						<div class="col-md-10 h4 my-auto 상세보기-제목">
							<c:out value="${post.title}" />
						</div>
						<div class="row md mx-3 my-2 ">
							<div id="line"></div>
						</div>
						<!-- 내용  -->

					</div>
					<div id="내용" class="h4 my-auto ">
						<pre class="상세보기-본문"><c:out value="${post.content}" /></pre>
					</div>
				</div>

				<!-- footer -->
				<div class="row md mx-4 d-flex justify-content-center">
					<div id="upview" class="col-md-4 d-flex justify-content-center">
						<!-- 좋아요 아이콘 -->
					</div>
				</div>

				<!-- 버튼 메뉴, 수정/삭제, 목록 -->
				<div id="buttonmenu" class="row d-flex justify-content-between">
					<div class="col-md-auto my-auto px-auto ">
						<c:if test="${sessionScope.loginUser.id eq post.memberId || sessionScope.loginUser.adminQuali eq 1 }">
							<a href="${pageContext.request.contextPath }/help/modify?id=${post.id }" class="btn btn-outline-secondary 게시글-수정-삭제"> 
							<i class="fas fa-eraser"></i> 수정 / 삭제 </a>
						</c:if>
					</div>

					<div class="col-md-auto my-auto px-auto">
						<a href="${pageContext.request.contextPath }/help/list" class="btn btn-outline-secondary 게시글-목록가기">
							<i class="fas fa-list"> 목록</i>
						</a>
					</div>
				</div>

				<!-- <input type="text" class="form-control" id="input2" readonly=""> -->
				<div class="md my-3">
					<table class="table table-borderless">
						<thead class="thead">
							<tr>
								<th class="상세보기-업로드이미지-배경">Uploaded Images</th>
							</tr>
						</thead>
						<c:if test="${not empty post.fileList }">
							<c:forEach items="${post.fileList }" var="file" varStatus="vs">
								<tbody>
									<tr style="text-align: center;">
										<td>
											<img class="img-fluid 상세보기-이미지" style="width: 50%;" src="${file.url}" alt="${file.fileName}">
										</td>
									</tr>
								</tbody>
							</c:forEach>
						</c:if>
					</table>
				</div>

				<!-- 댓글 창 -->
				<!-- 로그인 하고 같은 지역의 사용자에게만 보여야 한다. -->

				<div class="row 댓글아이콘 justify-content-between">
					<div style="margin-bottom: 0px;" class="replyCount fa-2x">
						<i class="far fa-comment-dots fa-lg cnt" style="background-color: #ffe164;"></i>
					</div>
					<button class="btn btn-danger" style="height: fit-content;" data-toggle="modal" data-target="#reportModal1">
						<i class="fas fa-exclamation-triangle"> 신고</i> 
					</button>
				</div>
				<div class="row 댓글입력창">
					<c:if test="${not empty sessionScope.loginUser && sessionScope.loginUser.location eq post.location}">
						<div class="col-10 replyinput">
							<textarea id="replyTextarea" class="form-control" placeholder="댓글을 남겨보세요!"></textarea>
						</div>
						<div class="col-2 상세보기-댓글칸">
							<button id="sendReply" class="btn btn-block d-flex justify-content-center ">
								<i class="far fa-paper-plane fa-2x 상세보기-댓글-이모티콘"></i>
							</button>
						</div>
					</c:if>
				</div>
				<div id="replyListContainer" ></div>
				</div>
			</div>
		</div>
		<!-- 태그 -->

		<!-- Result Modal -->
		<c:if test="${not empty result }">
			<div class="modal" tabindex="-1" id="modal1">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title">Process Result</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
							<p>${result }</p>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">Close</button>
						</div>
					</div>
				</div>
			</div>
		</c:if>
		
	<!-- 게시물 신고 버튼 모달 -->
	<div class="modal fade" id="reportModal1" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel" style="color: black;">게시물을 신고하시겠습니까?</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<c:choose>
						<c:when test="${post.reportCount<5 }">
							<form method="post" id="reportForm">
								<input type="hidden" class="form-control" id="reportinput1" name="boardName" value="해주세요">
								<input type="hidden" class="form-control" id="reportinput4" name="categories" value="게시글">
								<div class="form-group">
									<label for="reportinput2">작성자</label>
									<input type="text" class="form-control" id="reportinput2" name="nickname" value="${post.nickname }님" readonly>
								</div>
								<div class="form-group">
									<label for="reportinput3">제목</label>
									<input type="text" class="form-control" name="title" value="${post.title}" id="reportinput3" readonly>
								</div>
								<div class="form-group">
									<label for="reportReason">태그</label>
									<select class="form-control" id="reportReason" name="tag">
										<optgroup label="태그를 선택해주세요.">
											<option value="욕설/타인 비하" selected>욕설/타인 비하</option>
											<option value="부적절한 사진">부적절한 사진</option>
											<option value="허위사실 유포">허위사실 유포</option>
											<option value="타인의 개인정보 유출">타인의 개인정보 유출</option>
											<option value="기타">기타</option>
										</optgroup>
									</select>
								</div>
								<div id="reasonDetailTextArea" class="form-group" style="display: none">
									<label for="reportReasonDetail">기타 사항</label>
									<textarea class="form-control" id="reportReasonDetail" name="reasonDetail" placeholder="기타 사항의 경우 작성해 주세요"></textarea>
								</div>
							</form>
						</c:when>
						<c:otherwise>
							<p id="replyReportOnProgress">
								신고가 누적되어 처리중입니다.<br>
							</p>
						</c:otherwise>
					</c:choose>
				</div>
				<div class="modal-footer">
					<button id="reportSubmitButton" type="submit" class="btn btn-danger">
						<i class="fas fa-bullhorn"> 신고</i>
					</button>
					<button type="button" id="reportCancel" class="btn btn-secondary" data-dismiss="modal">취소</button>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 댓글 신고 버튼 모달 -->
	<div class="modal fade" id="replyReportModal1" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel" style="color: black;">댓글을 신고하시겠습니까?</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="replyReportModalBody modal-body">
					<form method="post" id="replyReportForm">
						<input type="hidden" class="form-control" id="replyreportinput1" name="boardName" value="해주세요">
						<input type="hidden" class="form-control" id="replyreportinput4" name="categories" value="댓글">
						<input type="hidden" class="form-control" id="replyreportinput5" name="helpReplyId" value="">
						<div class="form-group">
							<label for="reportinput2">작성자</label>
							<input type="text" class="form-control" id="replyreportinput2" name="nickname" value="" readonly>
						</div>
						<div class="form-group">
							<label for="replyreportinput3">댓글 내용</label>
							<input type="text" class="form-control" id="replyreportinput3" name="title" value="" readonly>
						</div>
						<div class="form-group">
							<label for="replyReportReason">태그</label>
							<select class="form-control" id="replyReportReason" name="tag">
								<optgroup label="태그를 선택해주세요.">
									<option value="욕설/타인 비하" selected>욕설/타인 비하</option>
									<option value="허위사실 유포">허위사실 유포</option>
									<option value="타인의 개인정보 유출">타인의 개인정보 유출</option>
									<option value="기타">기타</option>
								</optgroup>
							</select>
						</div>
						<div id="replyReasonDetailTextArea" class="form-group" style="display: none">
							<label for="replyReportReasonDetail">기타 사항</label>
							<textarea class="form-control" id="replyReportReasonDetail" name="reasonDetail" placeholder="기타 사항의 경우 작성해 주세요"></textarea>
						</div>
					</form>
					<p id="replyReportOnProgress" style="display: none;">
						신고가 누적되어 처리중입니다.<br>
					</p>
				</div>
				<div class="replyReportModalFooter modal-footer">
					<button id="replyReportSubmitButton" type="submit" class="btn btn-danger">
						<i class="fas fa-bullhorn"> 신고</i>
					</button>
					<button type="button" id="replyReportCancel" class="btn btn-secondary" data-dismiss="modal">취소</button>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 대댓글 신고 버튼 모달 -->
	<div class="modal fade" id="rereplyReportModal1" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel" style="color: black;">대댓글을 신고하시겠습니까?</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="rereplyReportModalBody modal-body">
					<form method="post" id="rereplyReportForm">
						<input type="hidden" class="form-control" id="rereplyreportinput1" name="boardName" value="해주세요">
						<input type="hidden" class="form-control" id="rereplyreportinput4" name="categories" value="댓글">
						<input type="hidden" class="form-control" id="rereplyreportinput6" name="helpReplyId" value="">
						<input type="hidden" class="form-control" id="rereplyreportinput5" name="helpReReplyId" value="">
						<div class="form-group">
							<label for="reportinput2">작성자</label>
							<input type="text" class="form-control" id="rereplyreportinput2" name="nickname" value="" readonly>
						</div>
						<div class="form-group">
							<label for="replyreportinput3">댓글 내용</label>
							<input type="text" class="form-control" id="rereplyreportinput3" name="title" value="" readonly>
						</div>
						<div class="form-group">
							<label for="rereplyReportReason">태그</label>
							<select class="form-control" id="rereplyReportReason" name="tag">
								<optgroup label="태그를 선택해주세요.">
									<option value="욕설/타인 비하" selected>욕설/타인 비하</option>
									<option value="허위사실 유포">허위사실 유포</option>
									<option value="타인의 개인정보 유출">타인의 개인정보 유출</option>
									<option value="기타">기타</option>
								</optgroup>
							</select>
						</div>
						<div id="rereplyReasonDetailTextArea" class="form-group" style="display: none">
							<label for="rereplyReportReasonDetail">기타 사항</label>
							<textarea class="form-control" id="rereplyReportReasonDetail" name="reasonDetail" placeholder="기타 사항의 경우 작성해 주세요"></textarea>
						</div>
					</form>
					<p id="rereplyReportOnProgress" style="display: none;">
						신고가 누적되어 처리중입니다.<br>
					</p>
				</div>
				<div class="rereplyReportModalFooter modal-footer">
					<button id="rereplyReportSubmitButton" type="submit" class="btn btn-danger">
						<i class="fas fa-bullhorn"> 신고</i>
					</button>
					<button type="button" id="rereplyReportCancel" class="btn btn-secondary" data-dismiss="modal">취소</button>
				</div>
			</div>
		</div>
	</div>


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF"
		crossorigin="anonymous"></script>
	<script>
	$(document).ready(function(){
		// innerNav 탭 active 표시
		$("#help").attr("class", "btn btn-outline ml-1 active");
		
		if('${post.reportCount}'>=5){
			$("#reportSubmitButton").hide();
			$("#reportCancel").text("닫기");
			
		}
		// 신고 사유 select가 '기타'일 때 텍스트 입력창을 나타냄
		$("#reportReason").click(function(e) {
			if(($("#reportReason").val()) === '기타'){
				$("#reasonDetailTextArea").show();
			}else{
				$("#reasonDetailTextArea").hide();
			}
		});
		$("#replyReportReason").click(function(e) {
			if(($("#replyReportReason").val()) === '기타'){
				$("#replyReasonDetailTextArea").show();
			}else{
				$("#replyReasonDetailTextArea").hide();
			}
		});
		$("#rereplyReportReason").click(function(e) {
			if(($("#rereplyReportReason").val()) === '기타'){
				$("#rereplyReasonDetailTextArea").show();
			}else{
				$("#rereplyReasonDetailTextArea").hide();
			}
		});
		// 게시글 신고하기, 버튼 누르면 db에 인서트
		$("#reportSubmitButton").click(function(e) {
			const appRoot = '${pageContext.request.contextPath}';
			
			const boardName = $("#reportinput1").val(); // 이 게시판은 어디 게시판인가
			const boardUrl =$(location).attr("href"); // 현재 게시물의 url
			const categories = $("#reportinput4").val(); // 신고 대상이 게시판인지 댓글인지 구분
			const title = '${post.title}'; // 현재 게시물의 제목
			const nickname = '${post.nickname}'; // 현재 게시물의 작성자
			const reason = $("#reportReason").val(); // select에서 선택한 신고사유
			const reasonDetail = $("#reportReasonDetail").val(); // select가 '기타'일 때 사용자가 직접 입력한 신고 사유 내용
			const helpId = '${post.id}'; // 현재 게시판의 id, 동네 소식 게시판이 된다면 newsId가 됨.
			const report = {
				boardName : boardName,
				boardUrl : boardUrl,
				categories : categories,
				title : title,
				nickname : nickname,
				reason : reason,
				reasonDetail : reasonDetail,
				helpId : helpId,
			};
			console.log(report);
			$.ajax({
	        	url : appRoot + "/reportajax/register",
				type : "post",
				data : report,
				success : function() {
					alert("신고가 정상적으로 접수되었습니다.")
				},
				error : function(){
					alert("로그인을 하신 뒤 다시 시도해주세요.")
				},
				complete : function() {
					$('#reportModal1').modal('hide');
					$("#reportForm").empty().html('<p>이미 신고한 게시물입니다.</p>');
					$("#reportSubmitButton").hide();
					$("#reportCancel").text("닫기");
				}
			});
		});// 게시글 신고 끝
		
		// 댓글 신고하기 버튼 누르면 db에 인서트
		$("#replyReportSubmitButton").click(function(e) {
			const appRoot = '${pageContext.request.contextPath}';
			
			const boardName = $("#replyreportinput1").val(); // 이 게시판은 어디 게시판인가
			const boardUrl =$(location).attr("href"); // 현재 게시물의 url
			const categories = $("#replyreportinput4").val(); // 신고 대상이 게시판인지 댓글인지 구분
			const title = $("#replyreportinput3").val(); // 현재 게시물의 제목
			const nickname = $("#replyreportinput2").val(); // 현재 게시물의 작성자
			const reason = $("#replyReportReason").val(); // select에서 선택한 신고사유
			const reasonDetail = $("#replyReportReasonDetail").val(); // select가 '기타'일 때 사용자가 직접 입력한 신고 사유 내용
			const helpId = '${post.id}'; // 현재 게시판의 id, 동네 소식 게시판이 된다면 newsId가 됨.
			const helpReplyId = $("#replyreportinput5").val();//댓글 id
			const report = {
				boardName : boardName,
				boardUrl : boardUrl,
				categories : categories,
				title : title,
				nickname : nickname,
				reason : reason,
				reasonDetail : reasonDetail,
				helpId : helpId,
				helpReplyId : helpReplyId
			};
			$.ajax({
	        	url : appRoot + "/reportajax/register",
				type : "post",
				data : report,
				success : function() {
					alert("신고가 정상적으로 접수되었습니다.")
				},
				error : function(){
					alert("로그인을 하신 뒤 다시 시도해주세요.")
				},
				complete : function() {
					$('#replyReportModal1').modal('hide');
				}
			});
		});// 댓글 신고 끝
		
		// 대댓글 신고하기 버튼 누르면 db에 인서트
		$("#rereplyReportSubmitButton").click(function(e) {
			const appRoot = '${pageContext.request.contextPath}';
			
			const boardName = $("#rereplyreportinput1").val(); // 이 게시판은 어디 게시판인가
			const boardUrl =$(location).attr("href"); // 현재 게시물의 url
			const categories = $("#rereplyreportinput4").val(); // 신고 대상이 게시판인지 댓글인지 구분
			const title = $("#rereplyreportinput3").val(); // 현재 게시물의 제목
			const nickname = $("#rereplyreportinput2").val(); // 현재 게시물의 작성자
			const reason = $("#rereplyReportReason").val(); // select에서 선택한 신고사유
			const reasonDetail = $("#rereplyReportReasonDetail").val(); // select가 '기타'일 때 사용자가 직접 입력한 신고 사유 내용
			const helpId = '${post.id}'; // 현재 게시판의 id, 동네 소식 게시판이 된다면 newsId가 됨.
			const helpReplyId = $("#rereplyreportinput6").val();//댓글 id
			const helpReReplyId = $("#rereplyreportinput5").val();//대댓글 id
			const report = {
				boardName : boardName,
				boardUrl : boardUrl,
				categories : categories,
				title : title,
				nickname : nickname,
				reason : reason,
				reasonDetail : reasonDetail,
				helpId : helpId,
				helpReReplyId : helpReReplyId,
				helpReplyId : helpReplyId
			};
			console.log(report);
			$.ajax({
	        	url : appRoot + "/reportajax/register",
				type : "post",
				data : report,
				success : function() {
					alert("신고가 정상적으로 접수되었습니다.")
				},
				error : function(){
					alert("로그인을 하신 뒤 다시 시도해주세요.")
				},
				complete : function() {
					$('#rereplyReportModal1').modal('hide');
				}
			});
		});// 대댓글 신고 끝
	});
	</script>

	<script>
	  $(document).ready(function() {
	    /* contextPath */
	    const appRoot = '${pageContext.request.contextPath}';
		const upview = function() {
			$("#upview").empty();
			$.ajax({
				url : appRoot + "/helpup/",
				success : function() {
					const upviewMediaObject = $(`
							<c:if test="${empty sessionScope.loginUser}">
                            <button id="upinsnl" class="btn btn-outline-dark" >
                                <i id="upiconnl" class="far fa-heart fa-fw fa-2x m-r-3"> </i>
                            </button>
                        </c:if>
                        <c:if test="${empty post.upposession&&not empty sessionScope.loginUser}">
                            <button id="upins" class="btn btn-outline-dark">
                                <i id="upicon" class="far fa-heart fa-fw fa-2x m-r-3"> </i> 
                            </button>
                            <button id="updel" class="btn btn-outline-light" style ="background-color:#264d73; display:none;">
                                <i id="downicon" class="fas fa-heart fa-fw fa-2x m-r-3"> </i> 
                            </button>
                        </c:if>
                        <c:if test="${not empty post.upposession&&not empty sessionScope.loginUser}">
                            <button id="upins" class="btn btn-outline-dark" style="display:none;">
                                <i id="upicon" class="far fa-heart fa-fw fa-2x m-r-3" > </i> 
                            </button>
                            <button id="updel" class="btn btn-outline-light" style="background-color:#264d73;">
                                <i id="downicon" class="fas fa-heart fa-fw fa-2x m-r-3"> </i> 
                            </button>
                        </c:if>	

						`);
				$("#upview").append(upviewMediaObject);
				upviewMediaObject.find("#upiconnl").append(' ${post.up}');
				upviewMediaObject.find("#upicon").append(' ${post.up}');
				upviewMediaObject.find("#downicon").append(' ${post.up}');
				
				/* 좋아요 갯수 1 증가*/
				const upPost = function() {
					$("#upins").click(function() {
						console.log("업버튼 클릭됨.");
						$.ajax({
			        	url : appRoot + "/helpup/${post.id}",
						type : "put",
						success : function(cnt) {
							console.log("업 +1됨");

							$("#upview").find("#updel").html("<i id='downicon' class='fas fa-heart fa-fw fa-2x m-r-3'> </i> ");
							$("#upview").find("#downicon").append(cnt);
						},
						complete : function() {
							$("#upview").find("#upins").hide();
							$("#upview").find("#updel").show();
							console.log("컴플리트까지 옴")
						}
						});
					});
				}
					upPost();
					/* 좋아요 갯수 1 감소*/
					const downPost = function() {
						$("#updel").click(function() {
							console.log("업버튼 다시 클릭됨.");
							$.ajax({
				        	url : appRoot + "/helpup/${post.id}",
							type : "delete",
							success : function(cnt) {
									console.log("업 -1됨");
									$("#upview").find("#upins").html("<i id='upicon' class='far fa-heart fa-fw fa-2x m-r-3'> </i> ");
									$("#upview").find("#upicon").append(cnt);
							},
							complete : function() {
								$("#upview").find("#updel").hide();
								$("#upview").find("#upins").show();
								console.log("델리트 컴플리트까지 옴")
							}
							});
						});
					}
					downPost();	
					$("#upinsnl").click(function() {
						alert("로그인 후 이용해 주세요!");
					});
				}
			});
		}
		upview();
	
	    /* 현재 게시물의 댓글 목록 가져오는 함수 */
	    const listReply = function() {
	      $("#replyListContainer").empty();
	      $.ajax({
	        url : appRoot + "/helpreply/board/${post.id}",
	        success : function(list) {
	        	let a = 0;
	          	for (let i = 0; i < list.length; i++) {
					const replyId = list[i].id;
					const replyMediaObject = $(`
							<table class="table table-borderless 기본댓글-테이블">
								<thead id="replyhead" class="">
									<tr>
										<th id="userprofile">
												<img	id = "reply-profile" 
												src="\${list[i].url}" class="img-thumbnail rounded-circle mx-auto d-block " alt="UserProfile Picture"/>
										</th>
										<th id="replynickname">
											<div id ="reply-nickname" class="h5"></div>
										</th>
										<th id="replymenu">
												<div class="reply-menu"></div>
										</th>
										<th id="replytime">
											<span id = "reply-time" class="ms-3 mt-0 pt-0"></span>
										</th>
									</tr>
								</thead>
								<tbody id="replybody">
									<tr>
										<td id="rereplyfold">
											<button class="대댓글-작성-이모티콘" id="rereply-fold\${replyId}"><i class="far fa-comment-dots fa-2x 대댓글달기-이모티콘"></i></a>
										</td>
										<td colspan="2" class="댓글-내용칸-패딩없애기">
											<div id = "reply-text\${replyId}" class="col h6 댓글-내용칸" style="white-space: pre-wrap; overflow: initial"></div>
											<div class="input-group" id="input-group\${list[i].id}" style="display:none;">
												<textarea id="replyTextarea\${list[i].id}" class="form-control reply-modi"></textarea>
												<div class="input-group-append">
													<button class="btn btn-outline-danger cancel-button"><i class="fas fa-ban"></i></button>
													<button class="btn btn-outline-primary" id="sendReply\${list[i].id}">
													<i class="far fa-comment-dots fa-lg"></i>
													</button>
												</div>
											</div>
										</td>
										<td class="댓글-신고버튼-위치">
											<button id="replyreport\${list[i].id}" class="btn btn-light 댓글-신고버튼" style="height: fit-content;" data-toggle="modal" data-target="#replyReportModal1">
												<i class="fas fa-exclamation-triangle"> 신고</i> 
											</button>
										</td>
										</tr>
									</tbody>
								</table>
								<div class="fold\${replyId}" style="display:none;">
	                                <table class="table table-borderless ">
	                                	<thead id="rereply-input-head">
	                                		<tr>
	                            				<c:if test="${not empty sessionScope.loginUser && sessionScope.loginUser.location eq post.location }">
		                                			<th>
		                                				<div class="rereplyinput input-group 대댓글인풋-전체박스">
		                                    				<textarea id="rereplyTextarea\${list[i].id}" class="form-control re-reply-input" placeholder="대댓글을 남겨보세요!"></textarea>
							                                <div class="col-2 input-group-append">
							                                    <button id="sendReReply\${list[i].id}" class="btn btn-block send-rereply-btn 상세보기-대댓글-전송이모티콘">
							                                        <i class="far fa-paper-plane fa-2x my-auto"></i>
							                                    </button>
							                                </div>
		                                				</div>
		                                			</th>
	                          					</c:if>
	                                		</tr>
	                                	</thead>
	                                </table>
                               </div>
								 <table class="table table-borderless 대댓글-전체아래마진">
		                               <tbody id="rereply-input-body">
		                               		<tr>
		                                		<td>
			                                		<div id="rereplyListContainer\${list[i].id}"></div>
			                           				</div>
		                                		</td>
		                                	</tr>
		                               	</tbody>
		                           	 </table>
						`);
					
				    // 대댓글 리스트 함수 
					  const listReReply = function() {
				      $("#rereplyListContainer"+replyId).empty();
				      $.ajax({
				        url : appRoot + "/helprereply/reply/" + replyId,
				        success : function(relist) {
				          	for (let i = 0; i < relist.length; i++) {
								const rereplyId = relist[i].id;
								const rereplyMediaObject = $(`
	                                    <div class="대댓글-위치">
										<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-arrow-return-right 대댓글-아이콘" viewBox="0 0 16 16">
										  <path fill-rule="evenodd" d="M1.5 1.5A.5.5 0 0 0 1 2v4.8a2.5 2.5 0 0 0 2.5 2.5h9.793l-3.347 3.346a.5.5 0 0 0 .708.708l4.2-4.2a.5.5 0 0 0 0-.708l-4-4a.5.5 0 0 0-.708.708L13.293 8.3H3.5A1.5 1.5 0 0 1 2 6.8V2a.5.5 0 0 0-.5-.5z"/>
										</svg>
										<table class="table table-borderless 대댓글-테이블">
											<thead id="rereplyhead">
												<tr>
													<th id="userprofile">
														<img	id = "rereply-profile" 
														src="\${relist[i].url}"class="img-thumbnail rounded-circle mx-auto d-block " alt="UserProfile Picture"/>
													</th>
													<th id="rereplynickname">
														<div id ="rereply-nickname" class="h5"></div>
													</th>
													<th id="rereplymenu">
														<div class="rereply-menu"></div>
													</th>
													<th id="rereplytime">
														<span id = "rereply-time" class="ms-3 mt-0 pt-0"></span>
													</th>
												</tr>
											</thead>
											<tbody id="rereplybody">
												<tr>
													<td colspan="3" class="대댓글-내용" style="vertical-align: bottom;">
													<div id = "rereply-text\${relist[i].id}" class="col h6 대댓글-내용칸" style="white-space: pre-wrap; overflow: initial"></div>
													<div class="input-group" id="re-input-group\${relist[i].id}" style="display:none;">
														<textarea id="rereplyTextarea\${relist[i].id}" class="form-control re-reply-modi"></textarea>
														<div class="input-group-append">
															<button class="btn btn-outline-danger re-cancel-button"><i class="fas fa-ban"></i></button>
															<button class="btn btn-outline-primary" id="sendReReplyMd\${relist[i].id}">
															<i class="far fa-comment-dots fa-lg"></i>
															</button>
														</div>
													</div>
													</td>
													<td class="대댓글-신고버튼-위치">
														<button id="rereplyreport\${relist[i].id}" class="btn btn-light 대댓글-신고버튼" style="height: fit-content;" data-toggle="modal" data-target="#rereplyReportModal1">
															<i class="fas fa-exclamation-triangle"> 신고</i> 
														</button>
													</td>
												</tr> 
											</tbody>
										</table> 
									</div>
								`);
									
								//대댓글 수정 삭제 
								
								//대댓글 수정 등록 버튼 
								rereplyMediaObject.find("#sendReReplyMd" + relist[i].id).click(function() {
									// 댓글 공백 감지
									var replyText = $("#rereplyTextarea"+relist[i].id).val();
									if(replyText.replace(/\s|　/gi, "").length==0){
							  			alert("내용을 입력해주세요.");
							  			$("#rereplyTextarea"+relist[i].id).focus();
						  			} else {
										const rereply = rereplyMediaObject.find("#rereplyTextarea"+relist[i].id).val();
										const data =  {
												reReply : rereply		
										};
										//대댓글 수정 요청 
										$.ajax({
											url : appRoot + "/helprereply/" + relist[i].id,
											type : "put",
											contentType : "application/json",
											data : JSON.stringify(data),
											complete : function() {
												listReReply();
											}
										});
						  			}
								});//대댓글 수정 등록 버튼 끝
								rereplyMediaObject.find(".rereply-nickname").append(relist[i].nickname);
								rereplyMediaObject.find(".rereply-body").text(relist[i].reReply);
								rereplyMediaObject.find(".re-reply-modi").text(relist[i].reReply);
								rereplyMediaObject.find(".re-cancel-button").click(function() {
									console.log(rereplyId);
									replyMediaObject.find("#rereply-text"+rereplyId).show();
									$("#re-input-group" + rereplyId).hide();
									rereplyMediaObject.find("#rereplyModify").show();
									rereplyMediaObject.find("#rereplyDelete").show();
								});
								
								if (relist[i].own) {
									// 본인이 작성한 것만 수정버튼 추가
									const remodifyButton = $("<button id='rereplyModify' class='btn btn-outline-primary'><i class='fas fa-edit'></i></button>")
									remodifyButton.click(function() {
										$(this).parent().parent().parent().parent().parent().find('#rereply-text' + rereplyId).hide();// this는 클릭이벤트가 발생한 버튼
										$(this).parent().parent().parent().parent().parent().find(`#re-input-group\${relist[i].id}`).show();
										$(this).parent().find('#rereplyModify').hide();
										$(this).parent().find('#rereplyDelete').hide();
									});
									rereplyMediaObject.find(".rereply-menu").append(remodifyButton);
								}
								if (relist[i].own || ${sessionScope.loginUser.adminQuali eq 1}) {
									// 삭제버튼도 추가
									const reremoveButton = $("<button id='rereplyDelete' class='btn btn-outline-danger'><i class='far fa-trash-alt'></i></button>");
									const blank = $(" ");
									reremoveButton.click(function(){
										if (confirm("정말 삭제하시겠습니까?")){
											$.ajax({
												url : appRoot +"/helprereply/"+relist[i].id,
												type : "delete",
												complete : function(){
													listReReply();
													//listReplyCount();
												}
											})
										}
									})
									rereplyMediaObject.find(".rereply-menu").append(reremoveButton);
								} //대댓글 수정 삭제 끝 
								
								$("#rereplyListContainer"+replyId).append(rereplyMediaObject);
								
								rereplyMediaObject.find("#rereply-nickname").text(relist[i].nickname);
								rereplyMediaObject.find("#rereply-text"+rereplyId).text(relist[i].reReply);
								rereplyMediaObject.find("#rereply-time").text(relist[i].inserted);
				          	
								// 대댓글 신고하기 버튼 누르면 body의 모달로 작성자 닉네임, 내용, id 전달
								$("#rereplyreport"+relist[i].id).click(function(e) {
									const title = relist[i].reReply; // 대댓글내용
									const nickname = relist[i].nickname; // 현재 댓글의 작성자
									const helpReReplyId = relist[i].id;// 대댓글 id
									const helpReplyId = replyId;
									console.log("helpid : " +helpReplyId);
									$.ajax({
										url : appRoot +"/reportajax/helprrcount/"+helpReReplyId,
										type : "get",
										success : function(rrcnt){
											if(rrcnt<5){
												$("#rereplyReportSubmitButton").show();
												$("#rereplyReportForm").show();
												$("#rereplyReportOnProgress").hide();
												$("#rereplyreportinput2").attr("value", nickname);
												$("#rereplyreportinput3").attr("value", title);
												$("#rereplyreportinput5").attr("value", helpReReplyId);
												$("#rereplyreportinput6").attr("value", helpReplyId);
												
											} else {
												$("#rereplyReportForm").hide();
												$("#rereplyReportOnProgress").show();
												$("#rereplyReportSubmitButton").hide();
												$("#rereplyReportCancel").text("닫기");
												$("#rereplyReportCancel").click(function(){
													
												});
											}//if문 끝남
										}//success 끝남
									});
								});// 대댓글 신고 끝
				          	
				          	}// 대댓글 for 문 종료 
				        }
				      });
				    } //대댓글 리스트 함수 종료 
				    listReReply();
					
					//댓글 수정 등록 버튼 
					replyMediaObject.find("#sendReply" + list[i].id).click(function() {
						// 댓글 공백 감지
						var replyText = $("#replyTextarea"+list[i].id).val();
						if(replyText.replace(/\s|　/gi, "").length==0){
				  			alert("내용을 입력해주세요.");
				  			$("#replyTextarea"+list[i].id).focus();
			  			} else {
							const reply = replyMediaObject.find("#replyTextarea"+list[i].id).val();
							const data =  {
									reply : reply		
							};
							//댓글 수정 요청 
							$.ajax({
								url : appRoot + "/helpreply/" + list[i].id,
								type : "put",
								contentType : "application/json",
								data : JSON.stringify(data),
								complete : function() {
									listReply();
								}
							});
			  			}
					});//댓글 수정 등록 버튼 끝
					replyMediaObject.find(".reply-nickName").append(list[i].nickName);
					replyMediaObject.find(".reply-body").text(list[i].reply);
					replyMediaObject.find(".reply-modi").text(list[i].reply);
					replyMediaObject.find(".cancel-button").click(function() {
						replyMediaObject.find("#reply-text"+replyId).show();
						$("#input-group" + replyId).hide();
						replyMediaObject.find("#replyModify").show();
						replyMediaObject.find("#replyDelete").show();
					});

					if (list[i].own) {
						// 본인이 작성한 것만 수정버튼 추가
						const modifyButton = $("<button id='replyModify' class='btn btn-outline-primary'><i class='fas fa-edit'></i></button>")
						modifyButton.click(function() {
							$(this).parent().parent().parent().parent().parent().find('#reply-text' + replyId).hide();// this는 클릭이벤트가 발생한 버튼
							$(this).parent().parent().parent().parent().parent().find(`#input-group\${list[i].id}`).show();
							$(this).parent().find('#replyModify').hide();
							$(this).parent().find('#replyDelete').hide();
						});
						replyMediaObject.find(".reply-menu").append(modifyButton);
					}
					if (list[i].own || ${sessionScope.loginUser.adminQuali eq 1}) {
						// 삭제버튼도 추가
						const removeButton = $("<button id='replyDelete' class='btn btn-outline-danger'><i class='far fa-trash-alt'></i></button>");
						const blank = $(" ");
						removeButton.click(function(){
							if (confirm("Sure you want to delete?")){
								$.ajax({
									url : appRoot +"/helpreply/"+list[i].id,
									type : "delete",
									complete : function(){
										listReply();
										listReplyCount();
									}
								})
							}
						})
						replyMediaObject.find(".reply-menu").append(removeButton);
					}
					
					$("#replyListContainer").append(replyMediaObject);
					replyMediaObject.find("#reply-nickname").text(list[i].nickname);
					replyMediaObject.find("#reply-text"+replyId).text(list[i].reply);
					replyMediaObject.find("#reply-time").text(list[i].inserted);
					
					
					  //대댓글 등록하기 
					$("#sendReReply"+list[i].id).click(function() {
						// 댓글 공백 감지
						var replyText = $("#rereplyTextarea"+list[i].id).val();
						if(replyText.replace(/\s|　/gi, "").length==0){
				  			alert("내용을 입력해주세요.");
				  			$("#rereplyTextarea"+list[i].id).focus();
			  			} else {
							const rereply =$("#rereplyTextarea"+list[i].id).val();
							const memberId = '${sessionScope.loginUser.id}';
							const replyId = list[i].id;
							const nickname = '${sessionScope.loginUser.nickname}';
							const boardId = '${post.id}';
							const data = {
									boardId : boardId,
									reReply : rereply,
									uid : memberId,
									replyId : replyId,
									nickname : nickname
							};
							
							$.ajax({
								url : appRoot+ "/helprereply/write",
								type : "post",
								data : data,
								success : function() {
									// textarea reset
									$("#rereplyTextarea"+list[i].id).val(""); 
								},
								error : function(){
									alert("Logged out! Please login again!");
								},
								complete : function() {
									//refresh
									listReReply();
									//listReReplyCount();
									//countInBoard();
								}
							});
			  			}
					})//대댓글 등록하기 끝 
					
					// 댓글 신고하기 버튼 누르면 body의 모달로 작성자 닉네임하고 내용 전달
					$("#replyreport"+replyId).click(function(e) {
						const title = list[i].reply; // 댓글내용
						const nickname = list[i].nickname; // 현재 댓글의 작성자
						const helpReplyId = list[i].id // 댓글id
						
						$.ajax({
							url : appRoot +"/reportajax/helprcount/"+helpReplyId,
							type : "get",
							success : function(rcnt){
								if(rcnt<5){
									$("#replyReportSubmitButton").show();
									$("#replyReportCancel").text("취소");
									$("#replyReportForm").show();
									$("#replyReportOnProgress").hide();
									$("#replyreportinput2").attr("value", nickname);
									$("#replyreportinput3").attr("value", title);
									$("#replyreportinput5").attr("value", helpReplyId);
									
								} else {
									$("#replyReportForm").hide();
									$("#replyReportOnProgress").show();
									$("#replyReportSubmitButton").hide();
									$("#replyReportCancel").text("닫기");
									$("#replyReportCancel").click(function(){
										
									});
								}
							}
						});
					});// 댓글 신고 끝
					
					
					
	/* 				//각 댓글에 달린 대댓글 개수 세기 
					const listReReplyCount = function() {
						$.ajax({
							url : appRoot+ "/helprereply/count/"+replyId,
							type : "get",
							success : function(recount) {
								//console.log(recount);
							}
						})
					}
					listReReplyCount(); */
					
					
					// 대댓글 입력창만 토글
					$("#rereply-fold"+list[i].id).click(function() {
						$("#replyListContainer").find(".fold"+list[i].id).toggle();
					});
	
					
				} //for문종료 	
	        } //success property value function 끝 
	      }); //ajax 종료 (댓글리스트 불러오기 완료)
	    } //listReply 정의하는 function 종료 
	    listReply(); // 페이지 로딩 후 댓글 리스트 가져오는 함수 한 번 실행
	    
		//댓글 등록 
		$("#sendReply").click(function() {
			// 댓글 공백 감지
			var replyText = $("#replyTextarea").val();
			if(replyText.replace(/\s|　/gi, "").length==0){
	  			alert("내용을 입력해주세요.");
	  			$("#replyTextarea").focus();
  			} else {
	  			const reply =$("#replyTextarea").val();
				const memberId = '${sessionScope.loginUser.id}';
				const boardId = '${post.id}';
				const nickname = '${sessionScope.loginUser.nickname}';
				const data = {
						reply : reply,
						uid : memberId,
						boardId : boardId,
						nickname : nickname
				};
				
				$.ajax({
					url : appRoot+ "/helpreply/write",
					type : "post",
					data : data,
					success : function() {
						// textarea reset
						$("#replyTextarea").val(""); 
					},
					error : function(){
						alert("Logged out! Please login again!");
					},
					complete : function() {
						// list refresh
						listReply();
						listReplyCount();
					}
				});
  			}
		});//댓글전송
		
	/* 	//게시판에 달린 대댓글 개수 세기 (댓글수와 합칠 용도)
		const countInBoard = function() {
			$.ajax({
				url : appRoot+ "/helprereply/countb/"+${post.id},
				type : "get",
				success : function(recountb) {
					console.log(recountb);
				}
			})
		}
		countInBoard(); */
		
		//댓글 갯수
		const listReplyCount = function() {
			const boardId = '${board.id}';
			$.ajax({
				url : appRoot+ "/helpreply/count/"+${post.id},
				type : "get",
				success : function(count) {
					const replyCountObject = $(`<p class="replyCount fa-2x" style="margin-bottom:0px;"><i class="fa fa-comments"></i> </p>`);
					$(".replyCount").parents().find(".replyCount").replaceWith(replyCountObject);
					$(".replyCount").parents().find(".replyCount").append(count);
				}
			})
		}
		listReplyCount();
	});
	</script>
</body>
</html>