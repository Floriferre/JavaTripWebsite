document.querySelectorAll("#recommendList").forEach((selector) => {
  // 유형 정보가 있을 때만 쿼리에 더해주기 - 유형 정보 랜덤
  makeRecommendList(data);
});
async function makeRecommendList(data) {
  let mother = document.querySelector("#recommendList");
  let trips = data.response.body.items.item;
  // let tripList = ``;

  let i = 0;
  let imgcheck = false;

  trips.forEach((area) => {
    if (i == 6) {
      return false;
    }
    let div1 = document.createElement("div");
    div1.setAttribute("class", "place-wrapper");
    // div.style.backgroundImage = `url(${url})`;
    console.log(`${area.firstimage}`);
    if(`${area.firstimage}` == ""){
    	console.log("이미지 없다!!!");
    	div1.style.backgroundImage = `url(assets/img/sample.png)`;
    	imgcheck = false;
    }else{
    	div1.style.backgroundImage = `url(${area.firstimage})`;
    	imgcheck = true;
    }   
// div1.style.backgroundImage = `url(${area.firstimage})`;
    let div2 = document.createElement("div");
    div2.setAttribute("class", "place");

    // let img = document.createElement("img");
    // img.setAttribute("src", area.firstimage);
    // // img.setAttribute("width", "100px");
    // img.setAttribute("height", "50%");

    let button = document.createElement("div");
    button.setAttribute("class", "btn");
    button.setAttribute("id", `btnRecommend${i}`);
    button.setAttribute("data-bs-toggle", "modal");
    button.setAttribute("data-bs-target", "#placeModal");
    button.setAttribute("width", "100%");
    button.setAttribute("height", "100%");
    button.innerText = area.title;

    // button.appendChild(img);
    div2.appendChild(button);
    div1.appendChild(div2);
    // 그동안에 있던 거 다 붙이기!
    mother.appendChild(div1);

    document
      .querySelector(`#btnRecommend${i}`)
      .addEventListener("click", (e) => {
        document.querySelector("#placeModalLabel").innerText = area.title;

        // 내용 가져오기
        let baseUrl = `https://apis.data.go.kr/B551011/KorService1/`;

        let queryString = `serviceKey=${serviceKey}&MobileOS=ETC&MobileApp=AppTest&_type=json`;
        // 지역 정보는 1~17로 이루어져 있음!
        queryString += `&contentId=${area.contentid}`;
        queryString += `&defaultYN=Y&firstImageYN=Y&areacodeYN=Y&catcodeYN=Y&addrinfoYN=Y&mapinfoYN=Y&overviewYN=Y&numOfRows=10&pageNo=1`;

        let service = `detailCommon1`;

        let searchUrl = baseUrl + service + "?" + queryString;
        fetch(searchUrl)
          .then((response) => response.json())
          .then((data) => {
            console.log(
              "나는 되고 있을까?" + data.response.body.items.item[0].overview
            );
            if(`${data.response.body.items.item[0].firstimage}`==""){
            	document
                .querySelector("#modalImg")
                .setAttribute(
                  "src",
                  `assets/img/sample.png`
                );
            }else{
            	document
            	.querySelector("#modalImg")
            	.setAttribute(
            			"src",
            			`${data.response.body.items.item[0].firstimage}`
            	);            	
            }
            
    
            document.querySelector("#addr").innerText =
              data.response.body.items.item[0].addr1;
            document.querySelector("#overview").innerText = innerHTML =
              `${data.response.body.items.item[0].overview}`.replace(
                /<\/?[^>]+(>|$)/g,
                ""
              );
            document
              .querySelector("#page")
              .setAttribute(
                "href",
                `${data.response.body.items.item[0].homepage}`.replace(
                  /<\/?[^>]+(>|$)/g,
                  ""
                )
              );
          });
      });

    i++;
  });
}
