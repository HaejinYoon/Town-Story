<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="b" tagdir="/WEB-INF/tags/"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="EUC-KR">
<title>동네 신문고</title>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<link href="<%=request.getContextPath()%>/resource/favicon/favicon.png" rel="icon" type="image/x-icon" />

<style>
#inner {
	width: 900px;
	height: 100%;
}

.listcontainer {
	margin-top: 15px;
	margin-bottom: 15px;
}

.row {
	font-family: 'IBM Plex Sans KR', sans-serif;
	font-weight: bold;
}

#body {
	/* height: calc(100vh-72px); */
	width: 100%;
	justify-content: center;
	display: flex;
}

#question-body-font, #question-body-font2 {
	background-color: #ffe164;
	font-size: 25px;
	font-weight: bold;
	float:right;
}

#question-body-font:hover{
color:white;}

#공지사항-바탕{
background-color: #eef2f6; 
}

table {
	text-align: center;
}

.table{
border-bottom: 1px solid lightgray;
}

#boardid {
	text-align: left;
	color:black;
}

.동네신문고-공지사항-제목,.동네신문고-공지사항-닉네임,.동네신문고-제목,.동네신문고-닉네임{
color:#4080bf;
}
.동네신문고-페이지네이션{
background-color: #264d73;
}

.page-item.active .page-link{
background-color:#eef2f6;
color:black;
border-color: darkblue;
}
.page-item.active {
background-color:#eef2f6;
color:black;
}
.page-link{
color:white;

}
.table td, .table th{
	padding-left : 0.4rem;
	padding-right: 0.45rem;
	padding-top: 0.75rem;
	padding-bottom: 0.75rem;
}
#inserted{
	font-size: 13px;
	vertical-align: middle;
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

			<div class="listcontainer">
				<div class="row">
					<div class="col">
						<!-- 공지사항 글 -->
						<table class="table">
							<thead class="컬럼-이름-로우">
								<tr>
									<!-- <th>
										<i class="fab fa-slack-hash"></i>
									</th> -->
									<th>지역</th>
									<th>tag</th>
									<th>제목</th>
									<th>
										<i class="fas fa-user"></i>
										작성자
									</th>
									<th>작성일</th>

								</tr>
							</thead>
							<tbody>
								<c:forEach items="${listNotice }" var="board1">
									<tr id="공지사항-바탕">
										<%-- <td>${board1.id }</td> --%>
										<td style="vertical-align: middle;">-</td>
										<td style="vertical-align: middle;">${board1.tag }</td>
										<td id="boardid" style="vertical-align: middle;">
											<a href="list/${board1.id }" class="동네신문고-공지사항-제목">
												<%-- <c:if test="${not empty board.fileList }">
								                    	<c:out value="${board.title }"/><i class="bi bi-image"></i> 
								                	</c:if>
								                	<c:if test="${board.newMark <2 }">
								                    	<span class="badge badge-danger">new!</span>
								                    </c:if> --%>
												<c:if test="${empty board1.fileList }">
													<c:out value="${board1.title } " />
												</c:if>
											</a>
											<c:if test="${board1.fileCount > 0 }">
												<span> <i class="fas fa-images"></i> </span>
											</c:if>
											<c:if test="${board1.replyCount > 0 }">
												<span> <i class="fas fa-comment"></i> (${board.replyCount}) </span>
											</c:if>
											<c:if test="${board1.newMark <3 }">
												<span class="badge badge-danger">new</span>
											</c:if>
										</td>
										<td>
											<a href="../user/profile/${board1.nickname }" class="동네신문고-공지사항-닉네임">
												<c:out value="${board1.nickname }" /><br>(관리자)
											</a>
										</td>
										<td id="inserted">${board1.inserted }</td>

									</tr>
								</c:forEach>

								<!-- table.table>thead>tr>th*4^^tbody 공지사항을 제외한 나머지 글-->
								<c:forEach items="${list }" var="board">
									<c:if test="${board.notice < 2 }">
										<tr>
											<%-- <td>${board.id }</td> --%>
											<td>${board.location}</td>
											<td>${board.tag }</td>
											<td id="boardid">
												<a href="list/${board.id }" class="동네신문고-제목">
													<%-- <c:if test="${not empty board.fileList }">
										                    	<c:out value="${board.title }"/><i class="bi bi-image"></i> 
										                	</c:if>
										                	<c:if test="${board.newMark <2 }">
										                    	<span class="badge badge-danger">new!</span>
										                    </c:if> --%>
													<c:if test="${empty board.fileList }">
														<c:out value="${board.title } " />
													</c:if>
												</a>
												<c:if test="${board.fileCount > 0 }">
													<span> <i class="fas fa-images"></i> </span>
												</c:if>
												<c:if test="${board.replyCount > 0 }">
													<span> <i class="fas fa-comment"></i> (${board.replyCount}) </span>
												</c:if>
												<c:if test="${board.newMark <3 }">
													<span class="badge badge-danger">new</span>
												</c:if>
											</td>
											<td>
												<a href="../user/profile/${board.nickname }" class="동네신문고-닉네임">
													<c:out value="${board.nickname }" />
												</a>
											</td>
											<td id="inserted">${board.inserted }</td>

										</tr>
									</c:if>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<c:if test="${not empty sessionScope.loginUser }">
				<a href="${pageContext.request.contextPath }/question/register" id="question-body-font" class="btn">글쓰기</a>
			</c:if>
			<c:if test="${empty sessionScope.loginUser }">
				<a id="question-body-font2" class="btn">글쓰기</a>
			</c:if>
		</div>
	</div>

	<nav aria-label="Page navigation example" style="margin-bottom: 50px;">
		<ul class="pagination justify-content-center">
			<c:if test="${pageInfo.hasPrevButton }">
				<c:url value="/question/list" var="pageLink">
					<c:param name="page" value="${pageInfo.leftPageNumber - 1 }"></c:param>
				</c:url>
				<li class="page-item ">
					<a class="page-link 동네신문고-페이지네이션" href="#" onclick="getlink(${pageInfo.leftPageNumber - 1}" aria-label="Previous">
						<span aria-hidden="true">&laquo;</span>
					</a>
				</li>
			</c:if>

			<c:forEach begin="${pageInfo.leftPageNumber}" end="${pageInfo.rightPageNumber }" var="pageNumber">
				<c:url value="/question/list" var="pageLink">
					<c:param name="page" value="${pageNumber }"></c:param>
					<c:param name="location" value="${location }"></c:param>
				</c:url>

				<li class="page-item  ${pageInfo.currentPage == pageNumber ? 'active' : '' }">
					<a class="page-link 동네신문고-페이지네이션" href="#" onclick="getlink(${pageNumber})">${pageNumber}</a>
				</li>
			</c:forEach>

			<c:if test="${pageInfo.hasNextButton }">
				<c:url value="/question/list" var="pageLink">
					<c:param name="page" value="${pageInfo.rightPageNumber + 1 } "></c:param>
				</c:url>
				<li class="page-item ">
					<a class="page-link 동네신문고-페이지네이션" href="#" onclick="getlink(${pageInfo.rightPageNumber + 1})" aria-label="Next">
						<span aria-hidden="true">&raquo;</span>
					</a>
				</li>
			</c:if>
		</ul>
	</nav>
	<b:copyright></b:copyright>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>

	<script>
		$(document).ready(function(){
			$("#question").attr("class", "btn btn-outline ml-1 active");
		});
		
		function getlink(pageNum) {
			
			var tag = "${tag}";
			var location = "${location}";
			
			if(location == "") {
				location  = "";
			} else {
				location = "&location="+location;
			}
			
			if(tag == null || tag == "") {
				
				tag = "";
			} else {
				tag = "&tag="+tag;
			}
			
			window.location.href = "/controller1/question/list?page=" + pageNum + location + tag;
		}
</script>
</body>
</html>