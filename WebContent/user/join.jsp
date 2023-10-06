<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/common/header.jsp"%>
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
    <main>
      <div class="container">
        <section class="content">
          <div class="signup-wrapper">
            <h1>회원가입</h1>
            <form method="POST" id="form-join">
            <input type="hidden" name="action" value="join" />
            <div class="mb-3">
                <input
                  type="text"
                  class="form-control"
                  id="username"
                  name = "username"
                  aria-describedby="emailHelp"
                  placeholder="이름"
                />
              </div>
              <div class="mb-3">
                <input
                  type="text"
                  class="form-control"
                  id="userid"
                  name = "userid"
                  aria-describedby="emailHelp"
                  placeholder="아이디"
                />
              </div>
              <div id="result-view" class="mb-3"></div>
              <div class="d-flex w-100 gap-2">
                <div class="mb-3 flex-grow-1">
                  <input
                    type="password"
                    class="form-control"
                    id="userpwd"
                    name= "userpwd"
                    placeholder="비밀번호"
                  />
                </div>
                <div class="mb-3 flex-grow-1">
                  <input
                    type="password"
                    class="form-control"
                    id="userpwdcheck"
                    name="userpwdcheck"
                    placeholder="비밀번호 확인"
                  />
                </div>
              </div>
                <div id="result-view-pwd" class="mb-3"></div>
              <div class="mb-3 d-flex email form-control">
                <input type="text" class="border-0" id="email" name="emailid" placeholder="이메일" />
                <div class="border-0 form-control">@</div>
                <select class="border-0 form-select" name="emaildomain" id="email2">
                  <option value="naver.com">naver.com</option>
                  <option value="gmail.com">gmail.com</option>
                  <option value="daum.net">daum.net</option>
                  <option value="">직접입력</option>
                </select>
                <input
                  type="text"
                  id="email3"
                  class="form-control border-0"
                  placeholder="직접 입력"
                />
              </div>
              <button type="button" id = "btn-join" class="w-100 btn signup-btn">회원가입</button>
            </form>
          </div>
        </section>
      </div>
    </main>

 <%@include file="/common/footer.jsp" %>
 
     <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
      crossorigin="anonymous"
    ></script>
    
    <script type="text/javascript">
    let isUseId = false;
    let input = document.querySelector("#userid");
    let resultDiv = document.querySelector("#result-view");
    input.addEventListener("keyup", function () {
      let checkid = input.value;
      let len = checkid.length;
      if (len < 4 || len > 16) {
        isUseId = false;
        resultDiv.setAttribute("class", "mb-3 fw-bold text-dark");
        resultDiv.innerHTML = "아이디는 4자이상 16자이하입니다.";
      } else {
        let url = "${root}/user?action=idcheck&checkid=" + checkid;
        // let url = `${root}/user?action=idcheck&checkid=${checkid}`;
        // CSV
        fetch(url)
          .then((response) => response.text())
          .then((data) => resultViewText(data));

        // JSON
        // fetch(url)
        //   .then((response) => response.json())
        //   .then((data) => resultViewJSON(data));
        isUseId = true;
      }
    });

    function resultViewText(data) {
      let val = data.split(",");
      let id = val[0];
      let cnt = val[1];
      if (cnt == 0) {
        isUseId = true;
        resultDiv.setAttribute("class", "mb-3 text-success");
        resultDiv.innerHTML = "<span class='fw-bold'>" + id + "</span>은 사용할 수 있습니다.";
      } else {
        isUseId = false;
        resultDiv.setAttribute("class", "mb-3 text-danger");
        resultDiv.innerHTML = "<span class='fw-bold'>" + id + "</span>은 사용할 수 없습니다.";
      }
    }

    function resultViewJSON(data) {
      if (data.cnt == 0) {
        isUseId = true;
        resultDiv.setAttribute("class", "mb-3 text-primary");
        resultDiv.innerHTML =
          "<span class='fw-bold'>" + data.checkid + "</span>은 사용할 수 있습니다.";
      } else {
        isUseId = false;
        resultDiv.setAttribute("class", "mb-3 text-warning");
        resultDiv.innerHTML =
          "<span class='fw-bold'>" + data.checkid + "</span>은 사용할 수 없습니다.";
      }
    }
    
    // 비밀번호 확인
    let isOkPwd = false;
    let resultDivPwd = document.querySelector("#result-view-pwd");
    let inputPwd = document.querySelector("#userpwdcheck");
    inputPwd.addEventListener("keyup", function () {
        let userpwdcheck = inputPwd.value;
        let userpwd = document.querySelector("#userpwd").value;
        
        // 비밀번호 확인이랑 다르면
        if(userpwd != userpwdcheck){
        	isOkPwd = false;
          isUseId = false;
          resultDivPwd.setAttribute("class", "mb-3 text-danger");
          resultDivPwd.innerHTML = "비밀번호를 다시 확인하세요.";
        }else{
        	isOkPwd = true;
        	resultDivPwd.setAttribute("class", "mb-3 text-success");
            resultDivPwd.innerHTML = "사용할 수 있는 비밀번호입니다.";
        }
      });
    
    
    document.querySelector("#btn-join").addEventListener("click", function () {
        if (!document.querySelector("#username").value) {
          alert("이름 입력!!");
          return;
        } else if (!document.querySelector("#userid").value) {
          alert("아이디 입력!!");
          return;
        } else if (!document.querySelector("#userpwd").value) {
          alert("비밀번호 입력!!");
          return;
        } else if (
          document.querySelector("#userpwd").value != document.querySelector("#userpwdcheck").value
        ) {
          alert("비밀번호 확인!!");
          return;
        } else {
          let form = document.querySelector("#form-join");
          form.setAttribute("action", "${root}/user");
          form.submit();
        }
      });
    
    
    
    
    
    
    </script>
  </body>
</html>
