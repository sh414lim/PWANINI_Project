<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<style>
section#content ul li {
	border: 5px solid #eee;
	padding: 10px 20px;
	margin-bottom: 20px;
	list-style: none;
}

section#content .allOrder span {
	font-size: 20px;
	font-weight: bold;
	display: inline-block;
	width: 90px;
	margin-right: 10px;
}

section#content .allOrder {
	margin-left: 300px; 
	margin-right: 300px; 
}

.moneyList {
	margin: 20px 300px 50px 300px;
}
.money__list{
	border: 2px solid #eee;
	padding: 10px 20px;
	margin-bottom: 20px;
	list-style: none;
}
.money__list p {
	margin-top: 5px;
	margin-bottom: 5px;
}
.money__title{
	color: #000;
	background: url(//img.echosting.cafe24.com/skin/base/common/ico_arrow.png) no-repeat 0 8px;
	padding-left: 25px;
	width: 20%;
	font-size: 1rem;
	font-weight: bold;
	display: inline-block;
	margin-right: 10px;
}
.money__content{
	color: #000;
	text-align: right;
	width: 70%;
    font-size: 1rem;
	display: inline-block;
	margin-right: 10px;
}

</style>
<script>
	
</script>
</head>
<%@ include file="../include/Header.jsp"%>
<body>
<div class="Guide">
        <span>배송관리</span>
        
      </div>
      
      <ul class="moneyList">
				<li class="money__list">
					<div>
						<p>
						<c:forEach items="${sales}" var="sales">
							<span class="money__title">총 매출금액 </span>
							<span class="money__content" style="color: #FF4500; font-weight: bold;"><fmt:formatNumber pattern="###,###,###"
								value="${sales.ord_sales}" />원 </span>
						</p>
						<p>
							<span class="money__title">총 주문건수 </span>
							<span class="money__content"><fmt:formatNumber pattern="###,###,###"
								value="${sales.ord_cnt}" />건</span>
						</p>
						
					</c:forEach>
					</div>
				</li>
		</ul>
		
	<section id="content">
		<c:forEach items="sales" var="sales">
		</c:forEach>
		<ul class="allOrder">
			<c:forEach items="${allOrder}" var="allOrder">
				<li>
					<div>
						<p>
							<span>주문번호</span> <a
								href="getAllOrderDetails.do?num=${allOrder.ord_id}">${allOrder.ord_id}</a>
						</p>
						<p>
							<span>주문일자</span>${allOrder.ord_date}</p>
						<p>
							<span>주문현황</span>${allOrder.ord_status}</p>
						<p>
							<span>결제금액</span>
							<fmt:formatNumber pattern="###,###,###"
								value="${allOrder.ord_total}" />
							&nbsp;원
						</p>
						
					</div>
				</li>
			</c:forEach>
		</ul>

	</section>


</body>
<%@ include file="../include/Footer.jsp"%>
</html>