<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8"%>
<%@ include file="/common/header.jsp" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>EnjoyTrip | 글 쓰기</title>
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
    <%@ include file="/common/confirm.jsp" %>
   <main>
     <div class="content">
       <form id="form-register" method="POST" action="">
         <input type="hidden" name="action" value="write">
         <input
           type="text"
           class="form-control create-title mb-3 p-3 fs-4"
           placeholder="제목을 입력해주세요"
           id="subject"
           name="subject"
         />
         <textarea
           class="form-control p-3 mb-3"
           name="content"
           id="content"
           cols="30"
           rows="10"
           placeholder="내용을 입력해주세요"
         ></textarea>
         <button type="button" id="btn-register" class="btn btn-outline-secondary">작성하기</button>
         <a class="btn btn-outline-danger" href="${root }/article?action=list">취소</a>
       </form>
     </div>
   </main>
	<%@ include file="/common/footer.jsp" %>
	</body>
    <script>
      document.querySelector("#btn-register").addEventListener("click", function () {
        if (!document.querySelector("#subject").value) {
          alert("제목 입력!!");
          return;
        } else if (!document.querySelector("#content").value) {
          alert("내용 입력!!");
          return;
        } else {
          let form = document.querySelector("#form-register");
          form.setAttribute("action", "${root}/article");
          form.submit();
        }
      });
    </script>
</html>