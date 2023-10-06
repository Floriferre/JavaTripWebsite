// 지역별 관광지 조회
// 1. 전체
// 2. 광광지
// 3. 문화 시설
// 4. 행사 / 공연 / 축제
// 5. 여행 코스
// 6. 레포츠
// 7. 숙박
// 8. 쇼핑
// 9. 음식점
// index page 로딩 후 전국의 시도 설정.
let serviceKey =
  "mkjat9vsl0199pCnob2wBf8GGO4TaYyBvJMUTzqFJA825iLzejIoGrnHy2BlVjBOPe0GrBvsbCeCqu0wnxCjBw%3D%3D";
let areaUrl =
  "https://apis.data.go.kr/B551011/KorService1/areaCode1?serviceKey=" +
  serviceKey +
  "&numOfRows=20&pageNo=1&MobileOS=ETC&MobileApp=AppTest&_type=json";

//https://apis.data.go.kr/B551011/KorService1/areaCode1?serviceKey&numOfRows=10&pageNo=1&MobileOS=ETC&MobileApp=AppTest&areaCode=1&_type=json

// fetch(areaUrl, { method: "GET" }).then(function (response) { return response.json() }).then(function (data) { makeOption(data); });
fetch(areaUrl, { method: "GET" }) // 시도 얻어오기
  .then((response) => response.json())
  .then((data) => {
    makeOption(data);
  });

function makeOption(data) {
  let areas = data.response.body.items.item;
  // console.log(areas);
  let sel = document.getElementById("search-area-sido");
  areas.forEach((area) => {
    let opt = document.createElement("option");
    opt.setAttribute("value", area.code);
    opt.appendChild(document.createTextNode(area.name));

    sel.appendChild(opt);
  });
}

// 시군구 정보 추가할 것 <- 천천히 하자!
// function makeOptionSigubgu(data) {
//   let sigungu =
// }

// 검색 버튼을 누르면..
// 지역, 유형, 검색어 얻기.
// 위 데이터를 가지고 공공데이터에 요청.
// 받은 데이터를 이용하여 화면 구성.
document.getElementById("btn-search").addEventListener("click", () => {
  let baseUrl = `https://apis.data.go.kr/B551011/KorService1/`;
  // let searchUrl = `https://apis.data.go.kr/B551011/KorService1/searchKeyword1?serviceKey=${serviceKey}&numOfRows=10&pageNo=1&MobileOS=ETC&MobileApp=AppTest&_type=json&listYN=Y&arrange=A`;
  // let searchUrl = `https://apis.data.go.kr/B551011/KorService1/areaBasedList1?serviceKey=${serviceKey}&numOfRows=10&pageNo=1&MobileOS=ETC&MobileApp=AppTest&_type=json&listYN=Y&arrange=A`;

  let queryString = `serviceKey=${serviceKey}&numOfRows=10&pageNo=1&MobileOS=ETC&MobileApp=AppTest&_type=json&listYN=Y&arrange=A`;
  let areaCode = document.getElementById("search-area-sido").value;
  // let sigunguCode = document.getElementById("search-sigungu-code").value;
  let contentTypeId = document.getElementById("search-content-id").value;
  let keyword = document.getElementById("search-keyword").value;

  // 지역 정보가 있을 때만 쿼리에 더해주기
  if (parseInt(areaCode)) queryString += `&areaCode=${areaCode}`;
  // 시군구 정보가 있을 때만 쿼리에 더해주기
  // if (parseInt(sigunguCode)) queryString += `&sigunguCode=${sigunguCode}`;
  // 관광지 유형이 있을 때만 쿼리에 더해주기
  if (parseInt(contentTypeId)) queryString += `&contentTypeId=${contentTypeId}`;

  let service = ``;
  if (keyword) {
    // 키워드가 있을 때만 쿼리에 넣어주기
    service = `searchKeyword1`;
    queryString += `&keyword=${keyword}`;
  } else {
    service = `areaBasedList1`;
  }
  let searchUrl = baseUrl + service + "?" + queryString;
  console.log(searchUrl);

  fetch(searchUrl)
    .then((response) => response.json())
    .then((data) => makeList(data));
});

var positions; // marker 배열.
function makeList(data) {
  console.log(data);
  document.querySelector("table").setAttribute("style", "display: ;");
  let trips = data.response.body.items.item;
  let tripList = ``;
  positions = [];
  trips.forEach((area) => {
    tripList += `
    <tr onclick="moveCenter(${area.mapy}, ${area.mapx});">
      <td><img src="${area.firstimage}" width="100px"></td>
      <td>${area.title}</td>
      <td>${area.addr1} ${area.addr2}</td>
      <td>${area.mapy}</td>
      <td>${area.mapx}</td>
    </tr>
  `;
    // 저장할 내용
    let markerInfo = {
      title: area.title,
      latlng: new kakao.maps.LatLng(area.mapy, area.mapx),
      image: area.firstimage,
      addr1: area.addr1,
      addr2: area.addr2,
      tel: area.tel,
    };
    positions.push(markerInfo);
  });

  document.getElementById("trip-list").innerHTML = tripList;
  displayMarker();
}

// 카카오지도
var mapContainer = document.getElementById("map"), // 지도를 표시할 div
  mapOption = {
    center: new kakao.maps.LatLng(37.500613, 127.036431), // 지도의 중심좌표
    level: 5, // 지도의 확대 레벨
  };

// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
var map = new kakao.maps.Map(mapContainer, mapOption);

// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
var mapTypeControl = new kakao.maps.MapTypeControl();

// 지도 확대 축소 등의 컨트롤
// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
var zoomControl = new kakao.maps.ZoomControl();
map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

function displayMarker() {
  // 마커 이미지의 이미지 주소입니다
  var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";

  positions.forEach(function (position) {
    // 마커 이미지의 이미지 크기 입니다
    var imageSize = new kakao.maps.Size(24, 35);

    // 마커 이미지를 생성합니다
    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);

    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({
      map: map, // 마커를 표시할 지도
      position: position.latlng, // 마커를 표시할 위치
      title: position.title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
      image: markerImage, // 마커 이미지
    });

    // 첫번째 검색 정보를 이용하여 지도 중심을 이동 시킵니다
    map.setCenter(position.latlng);

    // 커스텀 오버레이에 표시할 컨텐츠 입니다
    // 커스텀 오버레이는 아래와 같이 사용자가 자유롭게 컨텐츠를 구성하고 이벤트를 제어할 수 있기 때문에
    // 별도의 이벤트 메소드를 제공하지 않습니다
    var content =
      '<div class="wrap">' +
      '    <div class="info">' +
      '        <div class="title">' +
      "            " +
      `<h4>${position.title}</h4>` +
      '            <div class="close" id = "closebtn" title="닫기"></div>' +
      "        </div>" +
      '        <div class="body">' +
      '            <div class="img">' +
      "                <img src=" +
      `${position.image}` +
      ' width="73" height="70">' +
      "           </div>" +
      '            <div class="desc">' +
      '                <div class="ellipsis">' +
      `${position.addr1}` +
      "</div><br>" +
      '                <div class="ellipsis">' +
      `(전화번호) ${position.tel}` +
      "</div>" +
      //   '                <div class="jibun ellipsis">' +
      //   `${positions[i].addr2}` +
      //   "</div>" +
      //   '                <div><a href="https://www.kakaocorp.com/main" target="_blank" class="link">홈페이지</a></div>' +
      "            </div>" +
      "        </div>" +
      "    </div>" +
      "</div>";

    // 마커를 클릭했을 때 커스텀 오버레이를 표시합니다
    kakao.maps.event.addListener(marker, "click", function () {
      console.log("너는 되니?");
      // 마커 위에 커스텀오버레이를 표시합니다
      //   console.log(position);
      // 마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다
      var overlay = new kakao.maps.CustomOverlay({
        content: content,
        map: map,
        position: marker.getPosition(),
      });

      overlay.setMap(map);

      document.querySelector("#closebtn").addEventListener("click", (e) => {
        console.log("너는 되는 건 맞니?");
        overlay.setMap(null);
      });
    });
  });
}

function moveCenter(lat, lng) {
  map.setCenter(new kakao.maps.LatLng(lat, lng));
}
