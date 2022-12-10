<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="reset.css" rel="stylesheet" type="text/css">
<link href="Liststyle.css?ver=1" rel="stylesheet" type="text/css">
<title>강사매출현황</title>
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
			<h3>강사 매출 현황</h3>
			<table class="table-style">
				<tr>
					<th>강사코드</th>
					<th>강의명</th>
					<th>강사명</th>
					<th>총매출</th>
				</tr>

				<c:forEach var="c_list" items="${SalesList}">
					<tr>
						<td>${c_list.teacher_code}</td>
						<td>${c_list.class_name}</td>
						<td>${c_list.teacher_name}</td>
						<td>${c_list.tuition}</td>
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