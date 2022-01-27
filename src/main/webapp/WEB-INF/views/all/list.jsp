<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="b" tagdir="/WEB-INF/tags/"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="EUC-KR">
<title>HomePage</title>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<style>
#body {
	/* height: calc(100vh-72px); */
	width: 100%;
	justify-content: center;
	display: flex;
}

#inner {
	width: 900px;
	height: 100%;
}
</style>
</head>
<body>
	
	<b:header></b:header>
	<div id="body">
		<div id="inner">
			<b:innerNav></b:innerNav>
			
			
			<b:cover></b:cover>
			<!-- 태그 -->
			<table class="table">
				<thead>
					<tr>
						<th>
							<i class="fab fa-slack-hash"></i>
						</th>
						<th>tag</th>
						<th>제목</th>
						<th>
							<i class="fas fa-user"></i>
						</th>
						<th>작성일</th>

					</tr>
				</thead>
				<tbody>
					<c:forEach items="${listNotice }" var="board1">
						<tr>
							<td>${board1.id }</td>
							<td>${board1.tag }</td>
							<td id="boardid">
								<a href="get/${board1.id }">
									<%-- <c:if test="${not empty board.fileList }">
                    	<c:out value="${board.title }"/><i class="bi bi-image"></i> 
                	</c:if>
                	<c:if test="${board.newMark <2 }">
                    	<span class="badge badge-danger">new!</span>
                    </c:if> --%>
									<c:if test="${empty board1.fileList }">
										<c:out value="${board1.title } " />
									</c:if>
									<c:if test="${board1.newMark <3 }">
										<span class="badge badge-danger">new</span>
									</c:if>
								</a>
							</td>
							<td>
								<a href="../user/profile/${board1.nickname }">
									<c:out value="${board1.nickname }" />
								</a>
							</td>
							<td>${board1.inserted }</td>

						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	<c:forEach items="${list}" var="board" varStatus="vs">
		<c:if test="${location eq board.location || location eq '' || empty location }">
			<div class="container-fluid my-4 list-background-color" id="list-font-${vs.index }" style="display : ${vs.index < 5 ? '' : 'none' }">
				<div class="row md mx-3 my-2 제목아래보더">
					<div class="col-md-2 my-auto px-auto 태그테두리">
						<div id="tag">${board.tag }</div>
					</div>
					<div class="col-md-5 my-auto h5">
						<div>
							<a href="/controller1/help/list/${board.id}" id="title">
								<c:out value="${board.title}" />
								<c:if test="${board.newMark <2 }">
									<span class="badge badge-danger">new</span>
								</c:if>
							</a>
						</div>
					</div>
					<div class="col-md-3 offset-md-2 my-auto h5">
						<div class="닉네임위치">${board.nickname }</div>
					</div>
				</div>

				<div class="row md px-0 mx-0 my-2">
					<div class="col-md-12 ">
						<div id="line"></div>
					</div>
				</div>

				<!-- 여기가 컨텐츠 표현 부분입니다. a 태그로 내용을 표시합니다. -->
				<div id="contentBox" class="row md px-0 mx-3 h5">
					<a href="/controller1/help/list/${board.id}" id="내용">
						<c:out value="${board.content}" />
					</a>
				</div>

				<!-- preview에 올릴 한장의 이미지, 썸네일 한장만 표시한다. -->
				<div class="row md px-0 mx-0 justify-content-center">
					<div class="col-md-8 my-auto mx-0 d-flex justify-content-center">
						<a id="thumbnail" href="/controller1/help/list/${board.id}">

							<!-- postVO가 가진 file List 중 썸네일로 지정된 이미지만 띄운다. -->
							<c:if test="${not empty board.fileList }">
								<c:forEach items="${board.fileList }" var="file" varStatus="vs">
									<c:if test="${file.isThumbnail eq 1 }">
										<img src="${file.url}" class="d-block w-100" alt="${file.url}">

									</c:if>
								</c:forEach>
							</c:if>

						</a>
					</div>
				</div>

				<div class="row my-2">
					<div class="col-md-12 게시물-아랫선" style="height: 2px; width: 100%">
						<div id="line"></div>
					</div>
				</div>


				<div class="row md mx-3 댓글위의바">
					<div class="col-md-2 댓글창부분">
						<c:if test="${board.upposession !=null}">
							<i class="fa fa-thumbs-up fa-fw fa-1x m-r-3"></i>
						</c:if>
						<c:if test="${empty board.upposession }">
							<i class="far fa-thumbs-up fa-fw fa-1x m-r-3"></i>
						</c:if>
						<span class="fa-2x"> ${board.up} </span>
					</div>
					<div class="col-md-2 댓글창부분">
						<i class="fa fa-comments fa-fw fa-1x m-r-3"></i>
						<span class="fa-2x"> ${board.replyCount } </span>
					</div>
					<div class="col-md-2 댓글창부분">
						<i class="fas fa-eye fa-fw fa-2x m-r-3"></i>
						<span class="fa-2x"> ${board.views } </span>
					</div>
					<div class="col-md-6 ">
						<div id="게시글-작성시간">${board.inserted}</div>
					</div>
				</div>
			</div>
		</c:if>
	</c:forEach>
	<b:copyright></b:copyright>

	<!-- result 처리 모달 -->
	<c:if test="${not empty result }">
		<div class="modal" tabindex="-1" id="modal1">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title">어서오세요!</h5>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<p>${result }</p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
					</div>
				</div>
			</div>
		</div>
	</c:if>

	<c:if test="${not empty modify }">
		<div class="modal" tabindex="-1" id="modal1">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title">정보 수정 완료</h5>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<p>${modify }</p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
					</div>
				</div>
			</div>
		</div>
	</c:if>
	

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>

	<script>
		$(document).ready(function() {
			$("#all").attr("class", "btn btn-outline ml-1 active");
			$("#modal1").modal('show');
		});
	</script>
</body>
</html>