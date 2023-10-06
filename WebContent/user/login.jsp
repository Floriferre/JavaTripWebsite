<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@include file="/common/header.jsp"%>
   <%@include file="/common/alert.jsp"%>
<c:if test="${!empty cookie.ssafy_id }">
	<c:set var="saveid" value="checked"></c:set>
	<c:set var="userid" value="${cookie.ssafy_id.value }"></c:set>
</c:if>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>EnjoyTrip | 로그인</title>
    <link rel="stylesheet" href="${root}/assets/css/style.css" />
    <link rel="stylesheet" href="${root}/assets/css/login.css" />
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
   <%@include file="/common/nav.jsp"%>
    <main>
      <div class="container">
        <section class="content">
          <div class="login-wrapper">
            <h1>로그인</h1>
			<form method="POST" action="${root}/user">
				<input type="hidden" name="action" value="login">
				<div class="form-check mb-2">
				  <input class="form-check-input" type="checkbox" value="ok" name="saveid" id="flexCheckChecked" ${saveid}>
				  <label class="form-check-label" for="flexCheckChecked">
				    아이디 저장
				  </label>
				</div>
	            <div class="mb-3">
	              <input
	                type="text"
	                class="form-control"
	                id="userid"
	                name="userid"
	                aria-describedby="emailHelp"
	                placeholder="아이디"
	                value="${userid}"
	              />
	            </div>
	            <div class="mb-3">
	              <input
	                type="password"
	                class="form-control"
	                id="userpassword"
	                name="userpwd"
	                placeholder="비밀번호"
	              />
	            </div>
	            <button type="submit" class="w-100 btn login-btn" id="loginBtn">로그인</button>
			</form>
          </div>
        </section>
      </div>
    </main>
<%@ include file="/common/footer.jsp"%>
