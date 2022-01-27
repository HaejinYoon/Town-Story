<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<style>
#location, #news, #question, #life, #help, #keyword, #icon {
	border: 3px solid;
	border-color: #2f6091;
	border-radius: 4px;
	font-size: large;
	margin-bottom: 8px;
}

#news, #question, #life, #help {
	margin-inline: 1px;
	padding-inline: 15px;
}

#n_all, #n_accident, #n_adv, #n_other, #q_all, #q_question, #q_suggest,
	#q_declaration, #q_other, #l_all, #l_life, #l_hobby, #l_movdra, #l_pet,
	#l_other, #h_All, #h_buy, #h_care, #h_move, #h_other {
	border: 2px solid;
	border-color: #2f6091;
	border-radius: 4px;
	font-size: medium;
}

.메뉴바-아래-호버 {
	border-radius: 7px;
}

#nav-color {
	background-color: #ffe164;
	border-radius: 6px;
	margin-top: 20px;
	margin-bottom: 20px;
	border: 3px solid;
	border-color: #2f6091;
	z-index: 980;
	font-family: 'Jua', sans-serif;
	padding-bottom: 0px;
}

#keyword {
	height: 43px;
	width: 325px;
}

#icon {
	float: right;
	margin-top: -50px;
	background-color: #f5f5f5;
	padding: 10px 12px;
	height: 41px;
	position: relative;
	z-index: 990;
	border-color: #2f6091;
	border-radius: 4px;
	margin-bottom: 0px;
	diplay: felx;
	align-item: center;
	padding-top: 6px;
}

a.goTop {
	position: fixed;
	right: 50px;
	bottom: 30px;
	color: #264d73;
	z-index: 999;
	width: 8.5%;
}

#위로-가자 {
	color: white;
	background-color: #2f6091;
	border-color: 2px solid white;
	border-radius: 5px;
}

.active {
	background-color: #264d73;
	color: white;
}

#nav-sub {
	list-style-type: none;
	float: left;
}

#wrap {
	position: relative;
}

#wrap ul {
	margin: 0;
	padding: 0;
	list-style: none;
}

#wrap li {
	float: left;
}

#wrap>ul>li>a {
	display: inline-block;
	padding: 18px 0 20px 0;;
	width: 250px;
	background: #d0d0d0;
	text-align: center;
	font-weight: bold;
	font-size: 16px;
	color: #000
}

#wrap li ul li a {
	display: inline-block;
	padding: 5px 20px;
	font-size: 12px;
	color: #fff;
}

#wrap li ul li a:hover {
	color: #000
}

#wrap li ul.news {
	display: none;
	position: absolute;
	top: 53px;
	left: 40px;
	padding: 5px;
	background-color: #ffe164;
	border: 3px solid #2f6091;
	border-top: 0px;
	height: fit-content;
}

#wrap li ul.question {
	display: none;
	position: absolute;
	top: 53px;
	left: 100px;
	padding: 5px;
	background-color: #ffe164;
	border: 3px solid #2f6091;
	border-top: 0px;
	height: fit-content;
}

#wrap li ul.life {
	display: none;
	position: absolute;
	top: 53px;
	left: 170px;
	padding: 5px;
	background-color: #ffe164;
	border: 3px solid #2f6091;
	border-top: 0px;
	height: fit-content;
}

#wrap li ul.help {
	display: none;
	position: absolute;
	top: 53px;
	left: 250px;
	padding: 5px;
	background-color: #ffe164;
	border: 3px solid #2f6091;
	border-top: 0px;
	height: fit-content;
}

#wrap>ul>li:hover>ul {
	display: block;
}

nav {
	margin-right: 0px !important;
	padding-right: 0px !important;
}
</style>

<nav class="navbar navbar-expand-sm navbar-dark sticky-top" aria-label="Third navbar example" id="nav-color">
	<div class="container-fluid">
		<div class="collapse navbar-collapse" id="wrap">
			<ul class="navbar-nav me-auto mb-2 mb-sm-0 main1">
				<li class="nav-item">
					<form method="get">
						<select class="custom-select" id="location" style="height: 100%" name="location" onchange="locationChange()">
							<option value="" <c:if test="${location eq '' || empty location}">selected</c:if>>Region</option>
							<option <c:if test="${location eq '강남구'}">selected</c:if>>강남구</option>
							<option <c:if test="${location eq '마포구'}">selected</c:if>>마포구</option>
							<option <c:if test="${location eq '서초구'}">selected</c:if>>서초구</option>
						</select>
					</form>
				</li>
				<!-- 나중엘 radio 버튼으로 교체 -->
				<!-- <li id="nav-all" class="nav-item">
					<button type="button" id="all" class="btn btn-outline-dark ml-1">전체보기</button>
				</li> -->
				<li id="nav-news" class="nav-item">
					<button type="button" id="news" class="btn btn-outline-dark ml-1">동네소식</button>
					<ul id="nav-sub" class="news 메뉴바-아래-호버">
						<!-- <li id="nav-sub" class="nav-item accident">
							<button type="button" id="n_all" class="btn btn-outline-dark ml-1">전체보기</button>
						</li> -->
						<li id="nav-sub" class="nav-item accident">
							<button type="button" id="n_accident" class="btn btn-outline-dark ml-1">사건/사고</button>
						</li>
						<li id="nav-sub" class="nav-item adv">
							<button type="button" id="n_adv" class="btn btn-outline-dark ml-1">광고</button>
						</li>
						<li id="nav-sub" class="nav-item other1">
							<button type="button" id="n_other" class="btn btn-outline-dark ml-1">기타</button>
						</li>
					</ul>
				</li>
				
				<!-- 질문 -->
				<li id="nav-question" class="nav-item">
					<button type="button" id="question" class="btn btn-outline-dark ml-1">동네신문고</button>
					<ul id="nav-sub" class="question 메뉴바-아래-호버">
						<!-- <li id="nav-sub" class="nav-item lostnfound">
							<button type="button" id="q_all" class="btn btn-outline-dark ml-1">전체보기</button>
						</li> -->

						<li id="nav-sub" class="nav-item lostnfound">
							<button type="button" id="q_question" class="btn btn-outline-dark ml-1">질문</button>
						</li>
						<li id="nav-sub" class="nav-item conven">
							<button type="button" id="q_suggest" class="btn btn-outline-dark ml-1">건의사항</button>
						</li>
						<li id="nav-sub" class="nav-item complain">
							<button type="button" id="q_declaration" class="btn btn-outline-dark ml-1">신고합니다!</button>
						</li>
						<li id="nav-sub" class="nav-item suggest">
							<button type="button" id="q_other" class="btn btn-outline-dark ml-1">기타</button>
						</li>

					</ul>
				</li>
				
				<!-- life -->
				<li id="nav-life" class="nav-item">
					<button type="button" id="life" class="btn btn-outline-dark ml-1">일상생활</button>
					<ul id="nav-sub" class="life 메뉴바-아래-호버">
						<!-- <li id="nav-sub" class="nav-item nlife">
							<button type="button" id="l_all" class="btn btn-outline-dark ml-1">전체보기</button>
						</li> -->
						<li id="nav-sub" class="nav-item nlife">
							<button type="button" id="l_life" class="btn btn-outline-dark ml-1">일상</button>
						</li>
						<li id="nav-sub" class="nav-item hobby">
							<button type="button" id="l_hobby" class="btn btn-outline-dark ml-1">취미</button>
						</li>
						<li id="nav-sub" class="nav-item movdra">
							<button type="button" id="l_movdra" class="btn btn-outline-dark ml-1">영화 & 드라마</button>
						</li>
						<li id="nav-sub" class="nav-item pet">
							<button type="button" id="l_pet" class="btn btn-outline-dark ml-1">반려동물</button>
						</li>
						<li id="nav-sub" class="nav-item other3">
							<button type="button" id="l_other" class="btn btn-outline-dark ml-1">기타</button>
						</li>
					</ul>
				</li>
				<li id="nav-help" class="nav-item ">
					<button type="button" id="help" class="btn btn-outline-dark ml-1">해주세요</button>
					<ul id="nav-sub" class="help 메뉴바-아래-호버">
						<!-- <li id="nav-sub" class="nav-item hlepAll">
							<button type="button" id="h_All" class="btn btn-outline-dark ml-1">전체보기</button>
						</li> -->
						<li id="nav-sub" class="nav-item buy ">
							<button type="button" id="h_buy" class="btn btn-outline-dark ml-1">사다주세요</button>
						</li>
						<li id="nav-sub" class="nav-item care">
							<button type="button" id="h_care" class="btn btn-outline-dark ml-1">맡아주세요</button>
						</li>
						<li id="nav-sub" class="nav-item move">
							<button type="button" id="h_move" class="btn btn-outline-dark ml-1">옮겨주세요</button>
						</li>
						<li id="nav-sub" class="nav-item other4">
							<button type="button" id="h_other" class="btn btn-outline-dark ml-1">기타</button>
						</li>
					</ul>
				</li>
			</ul>

			<form class="ml-1" method="get" onsubmit="return false;">
				<input class="form-control" type="text" placeholder="검색어를 입력하세요" id="keyword" aria-label="Search" />
				<label id=icon>
					<i class="fa fa-search" aria-hidden="true"></i>
				</label>
			</form>
		</div>
	</div>
</nav>



<script>
function locationChange() {
	
	//현재 위치
	var location = $("#location option:selected").val();
	var board = "${boardType}"
	var tag = "${tag}"
	//현재 태그
	
	//question 게시판 전용
	if(board == "question") {
		
		console.log(location);
		
		if(location == "") {
			console.log("empty");
			location  = "";
		} else {
			
			console.log("question borad location, not empty");
			location = "&location="+location;
		}
		
		if(tag == null || tag == "") {
			
			tag = "";
		} else {
			tag = "&tag="+tag;
		}
		
		window.location.href = "/controller1/question/list?page=1"+location+tag;
		return 
	}
	
	if(location == "") {
		console.log("empty");
		location  = "?";
	} else {
		location = "?location="+location;
	}
	
	console.log(tag);
	
	if(tag == null || tag == "") {
		
		tag = "";
	} else {
		tag = "&tag="+tag;
	}
	
	window.location.href = "/controller1/"+board+"/list"+location+tag;

	/*
	var link = window.location.href;
	const regex = /(location=.*)(?=&|$)/i;
	//빈 문자열이면 현재의 위치를 없애버린다.
	if(location == "") {
		
		const regex1 = /(&location=.*)(?=&|$)/i;
		const regex2 = /(\?location=.*)(?=&|$)/i;
		link = link.replace(regex1, "");
		link = link.replace(regex2, "");
		window.location.href = link;
		return
	
	} else {
		if(link.includes('?')) {
				
			if(link.includes("location")) {
				
				window.location.href = link.replace(regex , "location="+location);
			} else {
				window.location.href = link + "&location=" + location;
			}
			
			
		} else {
			
			window.location.href = link + "?location=" + location;
		}
		

		
	}
	*/
}

	$(document).ready(function() {
		//현재의 tag 값과 region 값을 가져온다.
		var loc = "${location}";
		var tag    = "${tag}";
		//console.log(region);
		
		//현재 model의 값으로 select 박스의 값 세팅 (나중에 )
		//$("#region").val(region).attr("selected", "selected");
		
		//검색 아이콘 누르면 call되는 함수 (현재 입력창에 있는 값을 받아서 넘긴다. 현재 select 상태와 버튼 눌려진 상태를 포함한다.) 
		$("#icon").click(function() {
			var query = $("#keyword").val();
			
			//빈 문자열이면 return 시켜 실행되지 않게 한다.
			if(query== "") {
				return 
			}
			
			//&이 포함되면 안된다...
			if(query.includes('&')) {
				alert('&은 검색 문자열에 포함할 수 없습니다!')
				return 
			}
			
			var link = window.location.href;
			
			
			if(link.includes('query')) {
				const regex = /(query=.*)(?=&|$)/i;
				console.log(link.replace(regex, "query=" + query))
				location.href = link.replace(regex , "query=" + query)
				
			} else {
				
				if(link.includes('?')) {
					location.href = link + "&query="+query;

				} else {
					location.href = link + "?query="+query;
				}
				
			}
		})
		
		//model attribute에서 현재 어느 태그인지 검사하고 select의 현재 상태 변경시기키 (model 값을 스크립트 내부에서 사용해야 한다.)
		$("#all").click(function() {
			var loc = $("#location option:selected").val();
			location.href = "/controller1/all/list";
		});
		
		//-----------------------news 버튼들 -----------------------
		$("#news").click(function() {
			var loc = $("#location option:selected").val();
			location.href = "/controller1/news/list";
		});
		
		$("#n_all").click(function() {
			location.href = "/controller1/news/list?"+ getLocation();
		});
		
		$("#n_news").click(function() {
			location.href = "/controller1/news/list?tag=동네소식"+ getLocation();
		});
		
		$("#n_accident").click(function() {
			location.href = "/controller1/news/list?tag=사건사고"+ getLocation();
		});
		
		$("#n_adv").click(function() {
			location.href = "/controller1/news/list?tag=광고"+ getLocation();
		});
		
		$("#n_other").click(function() {
			location.href = "/controller1/news/list?tag=기타"+ getLocation();
		});
		
		//-----------------------question 버튼들 -----------------------
		$("#question").click(function() {
			var loc = $("#location option:selected").val();
			location.href = "/controller1/question/list?page=1";
		});
		
		$("#q_all").click(function() {
			location.href = "/controller1/question/list?page=1"+ getLocation();
		});
		
		$("#q_question").click(function() {
			window.location.href = "/controller1/question/list?page=1&tag=질문"+ getLocation();
		})

		$("#q_declaration").click(function() {
			window.location.href = "/controller1/question/list?page=1&tag=신고합니다!"+ getLocation();
		})

		$("#q_suggest").click(function() {
			window.location.href = "/controller1/question/list?page=1&tag=건의사항" + getLocation();
		})

		$("#q_other").click(function() {
			window.location.href = "/controller1/question/list?page=1&tag=기타" + getLocation();
		})

		//----------------------- life 버튼들 -----------------------
		$("#life").click(function() {
			var loc = $("#location option:selected").val();
			location.href = "/controller1/life/list";
		});
		
		$("#l_all").click(function() {
			window.location.href = "/controller1/life/list?" + getLocation();
		})
		
		$("#l_life").click(function() {
			window.location.href = "/controller1/life/list?tag=일상" + getLocation();
		})
		
		$("#l_hobby").click(function() {
			window.location.href = "/controller1/life/list?tag=취미" + getLocation();
		})
		
		$("#l_movdra").click(function() {
			window.location.href = "/controller1/life/list?tag=영화드라마" + getLocation();
		})
		
		$("#l_pet").click(function() {
			window.location.href = "/controller1/life/list?tag=반려동물" + getLocation();
		})
		
		$("#l_other").click(function() {
			window.location.href = "/controller1/life/list?tag=기타" + getLocation();
		})

		
	
		//----------------------- help 버튼들 -----------------------
		$("#help").click(function() {
			var loc = $("#location option:selected").val();
			location.href = "/controller1/help/list"
		});
		
		$("#h_All").click(function() {
			location.href = "/controller1/help/list?" + getLocation();
		})
		$("#h_buy").click(function() {
			window.location.href = "/controller1/help/list?tag=사다주세요"+ getLocation();
		})
		$("#h_care").click(function() {
			window.location.href = "/controller1/help/list?tag=맡아주세요"+ getLocation();
		})
		$("#h_move").click(	function() {
			window.location.href = "/controller1/help/list?tag=옮겨주세요"+ getLocation();
		})
		$("#h_other").click(function() {
			location.href = "/controller1/help/list?tag=기타" + getLocation();
		})
		
		
		
		function getLocation() {


			var location = '';
			console.log(location);
			if (location == "") {
				return "";
			} else {
				return "&location=" + location;
			}

	}
	})
	
</script>

<a class="goTop" href="#top">
<!-- 	<i class="fas fa-arrow-up a-fw fa-3x m-r-3 go-to-the-top"></i> -->
	<button class="goTop" id="위로-가자"><i class="fas fa-chevron-up fa-3x"></i> <h3>Top</h3></button>
</a>