<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글 목록</title>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="../style/product_inqList.css" />

</head>
  <%@ include file="../include/Header.jsp" %>
<body>
	<div class="Guide">
    	  <span>상품 문의</span>
   	 </div>
		
		
	<form class="searchForm" method="get">
		<div class="search_row">
				<div class="input-group">
					<select name="searchType" class="form-control">
						<option value="n"<c:out value="${scri.searchType eq null ? 'selected' : '' }"/>>&nbsp; - - - - -</option>
						<option value="t"<c:out value="${scri.searchType eq 't' ? 'selected' : '' }"/>>제목</option>
						<option value="c"<c:out value="${scri.searchType eq 'c' ? 'selected' : '' }"/>>내용</option>
						<option value="tc"<c:out value="${scri.searchType eq 'tc' ? 'selected' : '' }"/>>제목+내용</option>
					</select>
				</div>
			
				<input type="text" name="keyword" id="keywordInput" size="25" value="${scri.keyword}" class="searchEngine form-control">
				<button id="searchBtn" type="button" class="btn-default">검색</button>
		</div>
		
		<script>
			$(function(){
				$("#searchBtn").click(function(){
					self.location = "getProduct_inqList.do"+'${pageMaker.makeQuery(1)}' 
					+ "&searchType=" + $("select[name=searchType]").val() + "&keyword=" 
					+ encodeURIComponent($('#keywordInput').val()); 
				});
			});
		</script>
		<table>
			<tr class="product">
				<th>글번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>등록일</th>
				<th>답변 상태</th> 		
			</tr>
			<c:forEach items="${product_inqList}" var="product_inq">
			<tr class="prod_inq_post">
				<td>${product_inq.inq_id}</td>
				<%-- 비밀글  --%>
				<td>
					<c:if test="${product_inq.inq_show eq 'N'}" >
						<img src="${pageContext.request.contextPath}/images/lock.png" alt="비밀글" style="width:16px;margin: 3px;"/>
						<c:choose>
							<c:when test="${product_inq.inq_name eq member.member_id || member.member_grade eq '2'}"> 
							<a href="getProduct_inq.do?inq_id=${product_inq.inq_id}"><c:out value="${product_inq.inq_title}"/></a>
							</c:when>
							<c:otherwise>&nbsp;<i class="fas fa-lock"></i> 비밀글은 작성자와 관리자만 볼 수 있습니다.</c:otherwise>
						</c:choose>
					</c:if>
					<c:if test="${product_inq.inq_show eq 'Y'}" >
						<a href="getProduct_inq.do?inq_id=${product_inq.inq_id}"><c:out value="${product_inq.inq_title}"/></a>
					</c:if>
				</td>
				<td>${product_inq.inq_name}</td>
				<td><fmt:formatDate value="${product_inq.inq_date}" pattern="yyyy-MM-dd"/></td>
				<td>
					<c:if test="${product_inq.inq_ans eq 'Y'}">
						<div class="replied"><i class="prodIcon far fa-check-square"></i></div>
					</c:if>
					<c:if test="${product_inq.inq_ans eq 'N'}">
						<div class="reply_pending"><i class="prodIcon far fa-clock"></i></div>
					</c:if>
				</td>
			</tr>
		</c:forEach>
		</table>
		
		<br>
		
		<div class="col-md-offset-3">
			<ul class="pagination">
				
				<c:if test="${pageMaker.prev}">
					<li><a href="getProduct_inqList${pageMaker.makeSearch(pageMaker.startPage -1)}">이전</a></li>
				</c:if>
				
				<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
					<li <c:out value="${pageMaker.cri.page eq idx ? 'class=info ' : '' }"/>>
					<a href="getProduct_inqList.do${pageMaker.makeSearch(idx)}">${idx}</a></li>
				</c:forEach>
				
				<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
					<li><a href="getProduct_inqList${pageMaker.makeSearch(pageMaker.endPage +1)}">다음</a></li>
				</c:if>
			</ul>
		</div>
	</form>
</body>
   <%@ include file="../include/Footer.jsp" %>
</html>