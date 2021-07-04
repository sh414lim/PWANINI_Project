<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="style/main.css" />
<link rel="stylesheet" href="style/Mypages.css" />
<title>Pawnini</title>
</head>
<%@ include file="include/Header.jsp"%>

<body>
	<div class="Guide">
		<span>마이페이지</span>
	</div>

	<div class="grid">
		<div class="shopping">
			<a href="getCartList.do"> <i class="fas fa-shopping-cart fa-lg"></i><h3>장바구니</h3></a>
		</div>
		<div class="credit-card">
			<a href="getOrderList.do" ><i class="fas fa-credit-card"></i><h3>주문내역</h3></a>
		</div>
		<div class="question-circle">
			<a href="getProduct_inqList.do"><i class="far fa-question-circle"></i><h3>상품문의</h3></a>
		</div>
		<div class="info-circle">
			<a href="getCsList.do"><i class="fas fa-info-circle"></i><h3>고객센터</h3></a>
		</div>
		<div class="exclamation">
			<a href="getNoticeList.do"><i class="fas fa-exclamation"></i><h3>공지사항</h3></a>
		</div>
		<div class="user-edit">
			<a href="mypage1.do?member_id=${member.member_id}"><i class="fas fa-user-edit"></i><h3>정보수정</h3></a>
		</div>

	</div>

	</div>
	</div>
</body>
<%@ include file="include/Footer.jsp"%>

</html>
