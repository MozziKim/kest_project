<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="reset.css" rel="stylesheet" type="text/css">
<link href="style.css" rel="stylesheet" type="text/css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<script>
	$(document).ready(function() {
		$('.bxslider').bxSlider({
			auto : true, // 자동으로 애니메이션 시작
			speed : 500, // 애니메이션 속도
			pause : 5000, // 애니메이션 유지 시간 (1000은 1초)
			mode : 'horizontal', // 슬라이드 모드 ('fade', 'horizontal', 'vertical' 이 있음)
			autoControls : false,
 			pager : false,
			captions : false, // 이미지 위에 텍스트를 넣을 수 있음
		});
	});
</script>
<title>KEST PROJECT</title>
</head>
<body>
	<div class="container">

		<header id="header">
			<h1>
				<a href="main.jsp">S<span>.</span></a>
			</h1>
		</header>

		<nav>
			<div id="nav">
				<ul>
					<li><a href="TeacherInfo.do">강사조회</a></li>
					<li><a href="SignUp.jsp">수강신청</a></li>
					<li><a href="Studentinfo.do">회원정보조회</a></li>
					<li><a href="SalesList.do">강사매출현황</a></li>
					<li><a href="main.jsp">홈으로</a></li>
				</ul>
			</div>
		</nav>
		<section>
			<div id="section">
				<div class="slider">
					<ul class="bxslider">
						<li><img width="100%" alt="카타르"
							src="https://assets.goal.com/v3/assets/bltcc7a7ffd2fbf71f5/blt2b1c4c328872d9b4/634f8686318144758a13da59/20221019_5539.jpg"></li>
						<li><img alt="손흥민"
							src="http://res.heraldm.com/content/image/2022/10/27/20221027000556_0.jpg"></li>
						<li><img alt="조규성"
							src="https://static-cdn.sporki.com/news/ytn/202211/283163/c_202211291715518049_t.jpg"></li>
						<li><img alt="황희찬"
							src="https://img.sbs.co.kr/newimg/news/20221203/201727018_1280.jpg"></li>
						<li><img alt="이강인"
							src="http://img.sbs.co.kr/newimg/news/20221206/201727814.jpg"></li>
					</ul>
				</div>

				<div class="content">
					<img alt="pic"
						src="https://mblogthumb-phinf.pstatic.net/MjAyMTAxMjFfNzgg/MDAxNjExMjMyOTE2Mzc5.LIte8frntq1iH8YcvPOvAY8sBQ-DiW1hvRmDhkDthkwg.NYY71P_KdH6Dnk9FEM5slaUyegeyjUrE3AmlAfLcrrUg.JPEG.dntmd0411/1.jpg?type=w800">
					<img alt="pic"
						src="https://w.namu.la/s/8da96a5e7723ecde2c24cb1f871e203e238e9110652abc26cf51519863bccd6decb356a870cad05af4b3c3f34c88217b46262b74cc1ad98458439d6b32cde45193a6ee9d27c807c672e775deac47f460cfc54c92f9b9fe6bae2fd28582d9fdaeea421bad6ea7c21511eede5a4540ce95">

				</div>
			</div>
		</section>

		<footer>
			<div id="footer">
				<p>Copyright&copy;&nbsp;All rights reserved.</p>
			</div>
		</footer>
	</div>
</body>
</html>