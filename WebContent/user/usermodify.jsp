<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/header.jsp"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous" />
<link href="${root }/assets/css/style.css" rel="stylesheet" />
<link href="${root }/assets/css/signup.css" rel="stylesheet" />
<title>EnjoyTrip | 회원정보수정</title>
</head>
<body>
	<%@include file="/common/nav.jsp"%>
	<main>
		<div class="container">
			<section class="content">
				<div class="signup-wrapper">
					<h1>회원 정보 수정</h1>
					<form method="POST" id="form-modify" action="">
						<input type="hidden" name="action" value="modify" />
						<div class="mb-3">
							<input type="text" class="form-control" id="username" name="username" aria-describedby="emailHelp" placeholder="이름" value="${userinfo.userName }" disabled/>
						</div>
						<div class="mb-3">
							<input type="text" class="form-control" id="userid" name="userid" aria-describedby="emailHelp" placeholder="아이디" value="${userinfo.userId }" disabled />
						</div>
						<div id="result-view" class="mb-3"></div>
						<div class="d-flex w-100 gap-2">
							<div class="mb-3 flex-grow-1">
								<input type="password" class="form-control" id="userpwd" name="userpwd" placeholder="비밀번호" />
							</div>
							<div class="mb-3 flex-grow-1">
								<input type="password" class="form-control" id="userpwdcheck" name="userpwdcheck" placeholder="비밀번호 확인" />
							</div>
						</div>
						<div id="result-view-pwd" class="mb-3"></div>
						<button type="button" id="btn-modify" class="w-100 btn signup-btn">수정하기</button>
					</form>
					<a href="" id="btn-delete" class="w-100 btn btn-danger mt-2">탈퇴하기</a>
				</div>
			</section>
		</div>
	</main>

	<%@include file="/common/footer.jsp"%>
	<script>
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
    
    
    document.querySelector("#btn-modify").addEventListener("click", function (e) {
    	e.preventDefault();
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
          let form = document.querySelector("#form-modify");
          form.setAttribute("action", "${root}/user");
          form.submit();
        }
      });
    
    document.querySelector("#btn-delete").addEventListener("click", function (e) {
    	if(confirm("정말 탈퇴하시겠습니까?")) {
    		e.target.setAttribute("href", "${root}/user?action=delete&userid=${userinfo.userId}")
    	}
    })
	</script>
</body>
</html>