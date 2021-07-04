<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="../style/event.css" />
    <title>Snack</title>
  </head>
 

 <%@ include file="../include/Header.jsp" %> 
 <body>
	<div class="Guide">
      <span>EVENT</span>
    </div>

    <h1 class="event_Title">TODAY EVENT</h1>
      
        <div class="event">

          <ul class="event_grid">
			<c:forEach items="${productList}" var="product">
				<li><a href="detailProduct.do?product_id=${product.product_id}"><img src="${product.product_thumb_img}">
					<h5><img src="http://fiximage.10x10.co.kr/web2013/shopping/tag_sale.gif" alt="SALE">&nbsp;${product.product_name }</h5>
					<h5><fmt:formatNumber pattern="###,###,###" value="${product.product_price}" /> 원</h5>
					</a>
				</li>
			</c:forEach>
          </ul>
      </div>

 <%@ include file="../include/Footer.jsp" %>


  </body>
</html>
