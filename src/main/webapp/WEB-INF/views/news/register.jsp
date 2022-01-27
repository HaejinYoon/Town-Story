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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
<link href="<%=request.getContextPath()%>/resource/favicon/favicon.png" rel="icon" type="image/x-icon" />

<style>
/*노랑 배경색 : #ffe164
  파랑 배경색 : #264d73
  빨간 포인트색 : #f0615c
  하늘색 배경색 : #eef2f6 */
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

.패딩정리 {
	padding-right: 0px;
	padding-left: 0px;
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

#input1, #input2, #input3, #input4, #input5 {
	border: solid;
	border-color: #264d73;
	padding-top: 20px;
	padding-bottom: 20px;
}

#input1, #input2, #input5, #input7 {
	width: 50%;
}

#input1, #input3, #input4, #input6 {
	background-color: #eef2f6;
}

#input1, #input2, #input3, #input4, #input5, #input6, #input7 {
	letter-spacing: 2px;
}

#input2, #input5 {
	background-color: darkgray;
	color: white;
	font-weight: bold;
}
#input3{
width:100%;
height: 40%;
}

#input4 {
	width: 100%;
	height: 200px;
	padding-block: 8px;
}

#input6 {
	border: solid;
	border-color: #264d73;
	width: 100%;
	padding-top: 4px;
	height: 40%;
}

#썸네일-글씨{
    font-size: larger;
    font-family: 'IBM Plex Sans KR', sans-serif;
    font-weight: bold;
    margin-top: 15px;
    color: cornflowerblue;
}

#image_container {
	border-bottom: solid;
	border-bottom-color: lightgray;
	margin-bottom: 20px;
	padding-bottom:15px;
	
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

.btn-register, .btn-cancel{
	font-size: xx-large;
	margin-bottom:40px;
	border-radius: 8px;
}

.btn-register {
	color: #f0615c;
	background-color:#ffe164;
}

.btn-cancel {
	color: white;
	padding: 7.5px;
	padding-block: 6px;
	background-color: #264d73;
	border: 1px solid;
	border-color:#264d73;
	margin-left:15px;
}
.btn-cancel:hover{
color:#ffe164;
}


</style>

<title>게시물 작성</title>
</head>
<body>
<b:header></b:header>
	<div class="container" id="body">
		<div class="row" id="inner">
			<div class="col 패딩정리">
			<b:innerNav></b:innerNav>
				<h1 class="게시글-타이틀">게시물 작성</h1>


			<form method="post" id="form" enctype="multipart/form-data">
				
				<input type="hidden" class="form-control" id="input1" name="memberId" value="${sessionScope.loginUser.id }">

					<div class="form-group1 게시물-테두리-패딩">
						<label for="input2" class="게시물-글씨">닉네임</label>
						<input type="text" class="form-control 인풋-글씨" id="input2" name="nickname" value="${sessionScope.loginUser.nickname }" readonly>
					</div>

					<div class="form-group1 게시물-테두리-패딩">
						<label for="input5" class="게시물-글씨">지역</label>
						<input type="text" class="form-control 인풋-글씨" name="location" value="${sessionScope.loginUser.location }" id="input5" readonly>
					</div>
					<div class="row">
						<div class="form-group1 게시물-테두리-패딩 col-md-8">
							<label for="input3" class="게시물-글씨">게시물 제목</label>
							<input type="text" class="form-control 인풋-글씨" id="input3" name="title">
						</div>
						<div class="form-group1 게시물-테두리-패딩 col-md-4">
							<label for="input6" class="게시물-글씨">태그</label>
							<select class="form-control 인풋-글씨 태그-패딩" id="input6" name="tag">
								<option value="기타" selected>태그 선택</option>
								<option value="사건사고">사건사고</option>
								<option value="광고">광고</option>
								<option value="기타">기타</option>
							</select>
						</div>
					</div>

					<div class="form-group1 게시물-테두리-패딩">
           				 <label for="input4" class="게시물-글씨">내용</label>
          				 <textarea class="form-control 인풋-글씨" id="input4" name="content"></textarea>
          			</div>
          

					<div class="form-group1 게시물-테두리-패딩 이미지-아래-테두리">
						<label for="input7" class="게시물-글씨 ">Image</label>
						<input type="file" class="form-control-file" id="input7" name="files" accept="image/*" onchange=setThumbnail(event) multiple>
				    </div>
				    
				    <!-- 구분 선 -->
				    <div id="d-line"></div>
				    
				    <!-- 미리보기 선택 알림 -->
				    <div id="choose_preview" class="d-flex"></div>
				    	
				    <!-- 이미지들 미리보기 컨테이너 -->
					<div id="image_container" class="d-flex"></div>


					<button class="btn btn-register" type="submit">등록</button>
					<a href="${pageContext.request.contextPath }/news/list" class="btn btn-cancel">취소</a>
				</form>

			</div>
		</div>
	</div>

	<script	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="	crossorigin="anonymous" referrerpolicy="no-referrer"></script>	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
	<script>
	
	function isEmpty(str) {
    	return !str.trim().length;
	}
	
	const title = document.getElementById('input3');
	const content = document.getElementById('input4');
	
	function check(event) {
  		
		if(isEmpty(title.value) || isEmpty(content.value)) {
			alert("제목과 내용은 필수 입력 사항입니다!");
			event.preventDefault();
		}
	}
	
	const form = document.getElementById('form');
	form.addEventListener('submit', check);
	
	var queue = [];
	var currentThumbnail;

	function delRef(index) {

		$("#image_container").empty();

		var dt = new DataTransfer();
		var input = document.getElementById('input7');
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
		
		if(queue.length <= 1) {
			$("#choose_preview").empty();
		}

		if (currentThumbnail == i) {
			if(input.files == 0) {
				currentThumbnail = null;
			} else {
				currentThumbnail = 1;
			}
		} else {
			if(currentThumbnail > index) {
				currentThumbnail = currentThumbnail-1;
			}

		}
		console.log("currentThumbnail", currentThumbnail);
		render(input.files, currentThumbnail);

	}

	function render(files, radioIndex) {

		var i = 0;
		for (const image of files) {
			
			var check;
			if (i == radioIndex) {
			check = "checked";
			} else {
			check = "";
			}
			const url = window.URL.createObjectURL(image); // blob:http://localhost:1234/28ff8746-94eb-4dbe-9d6c-2443b581dd30
			
				const replyMediaObject = $(`
            	<span id = "\${i}" style="height: 200px; width: 200px; position:relative;">
				
            	<div style = "position: absolute; z-index:100; opacity:1; top: 8px; left: 8px;">
					<label class= "container_radio">
						<input 
							\${check}
							type="radio" 
							id="thumbNailChoice\${i}"
							name="thumbNailChoice"
							value="\${image.name}"
							style = "position: relatve; z-index:101; opacity:0;"
							onclick="radioClick(\${i})"
						/>
						<span class="checkmark"></span>
					</label>
				</div>
				
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

	function setThumbnail(event) {

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
		var input = document.getElementById('input7');

		for (var i = 0; i < queue.length; i++) {
			var file = queue[i]
			dt.items.add(file)
			input.files = dt.files

		}

		if(currentThumbnail == null) {
			currentThumbnail = 0;
		} 

		/* 현재 미리보기는 모두 지워야 한다. */
		$("#image_container").empty();
		$("#d-line").empty();
		$("#choose_preview").empty();

		const line = $(`<div id="line"></div>`)

		$("#d-line").append(line);

		//업로드한 이미지가 하나 이상일 경우 썸네일 고르라는 문구를 띄운다.
		if (input.files.length > 1) {

			const notation = $(`<p id="썸네일-글씨">썸네일로 보여줄 이미지를 선택하세요 ! </p>`);

			$("#choose_preview").append(notation);

		} else {
			$("#choose_preview").empty();
		}

		//이미지 생성
		render(input.files, currentThumbnail);

	}
	$(document).ready(function () {


		$("#news").attr("class", "btn btn-outline ml-1 active");
	});

	function radioClick(index) {
		console.log("index", index);
		currentThumbnail = index;
	
	}

	//딜레이 만드는 함수
	function sleep(ms) {
		const wakeUpTime = Date.now() + ms;
		while (Date.now() < wakeUpTime) {}
	}
</script>
</body>
</html>