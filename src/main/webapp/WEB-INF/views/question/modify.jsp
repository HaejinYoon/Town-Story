<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="b" tagdir="/WEB-INF/tags"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" referrerpolicy="no-referrer"></script>
<link href="<%=request.getContextPath()%>/resource/favicon/favicon.png" rel="icon" type="image/x-icon" />

<style>
.form-group {
	font-family: 'IBM Plex Sans KR', sans-serif;
}

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

.게시글-타이틀 {
	padding-top: 5px;
	padding-bottom: 10px;
	margin-bottom: 0px;
	border-bottom: solid;
	border-bottom-color: lightgray;
	letter-spacing: 2px;
}

.게시물-글씨 {
	font-size: x-large;
	font-weight: bold;
	letter-spacing: 2px;
}

.인풋-글씨 {
	font-size: large;
}

.게시물-테두리-패딩 {
	padding-top: 10px;
	padding-bottom: 10px;
	magin-bottom: 0px;
}

.이미지-아래-테두리 {
	padding-bottom: 20px;
}

.form-group1 {
	font-family: 'IBM Plex Sans KR', sans-serif;
	magin-bottom: 0px;
}

#input1, #input2 {
	border: solid;
	border-color: #264d73;
	padding-top: 20px;
	padding-bottom: 20px;
}

#input1 {
	width: 100%;
	height: 40%;
}

#input2 {
	height: 200px;
}

#input3 {
	border: solid;
	border-color: #264d73;
	width: 100%;
	padding-top: 4px;
	height: 40%;
}

.게시물수정-이미지 {
	width: 50%;
}

#image_container {
	border-bottom: solid;
	border-bottom-color: lightgray;
	margin-bottom: 20px;
	padding-bottom: 15px;
}

.상세보기-이미지박스 {
	text-align: center;
}

.상세보기-이미지-첫번째칸 {
	width: 84px;
}
.상세보기-이미지-두번째칸{
	padding-bottom: 23px;
}
.상세보기-이미지-세번째칸 {
	width: 66px;
	padding-bottom: 23px;
}

.container_radio {
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
}

/* Hide the browser's default radio button */
.container_radio input {
	position: absolute;
	opacity: 0;
	cursor: pointer;
}

/* Create a custom radio button */
.checkmark {
	position: absolute;
	top: 0;
	left: 0;
	height: 24px;
	width: 24px;
	background-color: #eee;
	border-radius: 50%;
}

/* On mouse-over, add a grey background color */
.container_radio:hover input ~.checkmark {
	background-color: #ccc;
}

/* When the radio button is checked, add a blue background */
.container_radio input:checked ~.checkmark {
	background-color: #2196F3;
}

/* Create the indicator (the dot/circle - hidden when not checked) */
.checkmark:after {
	content: "";
	position: absolute;
	display: none;
}

/* Show the indicator (dot/circle) when checked */
.container_radio input:checked ~.checkmark:after {
	display: block;
}

/* Style the indicator (dot/circle) */
.container_radio .checkmark:after {
	top: 8px;
	left: 8px;
	width: 8px;
	height: 8px;
	border-radius: 50%;
	background: white;
}

#line {
	height: 2.4px;
	background-color: lightgray;
	width: 900px;
	margin-bottom: 15px;
}

.btn-modify, .btn-cancel, .btn-delete {
	font-size: xx-large;
	margin-bottom: 40px;
	border-radius: 8px;
}

.btn-modify {
	color: #f0615c;
	background-color: #ffe164;
}

.btn-danger {
	margin-left: 10px;
}

.btn-cancel {
	color: white;
	padding: 7.5px;
	padding-block: 6px;
	background-color: #264d73;
	border: 1px solid;
	border-color: #264d73;
	margin-left: 10px;
}

.btn-cancel:hover {
	color: #ffe164;
}
</style>

<title>게시물 수정</title>
</head>
<body>
	<b:header></b:header>
	<div class="container" id="body">
		<div class="row" id="inner">
			<b:innerNav></b:innerNav>
			<div class="col">
				<h1 class="게시글-타이틀">게시물 수정</h1>

				<form id="modifyForm" method="post" enctype="multipart/form-data">
					<input type="hidden" name="id" value="${board.id }">
					
					<div class="row">
					<div class="form-group1 게시물-테두리-패딩 col-md-8">
						<label for="input1" class="게시물-글씨">제목</label>
						<input type="text" class="form-control 인풋-글씨" value="${board.title }" id="input1" name="title">
					</div>
						<div class="form-group1 게시물-테두리-패딩 col-md-4">
							<label for="input3" class="게시물-글씨">태그</label>
							<select class="form-control " id="input3" name="tag">
								<option value="질문" <c:if test="${board.tag eq '질문'}">selected</c:if>>질문</option>
								<option value="건의사항" <c:if test="${board.tag  eq '건의사항'}">selected</c:if>>건의사항</option>
								<option value="신고합니다!" <c:if test="${board.tag  eq '신고합니다!'}">selected</c:if>>신고합니다!</option>
								<c:if test="${sessionScope.loginUser.adminQuali eq 1 }">
           				 			<option value="공지사항" <c:if test="${board.tag  eq '공지사항'}">selected</c:if>>공지사항</option>
           				 		</c:if>
							</select>
						</div>
					</div>
					<div class="form-group1 게시물-테두리-패딩">
						<label for="input2" class="게시물-글씨">내용</label>
						<textarea class="form-control 인풋-글씨" id="input2" name="content">${board.content }</textarea>
					</div>

					<c:choose>
							<c:when test="${board.notice eq 1 }">
								<br>
								<input type="checkbox" name="notice" id="input8" value="1" checked="checked">Notice <hr>
							</c:when>
							<c:when test="${sessionScope.loginUser.adminQuali eq 1 }">
								<br>
								<input type="checkbox" name="notice" id="input5" value="1">
								Notice <hr>
							</c:when>
					</c:choose>
						<div style="visibility: hidden">
							<input type="hidden" name="notice" id="input6" value="0">
						</div>

					<table class="table table-hover table-bordered 상세보기-이미지박스">
						<thead class="thead-dark">
							<tr>
								<th class="상세보기-이미지-첫번째칸">삭제할 파일 선택</th>
								<th class="상세보기-이미지-두번째칸" style="vertical-align: middle;">이미지</th>
							</tr>
						</thead>
						<c:if test="${not empty board.fileList }">
							<c:forEach items="${ board.fileList }" var="file" varStatus="status">
								<tbody>
									<tr>
										<td>
											<div class="col d-flex justify-content-center align-items-center">
												<input id = "check${status.index}" class="check" type="checkbox" name="removeFile" onchange="check(this)" value="${file.url}">
											</div>
										</td>
										<td>
											<div class="col">
												<img class="img-fluid 게시물수정-이미지" src="${file.url}" alt="${file.url }">
											</div>
										</td>
									</tr>
								</tbody>
							</c:forEach>
						</c:if>
					</table>


					<div class="form-group1 게시물-테두리-패딩 이미지-아래-테두리">
						<label for="input4" class="게시물-글씨">Image</label>
						<input type="file" class="form-control-file" id="input4" name="files" accept="image/*" onchange="fileUploaded(event)" multiple>
					</div>
					
					<!-- 구분 선 -->
				    <div id="d-line"></div>
					
					<!-- 이미지들 미리보기 컨테이너 -->
					<div id="image_container" class="d-flex"></div>
				</form>
				<c:if test="${sessionScope.loginUser.nickname eq board.nickname }">
					<button id="modifySubmitButton" class="btn btn-modify" type="submit">수정</button>
				</c:if>
				<button id="" class="btn btn-danger btn-delete" data-toggle="modal" data-target="#confirmModal1"> 삭제</i></button>
				<a href="${pageContext.request.contextPath }/question/list/${board.id}" class="btn btn-cancel">취소</a>
			</div>
		</div>
	</div>

	<!-- Delete Confirm Modal -->
	<div class="modal fade" id="confirmModal1" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel" style="color:black">삭제 확인</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">게시물을 삭제하시겠습니까?</div>
				<div class="modal-footer">
					<button id="removeSubmitButton" type="submit" class="btn btn-danger">
						<i class="fas fa-trash"> 삭제</i>
					</button>
					<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
				</div>
			</div>
		</div>
	</div>

	<!-- Result Modal -->
	<c:if test="${not empty result }">
		<div class="modal" tabindex="-1" id="modal1">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title">Process Result</h5>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<p>${result }</p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>
	</c:if>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
	<script>
	
	function isEmpty(str) {
    	return !str.trim().length;
	}
	
	const title = document.getElementById('input1');
	const content = document.getElementById('input2');
	
	var queue = [];

	function delRef(index) {

		$("#image_container").empty();

		var dt = new DataTransfer();
		var input = document.getElementById('input4');
		var {files} = input;	

		//큐 에서도 삭제
		queue.splice(index, 1);
		for (var i = 0; i < files.length; i++) {
			var file = files[i]
			if (index !== i) dt.items.add(file);
			input.files = dt.files
		}
		
		if(!queue.length) {
			$("#d-line").empty();
		}

		render(input.files);

	}
	
	function render(files) {

		var i = 0;
		for (const image of files) {
			
			const url = window.URL.createObjectURL(image); // blob:http://localhost:1234/28ff8746-94eb-4dbe-9d6c-2443b581dd30
			
				const replyMediaObject = $(`
            	<span id = "\${i}" style="height: 200px; width: 200px; position:relative;">
			
				<div 
					class = "closeButton"
					style = "position: absolute; z-index:101; top: 5px; right: 5px; width: 30px; height: 30px; cursor:pointer;" 
					onclick = "delRef(\${i})"
				>
					<i class="fas fa-times fa-2x"></i>
				</div>
					<img src= "\${url}" class="img-thumbnail d-block" style="height: 100%; width: 100%" atl="aaaa"/>	
				</span>
            	
            `);

				$("#image_container").append(replyMediaObject);

				i++;
			};
	}
	
	function fileUploaded(event) {

		//파일명 변경하기
			var newFiles = [];
			//파일명 변경하기
			for (file of event.target.files) {
				//var fileType = file.name.slice(file.name.indexOf("."));
				//console.log(fileType);

				var new_file = new File([file], Date.now() + file.name);
				console.log("new file", new_file);
				newFiles.push(new_file);
				// Object.defineProperty(file, 'name', {
				// 	writable: true,
				// 	value: Date.now() + file.name
				// });
				sleep(10);
			}

			queue.push(...newFiles);


		var dt = new DataTransfer();
		var input = document.getElementById('input4');

		for (var i = 0; i < queue.length; i++) {
			var file = queue[i]
			dt.items.add(file)
			input.files = dt.files

		}

		/* 현재 미리보기는 모두 지워야 한다. */
		$("#image_container").empty();
		$("#d-line").empty();

		const line = $(`<div id="line"></div>`)

		$("#d-line").append(line);

		render(input.files);

	}
	
	//딜레이 만드는 함수
	function sleep(ms) {
		const wakeUpTime = Date.now() + ms;
		while (Date.now() < wakeUpTime) {}
	}
	
		$(document).ready(function() {
			$("#removeSubmitButton").click(function(e) {
				e.preventDefault(); // 기본동작을 진행하지 않도록 함
				$("#modifyForm").attr("action", "remove").submit();
			});
			$("#modifySubmitButton").click(function(e) {
				e.preventDefault();
				if(isEmpty(title.value) || isEmpty(content.value)) {
					alert("제목과 내용은 필수 입력 사항입니다!");
				} else {
					$("#modifyForm").attr("action", "modify").submit();
				}
			});
			if (history.state == null) {
				$("#modal1").modal('show');
				history.replaceState({}, null);
			}
			$(document).ready(function(){
				$("#question").attr("class", "btn btn-outline ml-1 active");
			});
		});
	</script>

</body>
</html>