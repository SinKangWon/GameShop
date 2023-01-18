<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title></title>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>

<link rel="stylesheet" href="/resources/css/bootstrap.min.css" />
<script type="text/javascript" src="/resources/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet">
<script>
   $(function() {
      $(".bi-heart").css("color", "#E0E0E0");
      $(".bi-heart-fill").css("color", "pink");
      
      $("tbody").on("click", ".bi-heart", e => {
         const icon = e.target;
         const game_id = $(icon).data("id");
         
         $.ajax("wish/" + game_id, {
            method: "PUT",
            success: result => {
               if(result == "OK") {
                  $(icon).removeClass("bi-heart");
                  $(icon).addClass("bi-heart-fill");
                  $(icon).css("color", "pink");
               } else {
                  alert("즐겨찾기 등록에 실패하였습니다");
               }
            },
            error: result => {
               alert("즐겨찾기는 로그인 이후에 가능합니다");
            }
         });
      });
   		
      $("tbody").on("click", ".bi-heart-fill", e => {
         const icon = e.target;
         const game_id = $(icon).data("id");
         
         $.ajax("wish/" + game_id, {
            method: "DELETE",
            success: result => {
               if(result == "OK") {
                  $(icon).removeClass("bi-heart-fill");
                  $(icon).addClass("bi-heart");
                  $(icon).css("color", "#E0E0E0");
               } else {
                  alert("즐겨찾기 삭제를 실패하였습니다")
               }
            },
            error: result => {
               alert("즐겨찾기는 로그인 이후에 가능합니다");
            }
         });
      });
   });
</script>


</head>
<body>
	<div class="container-fluid">
		<div>
			<h3>게임 목록</h3>
		</div>
		<form>
		<div>
			<select name="category">
				<option value="title">제목</option>
				<option value="contents">내용</option>
			</select>
			<input type="text" name="keywords" placeholder="검색어를 입력하시오">
			<button>검색</button>
		</div>
		</form>
		<div>
			<table class="table table-sm table-hover table-striped">
				<thead class="table-dark">
					<tr>
						<th>게임번호</th>
						<th>게임명</th>
						<th>게임회사</th>
						<th>가격</th>
						<th>출시일</th>
						<th>등록일</th>
					</tr>
				</thead>
				
				<tbody>
					<c:if test="${list.size() < 1}">
						<tr>
							<td colspan="5">검색 된 게임이 없습니다</td>
						</tr>
					</c:if>
					
					<c:forEach var="item" items="${list}">
						<tr>
							<td>${item.id}</td>
							<td>${item.title}</td>
							<td>${item.publisherId}</td>
							<td>${item.price}</td>
							<td><fmt:formatDate value="${item.pubDate}" pattern="yyyy-MM-dd"/></td>
							<td><fmt:formatDate value="${item.regDate}" pattern="yyyy-MM-dd"/></td>
							<td>
								<c:if test="${sessionScope.member.id == item.memberId}">
									<a href="delete/${item.id}" class="btn btn-sm btn-outline-danger"><i class="bi bi-trash-fill"></i></a> <a href="update/${item.id}" class="btn btn-sm btn-outline-primary"><i class="bi bi-tools"></i></a>
								</c:if>
							</td>
						</tr>
					</c:forEach>
				</tbody>					
			</table>

		</div>
		<div>
			<div>
				<a href="/game/add" class="btn btn-primary btn-sm mb-2">등록</a>
			</div>
			<div>
				<a href="dummy" class="btn btn-success btn-sm mb-2">대량 등록</a>
			</div>
			<div>
				<a href="init" class="btn btn-danger btn-sm mb-2">초기화</a>
			</div>
			<div>
				<a href=".." class="btn btn-secondary btn-sm mb-2">처음으로</a>
			</div>
		</div>		
	</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>