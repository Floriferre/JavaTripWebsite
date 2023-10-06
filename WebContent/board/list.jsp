<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/header.jsp"%>
<%@ include file="/common/confirm.jsp"%>
<%@ page
	import="com.ssafy.board.model.BoardDto, java.util.List, java.text.SimpleDateFormat, java.util.Collections, java.util.Date"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>EnjoyTrip | 게시판</title>
<link rel="stylesheet" href="${root}/assets/css/style.css" />
<link rel="stylesheet" href="${root}/assets/css/post.css" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" />
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap"
	rel="stylesheet" />
</head>
<body>
	<%@ include file="/common/nav.jsp"%>
	<main>
	<div class="content">
		<section class="d-flex justify-content-between flex-column">
			<div>
				<h1>게시글</h1>
				<p>여러분의 경험을 공유해주세요</p>
			</div>
			<div class="d-flex justify-content-between align-items-start">
				<div class="w-120">
					<a type=button class="btn create btn-sm"
						href="${root }/article?action=mvwrite">글 쓰기</a>
				</div>
				<div class="col-md-7 offset-3">
					<form class="d-flex" id="form-search" action="">
						<input type="hidden" name="action" value="list" /> <input
							type="hidden" name="pgno" value="1" /> <select name="key"
							id="key" class="form-select form-select-sm ms-5 me-1 w-50"
							aria-label="검색조건">
							<option value="" selected>검색조건</option>
							<option value="article_no">글번호</option>
							<option value="subject">제목</option>
							<option value="user_id">작성자</option>
						</select>
						<div class="input-group input-group-sm me-1">
							<input type="text" name="word" id="word" class="form-control"
								placeholder="검색어..." />
							<button id="btn-search" class="btn btn-dark" type="button">검색</button>
						</div>
						<div class="w-120">
							<button type="button" id="btn-reset"
								class="btn btn-primary btn-sm">초기화</button>
						</div>
					</form>
				</div>
			</div>
		</section>

		<section class="post-list">
			<table class="table table-hover mb-5 text-center">
				<c:if test="${articles.size() == 0 }">
					<h3>등록된 글이 없어요</h3>
				</c:if>
				<c:if test="${articles.size() != 0 }">
					<thead>
						<tr>
							<th scope="col">No</th>
							<th scope="col">제목</th>
							<th scope="col">작성자</th>
							<th scope="col">조회수</th>
							<th scope="col">작성일</th>
						</tr>
					</thead>
					<tbody>
						<!-- 정렬을 해야하는데, articles로 받아온 것을 정렬한다-->
						<!-- 생각해보니까 jsp는 자바 코드 넣는 거였네? ㅋㅋㅋㅋ 걍 자바코드로 정렬한다-->
						<%
							List<BoardDto> list = (List<BoardDto>) request.getAttribute("articles");
							System.out.println(list.size() + " 리스트 사이즈");
								// 버블 정렬   
								// 임시로 
								for (int i = 0; i < list.size(); i++) {
									for (int j = 0; j < list.size(); j++) {
										String todatfm = new SimpleDateFormat("yyyy-MM-dd")
												.format(new Date(System.currentTimeMillis()));
										SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

										Date day1 = dateFormat.parse(list.get(i).getRegisterTime());
										Date day2 = dateFormat.parse(list.get(j).getRegisterTime());

										int compare = day1.compareTo(day2);

										if (compare > 0) { // day1이 더 큼 : day1이 더 늦은 날짜면 서로 바꿔주기 
											Collections.swap(list, i, j);
										}
									}
								}
						%>
				
						
						<c:forEach var="article" items="${articles}">
							<tr class="text-center">
								<th scope="row">${article.articleNo}</th>
								<td class="post-title"><a href="#"
									class="article-title link-dark" data-no="${article.articleNo}"
									style="text-decoration: none">
										${article.subject} </a></td>
								<td>${article.userId}</td>
								<td>${article.hit}</td>
								<td>${article.registerTime}</td>
							</tr>
						</c:forEach>
				</c:if>
				</tbody>
			</table>
			<div class="row">${navigation.navigator}</div>
		</section>
	</div>
	</main>
	</div>
	<form id="form-param" method="get" action="">
		<input type="hidden" id="p-action" name="action" value=""> <input
			type="hidden" id="p-pgno" name="pgno" value=""> <input
			type="hidden" id="p-key" name="key" value=""> <input
			type="hidden" id="p-word" name="word" value="">
	</form>
	<%@ include file="/common/footer.jsp"%>
</body>
<script>
	let titles = document.querySelectorAll(".article-title");
	titles.forEach(function(title) {
		title.addEventListener("click", function() {
			console.log(this.getAttribute("data-no"));
			location.href = "${root}/article?action=view&articleno="
					+ this.getAttribute("data-no");
		});
	});

	document.querySelector("#btn-search").addEventListener("click", function() {
		let form = document.querySelector("#form-search");
		form.setAttribute("action", "${root}/article");
		form.submit();
	});

	let pages = document.querySelectorAll(".page-link");
	pages.forEach(function(page) {
		page.addEventListener("click", function() {
			console.log(this.parentNode.getAttribute("data-pg"));
			document.querySelector("#p-action").value = "list";
			document.querySelector("#p-pgno").value = this.parentNode
					.getAttribute("data-pg");
			document.querySelector("#p-key").value = "${param.key}";
			document.querySelector("#p-word").value = "${param.word}";
			document.querySelector("#form-param").submit();
		});
	});

	document.querySelector("#btn-reset").addEventListener(
			"click",
			function() {
				document.querySelector("#p-action").value = "list";
				document.querySelector("#p-pgno").value = this.parentNode
						.getAttribute("data-pg");
				document.querySelector("#p-key").value = "";
				document.querySelector("#p-word").value = "";
				document.querySelector("#form-param").submit();
			})
</script>
</html>