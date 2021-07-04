<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<title>게시판</title>
</head>

  <%@ include file="../include/Header.jsp" %>
  <link rel="stylesheet" href="../style/product_inq.css"/>
  <script src = "${path}/ckeditor/ckeditor.js"></script>
  
<body>
	<div class="Guide">
      <span>상품문의</span>
    </div>
	<div align="center">
	<div class="form_box">
		<form action="updateInq_rep.do" method="post">
		
		<div class="product_inqList">
			<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
			<form name="updateInq_repForm" role="form" method="post" action="${contextPath}/updateInq_rep.do">
			<input type="hidden" name="inq_id" value="${inq_rep.inq_id}" readonly="readonly"/>
			<input type="hidden" id="inq_rep_id" name="inq_rep_id" value="${inq_rep.inq_rep_id}"/>
			<input type="hidden" id="inq_rep_title" name="inq_rep_title" value="${inq_rep.inq_rep_title }">
			
			<div class="writer">
				${inq_rep.inq_rep_name }
				<input type="hidden" id="inq_rep_name" name="inq_rep_name" value="${inq_rep.inq_rep_name }" readonly="readonly">
			</div>
			
			<div class="content">
				<textArea id="inq_rep_content" name="inq_rep_content" >${inq_rep.inq_rep_content }	
				</textArea>
				<script type="text/javascript">
	        	CKEDITOR.replace("inq_rep_content");
	       		 </script>
			</div>
			
			<div class="btnList">
				<input class="button btn-default"  type="submit" value="수정하기">
				
				<button type="button" class="update_cancel_btn btn-default">취소</button>
			</div>
			</form>
		</div>
	</form>	
	</div>
		<hr/>
	</div>
</body>
   <%@ include file="../include/Footer.jsp" %>

</html>