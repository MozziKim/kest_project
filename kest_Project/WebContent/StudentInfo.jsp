<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="reset.css" rel="stylesheet" type="text/css">
<link href="Liststyle.css?ver=1" rel="stylesheet" type="text/css">
<title>회원정보조회</title>
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

	<section id="section">
		<div class="content">
			<h3>회원정보조회</h3>
			<table class="table-style">
				<tr>
					<th>수강월</th>
					<th>회원번호</th>
					<th>회원명</th>
					<th>강의명</th>
					<th>강의장소</th>
					<th>수강료</th>
					<th>등급</th>
				</tr>

				<c:forEach var="s_list" items="${student_list}">
					<tr>
						<td>${s_list.regist_month}</td>
						<td>${s_list.c_no}</td>
						<td>${s_list.c_name}</td>
						<td>${s_list.teacher_code}</td>
						<td>${s_list.class_area}</td>
						<td>${s_list.tuition}</td>
						<td>${s_list.grade}</td>
					</tr>
				</c:forEach>

			</table>
		</div>

	</section>

	<footer id="footer">
		<div>
			<p>Copyright&copy;&nbsp;All rights reserved.</p>
		</div>
	</footer>

</body>
</html>