<%@ page import ="com.pawnini.model.product_inq.impl.Product_inqDAO" %>
<%@ page import ="com.pawnini.model.product_inq.Product_inqDTO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 세션에 저장된 게시글 정보를 꺼낸다.
	Product_inqDTO product_inqDTO = (Product_inqDTO)session.getAttribute("product_inqDTO");
%>  
  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상품 문의 수정</title>
<link rel="stylesheet" href="../style/updateProd_inq.css"/>
<script src = "${path}/ckeditor/ckeditor.js"></script>
<script type="text/javascript">
function getProduct_inqList() {
	window.location.href="getProduct_inqList.do";
}
</script>
</head>
  <%@ include file="../include/Header.jsp" %>
<body>
	<div class="Guide">
      <span>상품문의</span>
    </div>
    <body>
	<div align="center">
		<div class="form_box">
			<form action="updateProduct_inq.do" method="post">
				<input name="inq_id" type="hidden" value="${ product_inq.inq_id }" />
				<input name="inq_image" type="hidden" value="${update_inq.inq_image}"/>
				<div class="title">
					<span>제목</span> 
					<input name="inq_title" type="text" value="${ product_inq.inq_title }">
					 <br>
				</div>
				<div class="writer">
					<span>작성자</span>
					<input name="inq_name" type="hidden" value="${ product_inq.inq_name }">
					${ product_inq.inq_name }
				</div>
				<div class="content">
					<span>내용</span>
				</div>
					<div class="content_box">
			        	<textarea name="inq_content" id="inq_content" cols="145" rows="30" >${product_inq.inq_content }</textarea>
	    		   			<script type="text/javascript">
	        					CKEDITOR.replace("inq_content");
			        	   </script>
					</div>
				
				<div>
					<label for="inq_show" >공개여부</label> 
					<select name="inq_show" >
				          		<option value="Y">Y</option>
				               	<option value="N">N</option>
           		</select>
				</div>
				
				<!-- 회원아이디,제품번호   -->
      			 <input type="hidden" name="member_id" value="${member.member_id}" >
      			 <input type="hidden" name="product_id" value="${product.product_id}" >
      			 
       			<div class="btnList">
					<input class="button"  type="submit" value="수정하기">
					<input type="button" onclick="getProduct_inqList()" value="목록으로">
				</div>
			</form>
		</div>
			
	</div>	

</body>
   <%@ include file="../include/Footer.jsp" %>
</html>
