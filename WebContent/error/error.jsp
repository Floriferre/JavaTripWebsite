<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/header.jsp" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
      crossorigin="anonymous"
    />
    <link href="${root }/assets/css/style.css" rel="stylesheet" />
    <link href="${root }/assets/css/signup.css" rel="stylesheet" />
    <title>EnjoyTrip | 회원가입</title>
  </head>
  <body>
<%@include file="/common/nav.jsp" %>
      <div class="row justify-content-center">
        <div class="col-lg-8 col-md-10 col-sm-12">
          <h2 class="my-3 py-3 shadow-sm bg-light text-center">
            <mark class="sky">에러발생!!!</mark>
          </h2>
        </div>
          <div class="card text-center bg-light">
            <h2 class="fw-bold text-danger pt-3">처리 중 에러 발생 T.T</h2>
            <div class="card-body">
              <p class="card-text">
                ${msg}
              </p>
              <button type="button" id="btn-index" class="btn btn-outline-danger">
                메인 페이지 이동...
              </button>
            </div>
          </div>
        </div>
      </div>
    </div>
    <script>
      document.querySelector("#btn-index").addEventListener("click", function () {
        location.href = "${root}";
      });
    </script>
<%@ include file="/common/footer.jsp" %>
