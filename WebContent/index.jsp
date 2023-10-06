<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/common/header.jsp" %>
<c:if test="${cookie.ssafy_id.value ne null}">
	<c:set var="idck" value=" checked"/>
	<c:set var="saveid" value="${cookie.ssafy_id.value}"/>
</c:if>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>EnjoyTrip</title>
    <link rel="stylesheet" href="${root}/assets/css/style.css" />
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
	<%@include file="/common/nav.jsp" %>

    <!-- Main Contents start -->
    <main>
      <div class="content">
        <div class="main-banner">
          <div class="main-title">
            <h3>YOUR WORLD OF JOY</h3>
            <h5>여러 여행지를 찾아보세요</h5>
            <div class="input-area">
              <div class="input-wrapper">
                <i class="bi bi-search"></i>
                <input type="text" id="banner-search" name="bannerSearch"/>
                <button class="btn" id="bannerSearch">검색</button>
              </div>
            </div>
          </div>
          <div
            id="mainCarousel"
            class="carousel slide"
            data-bs-ride="carousel"
            data-interval="true"
          >
            <div class="carousel-indicators">
              <button
                type="button"
                data-bs-target="#mainCarousel"
                data-bs-slide-to="0"
                class="active"
                aria-current="true"
                aria-label="Slide 1"
              ></button>
              <button
                type="button"
                data-bs-target="#mainCarousel"
                data-bs-slide-to="1"
                aria-label="Slide 2"
              ></button>
              <button
                type="button"
                data-bs-target="#mainCarousel"
                data-bs-slide-to="2"
                aria-label="Slide 3"
              ></button>
            </div>
            <div class="carousel-inner">
              <div class="carousel-item active">
                <img
                  src="https://cdn.pixabay.com/photo/2015/06/19/21/24/avenue-815297_1280.jpg"
                  class="d-block w-100"
                  alt="..."
                />
              </div>
              <div class="carousel-item">
                <img
                  src="https://cdn.pixabay.com/photo/2016/05/05/02/37/sunset-1373171_1280.jpg"
                  class="d-block w-100"
                  alt="..."
                />
              </div>
              <div class="carousel-item">
                <img
                  src="https://cdn.pixabay.com/photo/2018/08/21/23/29/forest-3622519_1280.jpg"
                  class="d-block w-100"
                  alt="..."
                />
              </div>
            </div>
            <!-- <button
              class="carousel-control-prev"
              type="button"
              data-bs-target="#mainCarousel"
              data-bs-slide="prev"
            >
              <span class="carousel-control-prev-icon" aria-hidden="true"></span>
              <span class="visually-hidden">Previous</span>
            </button>
            <button
              class="carousel-control-next"
              type="button"
              data-bs-target="#mainCarousel"
              data-bs-slide="next"
            >
              <span class="carousel-control-next-icon" aria-hidden="true"></span>
              <span class="visually-hidden">Next</span>
            </button> -->
          </div>
        </div>
       <section class="main-bottom">
          <h3>
            이런 여행지는<br />
            어떠세요?
          </h3>
          <article class="place-list" id="recommendList"></article>
        </section>
      </div>
    </main>

    <!-- Main Contents end -->

    <!-- 랜덤 여행지 모달 -->
    <div class="modalplz">
      <div
        class="modal fade"
        id="placeModal"
        tabindex="-1"
        aria-labelledby="placeModal"
        aria-hidden="true"
      >
        <div class="modal-dialog modal-dialog-centered">
          <div class="modal-content">
            <div class="modal-header">
              <h1 class="modal-title fs-5" id="placeModalLabel">Modal title</h1>
              <button
                type="button"
                class="btn-close"
                data-bs-dismiss="modal"
                aria-label="Close"
              ></button>
            </div>
            <div class="modal-body" id="modalBODY">
              <div class="d-flex flex-column">
                <div class=""><img src="" alt="" id="modalImg" /></div>
                <div class="" id="modalText">
                  <div class="d-flex gap-2">
                    <p>주소</p>
                    <p id="addr"></p>
                  </div>
                  <div class="d-flex gap-2">
                    <p class="flex-shrink-0">소개</p>
                    <p id="overview"></p>
                  </div>
                  <a id="page" href="">더 알아보기</a>
                </div>
              </div>
            </div>
            <div class="modal-footer">
              <button
                type="button"
                class="btn btn-primary"
                data-bs-dismiss="modal"
              >
                Close
              </button>
              <!-- <button type="button" class="btn btn-primary">Save changes</button> -->
            </div>
          </div>
        </div>
      </div>
    </div>
<script type="text/javascript">

console.log("${root}/assets/css/style.css");
</script>

 <%@include file="/common/footer.jsp" %>
 
     <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
      crossorigin="anonymous"
    ></script>
    <script type="text/javascript">
    
 // 배너에서 검색어 입력하면 보여줄 것!
    document.querySelector("#bannerSearch").addEventListener("click", function(){
    	console.log("여기가 찍히긴 하니?")

    	location.href = "${root}/banner?action=bannerSearch&bannerSearch=" + document.querySelector("#banner-search").value;
    });
    </script>
    <script src="${root}/assets/js/index.js"></script>
    <script src="${root}/assets/js/index_recommend.js"></script>
  </body>
</html>
