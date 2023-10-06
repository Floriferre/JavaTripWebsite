<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8"%>
<%@include file="/common/header.jsp"%>
<%@ include file="/common/confirm.jsp" %>
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
     <main>
      <div class="content">
        <section class="d-flex justify-content-between flex-column">
          <div>
            <h1>추천 여행지 리스트</h1>
            <p>이런 여행지는 어떠세요?</p>
          </div>
          <div class="d-flex justify-content-between align-items-start">
  

          </div>
        </section>

        <section class="post-list">
          <table class="table table-hover mb-5 text-center">
            <c:if test="${list.size() == 0 }">
              <h3>등록된 글이 없어요</h3>
            </c:if>
            <c:if test="${list.size() != 0 }">
            <thead>
              <tr>
                <th scope="col">TITLE</th>
                <th scope="col">OVERVIEW</th>
                <th scope="col">ADDRESS</th>

              </tr>
            </thead>
            <tbody>
              <c:forEach var="list" items="${list}">    
                <tr class="text-center">
                  <th scope="row">${list.title}</th>
                  <td class="post-title">
                    <a
                      href="#"
                      class="article-title link-dark"
                      data-no="${list.overview}"
                      style="text-decoration: none"
                    >
                      ${list.overview}
                    </a>
                  </td>
                  <td>${list.addr}</td>
                </tr>            
	          </c:forEach>
            </c:if>
            </tbody>
          </table>
          <div class="row">
            <!-- ${navigation.navigator} -->
          </div>
        </section>
      </div>
    </main>
   </div>
   <form id="form-param" method="get" action="">
     <input type="hidden" id="p-action" name="action" value="">
     <input type="hidden" id="p-pgno" name="pgno" value="">
     <input type="hidden" id="p-key" name="key" value="">
     <input type="hidden" id="p-word" name="word" value="">
   </form>
   <%@ include file="/common/footer.jsp" %>
   </body>

</html>