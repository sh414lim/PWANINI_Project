<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
  <head>

    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Login</title>
    <link rel="stylesheet" href="style/Login.css" />
    <link rel="stylesheet" href="style/main.css" />
    
    <script type="text/javascript">
	$(document).ready(function(){
		$("#logoutBtn").on("click", function(){
			location.href="/logout.do";
		});
	})
	</script>
  </head>
   <%@ include file="include/Header.jsp" %>
  <body>
	<div class="Guide">
      <span>LOGIN</span>
    </div>
	<div class="form_border">
	<form class="Form" name="loginForm" method="post" action="/login.do">
		<h1 class="Form_title">로그인 <i class="fas fa-paw"></i></h1>
		
		<div style="padding-left:20px">회원이 아니신가요? <a href="signUp.do" class="signUp">여기서 가입하세요!</a></div>
		<c:if test="${member == null}">
			<div class="input_box">
				<input class="login_input Form_Login" type="text" id="userId" name="member_id" placeholder="x">
				<label for="userId"><i class="far fa-user"></i>  아이디</label>
			</div>
			<div class="input_box">
				<input class="login_input Form_Password" type="password" id="member_pwd" name="member_pwd" placeholder="x">
				<label for="member_pwd"><i class="fas fa-lock"></i>  비밀번호</label>
			</div>	
			<div class="input_box">
				<a href="#" class="forgot_pwd">비밀번호를 잊으셨나요?</a>
			</div>
			<div class="Login_box">
				<button class="button_Login" type="submit">로그인</button>
			</div>
		</c:if>
		<c:if test="${msg == false}">
			<div class="input_box">
				<input class="login_input Form_Login" type="text" id="userId" name="member_id" placeholder="x">
				<label for="userId"><i class="far fa-user"></i>  아이디</label>
			</div>
			<div class="input_box">
				<input class="login_input Form_Password" type="password" id="member_pwd" name="member_pwd" placeholder="x">
				<label for="member_pwd"><i class="fas fa-lock"></i>  비밀번호</label>
			</div>
			<p style="color: red;">로그인 실패! 아이디와 비밀번호를 확인해주세요.</p>
			<div class="Login_box">
				<button class="button_Login" type="submit">로그인</button>
			</div>
		</c:if>
	</form>
	</div>


<div class="Bouns">
      <ul class="Bouns_ul">
        <li>
          <h3> <i class="fas fa-drumstick-bite lg"></i>신선한 사료</h3>
        </li>
        <li>
          <h3><i class="far fa-clock"></i>유통기한 100% 책임제</h3>
       
        </li>
        <li>
          <h3><i class="fas fa-shipping-fast"></i>신속! 정확! 배송!</h3>
        </li>
        <li>
          <h3><i class="fas fa-rss"></i>만원 이상 구매시 무료배송</h3>
        </li>
        </ul>
</div>

  </body>
  <%@ include file="include/Footer.jsp" %> 
</html>
