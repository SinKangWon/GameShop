<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>

<link rel="stylesheet" href="/resources/css/bootstrap.min.css" />
<script type="text/javascript"
	src="/resources/js/bootstrap.bundle.min.js"></script>
<style>
img {
	height: 240px;
}
</style>
</head>
<body>
${sessionScope.member.id}
${sessionScope.member.passwd}
${sessionScope.member.name}
${sessionScope.member.regDate}
	<div class="container">
		<h1>GameShop 2022</h1>

		<ul>
			<li><a href="/login">로그인</a> </li>
			<li><a href="/logout">로그아웃</a> </li>
			<li><a href="game/list">게임 관리</a></li>
			<li><a href="publisher/list">게임회사 관리</a></li>
			<li><a href="/html/publisher.html">게임회사 관리 (REST, AJAX)</a></li>
		</ul>
	</div>

	<!-- Modal -->
	<div class="modal fade" id="loginModal" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5">LOGIN</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"	aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form method="post" action="/login">
						<div class="form-group">
							<label class="form-label">아이디:</label> 
							<input type="text" name="id" class="form-control form-control-sm">
						</div>

						<div class="form-group">
							<label class="form-label">비밀번호:</label> 
							<input type="password" name="passwd" class="form-control form-control-sm">
						</div>

						<div class="form-group mt-3">
							<button class="btn btn-sm btn-primary">로그인</button>
							<a href="signup">회원가입</a>					
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-sm btn-secondary" data-bs-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>