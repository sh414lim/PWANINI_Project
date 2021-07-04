<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../style/getOrderList.css" />
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<style>
</style>

</head>
<%@ include file="../include/Header.jsp"%>
<body>
	<div class="Guide">
        <span>주문리스트</span>
      </div>
	<hr>
		<ul class="moneyList">
				<li class="money__list">
					<div>
						<p>
							<span class="money__title">가용적립금 </span>
							<span class="money__content" style="color: #008bcc;"><fmt:formatNumber pattern="###,###,###"
								value="${curMileage}" />원 </span>
						</p>
						<c:forEach items="${myinfoList}" var="money">
						<p>
							<span class="money__title">사용적립금 </span>
							<span class="money__content"><fmt:formatNumber pattern="###,###,###"
								value="${money.ord_used_mileage2}" />원</span>
						</p>
						<p>
							<span class="money__title">총주문금액 </span>
							<span class="money__content"><fmt:formatNumber pattern="###,###,###"
								value="${money.ord_total2}" />원 (${money.ord_num}건)</span>
						</p>
					</c:forEach>
					</div>
				</li>
		</ul>
		
	<section id="orderList">
		<ul class="orderList">
			<c:forEach items="${orderList}" var="orderList">
				<li>
					<div>
						<p>
							<span>주문번호</span><a
								href="/getOrderDetails.do?num=${orderList.ord_id}">${orderList.ord_id}</a>
						</p>
						<p>
							<span>주문일자</span>${orderList.ord_date}</p>
						<p>
							<span>결제금액</span>
							<fmt:formatNumber pattern="###,###,###"
								value="${orderList.ord_total}" />
							&nbsp;원
						</p>
						<p>
							<span>주문현황</span>${orderList.ord_status}</p>
					</div>
				</li>
			</c:forEach>
		</ul>
	</section>


</body>
<%@ include file="../include/Footer.jsp"%>
</html>