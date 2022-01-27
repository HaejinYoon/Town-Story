<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">



<style>
.display-44, .lead4, .plist {
	text-align: center;
	font-weight: bold;
}

#전체-아래-카피라이트 {
	border-bottom: 100px;
	border-bottomp-color: #264d73;
	background-color: #264d73;
	color: white;
	font-family: 'IBM Plex Sans KR', sans-serif;
	font-weight: bold;
}

#전체-아래-넓이 {
	height: 100px;
	background-color: #264d73;
}

hr {
	background-color: #eef2f6;
}

.footer-link {
	color: white;
}

.footer-dark {
	padding: 50px 0;
	color: #f0f9ff;
}

.footer-dark h3 {
	margin-top: 0;
	margin-bottom: 12px;
	font-weight: bold;
	font-size: 16px;
}

.footer-dark ul {
	padding: 0;
	list-style: none;
	line-height: 1.6;
	font-size: 16px;
	margin-bottom: 0;
}

.footer-dark ul a {
	color: white;
	text-decoration: none;
	opacity: 0.6;
}

.footer-dark ul a:hover {
	opacity: 0.8;
}

@media ( max-width :767px) {
	.footer-dark .item:not(.social) {
		text-align: center;
		padding-bottom: 20px;
	}
}

.footer-dark .item.text {
	margin-bottom: 36px;
}

@media ( max-width :767px) {
	.footer-dark .item.text {
		margin-bottom: 0;
	}
}

.footer-dark .item.text p {
	opacity: 0.6;
	margin-bottom: 0;
}

.footer-dark .item.social {
	text-align: center;
}

@media ( max-width :991px) {
	.footer-dark .item.social {
		text-align: center;
		margin-top: 20px;
	}
}

.footer-dark .item.social>a {
	font-size: 20px;
	width: 36px;
	height: 36px;
	line-height: 36px;
	display: inline-block;
	text-align: center;
	border-radius: 50%;
	box-shadow: 0 0 0 1px rgba(255, 255, 255, 0.4);
	margin: 0 8px;
	color: #fff;
	opacity: 0.75;
}

.footer-dark .item.social>a:hover {
	opacity: 0.9;
}

.footer-dark .copyright {
	text-align: center;
	padding-top: 24px;
	opacity: 0.3;
	font-size: 19px;
	margin-bottom: 0;
}

#footer-logo {
	height: 40px;
	width: 40px;
	margin-bottom: 15px;
}

.container-logo {
	align-content: center;
}

.item {
	font-family: 'IBM Plex Sans KR', sans-serif;
	font-weight: bold;
}
</style>

<body>
	<div id="전체-아래-카피라이트">
		<hr>
		<h1 class="display-44">
			Welcome to 올뺌타운
			<img src="<%=request.getContextPath()%>/resource/logo/Logo.png" alt="타운&스토리" id="footer-logo">
		</h1>
		<p class="lead4">지역 기반 게시판 커뮤니티입니다. 거주하는 지역을 선택하시고 주변 주민들과 소통하세요.</p>
		<hr class="my-4">
		<div class="footer-dark">
			<footer>
				<div class="container">
					<div class="row">
						<div class="col-sm-6 col-md-3 item">
							<h3>Services</h3>
							<ul>
								<li>
									<a href="#" class="footer-link">Web design</a>
								</li>
								<li>
									<a href="#" class="footer-link">Development</a>
								</li>
								<li>
									<a href="#" class="footer-link">Hosting</a>
								</li>
							</ul>
						</div>
						<div class="col-sm-6 col-md-3 item">
							<h3>About</h3>
							<ul>
								<li>
									<a href="#" class="footer-link">Company</a>
								</li>
								<li>
									<a href="#" class="footer-link">Team</a>
								</li>
								<li>
									<a href="#" class="footer-link">Careers</a>
								</li>
							</ul>
						</div>
						<div class="col-md-6 item text">
							<h3>올뺌s</h3>
							<p>2021년 (디지털컨버전스)디지털 데이터 융합 JAVA응용 SW개발자 전문과정</p>
							<p>임지현 e-mail : limdotori0922@gmail.com</p>
							<p>윤해진 e-mail : hjyoomp@gmail.com</p>
							<p>강종관 e-mail : kjk732@gmail.com</p>
							<p>정성결 e-mail : sasa5680@naver.com</p>
							<p>이지연 e-mail : devjenlee@gmail.com</p>
						</div>
						<div class="col item social">
							<a href="https://limdotori.tistory.com/" target="_blank">
								<i class="fas fa-blog"></i>
							</a>
							<a href="https://www.instagram.com/zhi_xian5799/" target="_blank">
								<i class="fab fa-instagram"></i>
							</a>
						</div>
					</div>
					<p class="copyright">올뺌s © 2022</p>
				</div>
			</footer>
		</div>
		<div id="전체-아래-넓이"></div>
	</div>