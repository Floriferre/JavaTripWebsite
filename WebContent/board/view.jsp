<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8"%>
<%@ include file="/common/header.jsp" %>
<c:if test="${article eq null}">
	<script>
	alert("글이 삭제되었거나 부적절한 URL 접근입니다.");
	location.href = "${root}/article?action=list";
	</script>
</c:if>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>EnjoyTrip | ${article.subject }</title>
    <link rel="stylesheet" href="${root}/assets/css/style.css" />
    <link rel="stylesheet" href="${root}/assets/css/post.css" />
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
      crossorigin="anonymous"
    />
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css"
    />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap"
      rel="stylesheet"
    />
  </head>
  <body>
      <%@ include file="/common/nav.jsp" %>
      <main class="content">
      <div class="mb-4">
        <a class="btn btn-outline-secondary" href="${root }/article?action=list">글 목록</a>
        <a class="btn btn-outline-secondary">이전글</a>
        <a class="btn btn-outline-secondary">다음글</a>
      </div>
      <div class="wrapper">
        <div class="d-flex justify-content-between">
          <div>
            <h3>${article.subject}</h3>
            <div class="d-flex gap-3 detail-info">
              <p class="mb-1">${article.userId }</p>
              <p class="mb-1">조회수 ${article.hit }</p>
              <p class="mb-1">${article.registerTime }</p>
            </div>
          </div>
          <c:if test="${userinfo.userId eq article.userId}">
            <div class="dropdown">
              <button
                class="btn"
                type="button"
                data-bs-toggle="dropdown"
                aria-expanded="false"
              >
                <i class="bi bi-three-dots-vertical"></i>
              </button>
              <ul class="dropdown-menu">
                <li>
                  <a class="dropdown-item" href="${root }/article?action=mvmodify&articleno=${article.articleNo}">수정하기</a>
                </li>
                <li>
                  <button id="delete-btn" class="dropdown-item text-danger" href="">삭제하기</button>
                </li>
              </ul>
            </div>
          </c:if>
        </div>
        <hr />
        <div>
          ${article.content}
        </div>
        <div>
          <div></div>
        </div>
      </div>
    </main>
    <%@ include file="/common/footer.jsp" %>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
  	<script>
  		document.querySelector("#delete-btn").addEventListener("click", function() {
  			if(confirm("정말 삭제하시겠습니까?")) {
  				console.log("삭제")
  				location.href = "${root }/article?action=delete&articleno=${article.articleNo}"
  			}
  		})
  	</script>
  </html>