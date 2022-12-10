<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="reset.css" rel="stylesheet" type="text/css">
<link href="signUPstyle.css?ver=1" rel="stylesheet" type="text/css">
<!-- Bootstrap CSS -->

<title>수강신청</title>
<script>
	if (window.history.replaceState) {
		window.history.replaceState(null, null, window.location.href);
	}
	function btn1() {
		alert('신청되었습니다.');
	}
	function btn2() {
		var result = confirm("입력 초기화 하시겠습니까?");
	}
</script>
</head>
<body>
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
				<li><a href="StudentInfo.do">회원정보조회</a></li>
				<li><a href="SalesList.do">강사매출현황</a></li>
				<li><a href="main.jsp">홈으로</a></li>
			</ul>
		</div>
	</nav>

	<section>
		<div id="section">
			<div class="content">
				<h3>수강 신청</h3>
				<form action="SignUp.do" method="post">
					<table class="table-style">
						<tr>
							<th>수강월</th>
							<td>
								<div class="input-group mb-3">
									<input type="number" class="form-control" name="regist_month"
										placeholder="예)2022년 03월 -> 202203">
								</div>
							</td>
							
							
						</tr>
						<tr>
							<th>회원명</th>
							<td>
								<div class="input-group mb-3">
									<select class="choice" name="c_name" required>
										<option value="">회원명</option>
										<option value="홍길동">홍길동</option>
										<option value="장발장">장발장</option>
										<option value="임꺽정">임꺽정</option>
										<option value="성춘향">성춘향</option>
										<option value="이몽룡">이몽룡</option>
									</select>
								</div>
							</td>
						</tr>
						<tr>
							<th>회원번호</th>
							<td>
								<div class="input-group mb-3">
									<input type="number" class="form-control" name="c_no"
										placeholder="예)10001">
								</div>
							</td>
						</tr>
						<tr>
							<th>강의장소</th>
							<td>
								<div class="input-group mb-3">
									<select name="class_area" class="choice" required>
										<option value="">강의장소</option>
										<option value="서울본원">서울본원</option>
										<option value="성남분원">성남분원</option>
										<option value="대전분원">대전분원</option>
										<option value="부산분원">부산분원</option>
										<option value="대구분원">대구분원</option>
									</select>
								</div>
							</td>
						</tr>
						<tr>
							<th>강의명</th>
							<td>
								<div class="input-group mb-3">
									<select class="choice" name="teacher_code" required>
										<option value="">강의명</option>
										<option value="100">초급반</option>
										<option value="200">중급반</option>
										<option value="300">고급반</option>
										<option value="400">심화반</option>
									</select>
								</div>
							</td>
						</tr>
						<tr>
							<th>수강료</th>
							<td>
								<div class="input-group mb-3">
									<input type="number" name="tuition">
								</div>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<button type="submit"onclick="javascript:btn1()">수강신청</button>
								<button type="reset" onclick="javascript:btn2()">다시쓰기</button>
							</td>
						</tr>
					</table>
				</form>
			</div>
		</div>

	</section>

	<footer id="footer">
		<div>
			<p>Copyright&copy;&nbsp;All rights reserved.</p>
		</div>
	</footer>

</body>
</html>