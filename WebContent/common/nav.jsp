<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
 <%@include file="/common/header.jsp" %>
 <nav class="navbar fixed-top navbar-expand-lg py-4" data-bs-theme="dark">
      <div class="container">
        <a class="navbar-brand fw-bold" href="${root}/index.jsp">EnjoyTrip</a>
        <button
          class="navbar-toggler"
          type="button"
          data-bs-toggle="collapse"
          data-bs-target="#navbarSupportedContent"
          aria-controls="navbarSupportedContent"
          aria-expanded="false"
          aria-label="Toggle navigation"
        >
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="navbar-nav me-auto mb-2 mb-lg-0">
            <li class="nav-item">
              <a class="nav-link" aria-current="page" href="${root }/user/place.jsp"
                >여행지 둘러보기</a
              >
              
            </li>
            <li class="nav-item">
              <a class="nav-link" href="${root}/article?action=list">공유 게시판</a>
            </li>
          </ul>
          <ul class="navbar-nav">
          	 <c:if test="${empty sessionScope.userinfo }">
	            <li class="nav-item">
	              <a href="${root }/user?action=mvlogin" class="nav-link">로그인</a>
	            </li>
	            <li class="nav-item">
	              <a href="${root }/user?action=mvjoin" class="nav-link">회원가입</a>
	            </li>
          	 </c:if>
          	 
          	 <c:if test="${!empty sessionScope.userinfo }">
	            <li class="nav-item">
	              <a href="${root }/user?action=logout" class="nav-link">로그아웃</a>
	            </li>
	            <li class="nav-item">
	              <a href="${root }/user?action=mvusermodify" class="nav-link">마이페이지</a>
	            </li>
          	 </c:if>
          </ul>
          <!-- <form class="d-flex" role="search">
            <input
              class="form-control me-2"
              type="search"
              placeholder="Search"
              aria-label="Search"
            />
            <button class="btn search-btn" type="submit">Search</button>
          </form> -->
        </div>
      </div>
    </nav>