<%@ page import ="com.pawnini.model.product_inq.impl.Product_inqDAO" %>
<%@ page import ="com.pawnini.model.product_inq.Product_inqDTO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
<title>글 상세</title>
<link rel="stylesheet" href="../style/product_inq.css"/>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<script src="${path}/ckeditor/ckeditor.js "></script>
<script type="text/javascript">
function getProduct_inqList() {
	window.location.href="getProduct_inqList.do";
};
function deleteProduct_inq() {
	var confirm =window.confirm("게시물을 삭제합니다.")
	if(confirm)
	window.location.href="deleteProduct_inq.do?inq_id=${product_inq.inq_id}";
	else
	return false;	
}
	
	$(document).ready(function(){
		
		$(".inq_repUpdateBtn").on("click", function(){
			location.href = "go_updateInq_rep.do?inq_id=${product_inq.inq_id}&inq_rep_id="+$(this).attr("data-rno");
		});
		
		$(".inq_repDeleteBtn").on("click", function(){
			var cf = confirm("답변을 삭제하시겠습니까?")
			
			if(cf)
				location.href = "deleteInq_rep.do?inq_id=${product_inq.inq_id}&inq_rep_id="+$(this).attr("data-rno");
			else
				return false;
		});
		
		$(".product_inqUpdateBtn").on("click", function(){
			location.href = "/go_updateProduct_inq.do?inq_id=${product_inq.inq_id}&page=${scri.page}&perPageNum=${scri.perPageNum}"
					+"&searchType=${scri.searchType}&keyword=${scri.keyword}";
		});
		
	});
</script>
</head>
  <%@ include file="../include/Header.jsp" %>

<body>
	<div class="Guide">
      <label class="prod_inq_label"class="">상품문의</label>
    </div>
    

		<div class="form_box">
			<form class="prod_inq_form" action="go_updateProduct_inq.do" method="post">
				<input name="inq_id" type="hidden" value="${ product_inq.inq_id }" />
				
				<div class="use_flex">
					<div class="getTitle">
						<label class="prod_inq_label">제목</label>
						<span>${ product_inq.inq_title }</span> 
					</div>
					<div class="getRegdate">	
						<label class="prod_inq_label">등록일</label>
						<span><fmt:formatDate value="${ product_inq.inq_date }" pattern="yyyy-MM-dd" /></span>
					</div>
				</div>

				<div class="writer">
					<label class="prod_inq_label"class="">작성자</label>
					<span>${ product_inq.inq_name }</span>
				</div>
				<div class="content">
					<label class="prod_inq_label"class="">내용</label>
					<div class="content_box">${product_inq.inq_content }</div>
				</div>
				<div class="image"><!-- 추가된 항목 이미지 -->
 					<label class="prod_inq_label"for="inq_image" >이미지</label><br/>
 					<div class="prod_image" style="padding-top:1rem;"><img src="${product_inq.inq_thumb}"/></div>
				</div>
				
				<div class="btnList">
				<c:if test="${product_inq.inq_name eq member.member_nickname}">
					<input class="btn-default"  type="submit" value="수정하기">
					<input type="button" class="btn-default" onclick="deleteProduct_inq()" value="삭제하기">
				</c:if>
					<input type="button" class="btn-default" onclick="getProduct_inqList()" value="목록으로">
				</div>
			</form>
		</div>
			
			
		<!-- 답글 -->
	
		<div class="form_box">
		<div class="prod_reply_form" id="inq_rep" align="center">
		<ol>
			<c:forEach items="${inq_repList}" var="inq_repList">
				<li  class="inq_repList">
					<div class="use_flex_reply">
						<div class="title">
							<label class="prod_inq_label_reply"><i class="fas fa-exclamation"></i> 제목</label>
							<span>${inq_repList.inq_rep_title}</span>
						</div>
						<div class="getInfo">
							<span class="prod_inq_reply_writer">${inq_repList.inq_rep_name}</span>  
							<fmt:formatDate value="${inq_repList.inq_rep_date}" pattern="yyyy-MM-dd"/>
						</div>
					</div>
					<div>${inq_repList.inq_rep_content}</div>
					
					<div class="btns">
						<c:if test="${member.member_grade eq '2' }">
						<button type="button" class="inq_repUpdateBtn btn-default" data-rno="${inq_repList.inq_rep_id}">수정</button>
						<button type="button" class="inq_repDeleteBtn btn-default" data-rno="${inq_repList.inq_rep_id}">삭제</button>
						</c:if>
					</div>
				</li>
			</c:forEach>
		</ol>
		</div>
	</div>
	
	<!-- 답글 입력창 -->
<c:if test="${ member.member_grade eq '2'}">
	<div class="form_box" >
		<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
			<form name="inq_repForm" method="post" action="${contextPath}/insertInq_rep.do">
				<div class="writer">
					<input type="hidden" id="inq_id" name="inq_id" value="${product_inq.inq_id}">
					<input type="hidden" id="inq_rep_title" name="inq_rep_title" value="상품 문의 답변입니다.">
					<label class="prod_inq_label" for="inq_rep_name"></label><i class="far fa-edit"></i>
					<input type="hidden" id="inq_rep_name" name="inq_rep_name" value="관리자" >
					<span class="admin_reply">관리자 답글</span>
				</div>
				<div class="content_reply">
					<div style="padding-bottom:1rem;">답글 내용</div>
					<div>
						<textarea class="textarea_reply" name="inq_rep_content"></textarea>
						<script type="text/javascript">
			            	CKEDITOR.replace("inq_rep_content");
			            </script>
					</div>
				</div>	
				
				<div class="btnList">
					<button type="submit" class="btn-default" id="updateInq_ans" >입력</button>
				</div>
			</form>
	</div>
</c:if>

</body>
   <%@ include file="../include/Footer.jsp" %>

</html>
