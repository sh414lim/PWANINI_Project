<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>PAWNINI - 고객게시판</title>
	<script src="${path}/ckeditor/ckeditor.js "></script>
<link type="text/css" rel="stylesheet" href="../style/cs.css"/>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<%@ include file="../include/Header.jsp"%>
<body> 

<!-- my bit -->
	<div class="Guide">
      <span>고객센터</span>
    </div>
	
	<!-- 검색 기능 -->
		<form id="getForm" name="getForm" role="getForm" method="get">
	  	 <div class="container" id="container">
	           <div>
					<select class="form-control2" name="searchOption2">
							<option value="nth" <c:out value="${scri.searchOption eq null ? 'selected' : '' }"/>>- - 😺 필터 🐶 - -</option>
							<option value="t"<c:out value="${scri.searchOption eq 't' ? 'selected' : '' }"/>>제목</option>
							<option value="w"<c:out value="${scri.searchOption eq 'w' ? 'selected' : '' }"/>>작성자</option>
							<option value="c"<c:out value="${scri.searchOption eq 'c' ? 'selected' : '' }"/>>내용</option>
							<option value="twc"<c:out value="${scri.searchOption eq 'twc' ? 'selected' : '' }"/>>제목+작성자+내용</option>	
					</select>
				</div>	
				<div>
					<div class="input-group">
							<input class="form-controlSearch" type="text" name="searchKeyword" id="keywordInput" placeholder="키워드를 입력하세요..." value="${scri.searchKeyword }"/>
							<span class="input-group-btn"><button id="searchBtn" type="button" class="btn-default" style="padding:5px">검색&nbsp;<i class="fas fa-search"></i></button></span>		
					</div>
				</div>	
				<c:if test="${member ne null }">
				<div>
					<span class="input-group-btn"><button type="button" class="btn-default" style="padding:5px 10px;"><a href="redirectInsertCs.do">새 글 추가</a></button></span> <!--  로그인 해야함 -->											
					<!--<button type="button" class="btn btn-secondary"><a href="getCsList.do">새로고침</a></button>   -->	
				</div>
				</c:if>
			</div>

		<!-- 상단 테이블 -->
   		<section class="table_container " >		
			<c:choose>	
				<c:when test="${csPagination.totalCount > 0 }">
					<span style="padding: 1.2rem; font-weight:bold; color:black;'"> 게시글 수  : ${csPagination.totalCount}</span>
					<table  class="tablelist">
						<tr class="cs"> <!-- from cs.css, need to fix it -->
							<th>번호</th>
							<th>제목</th>
							<th>작성자</th>
					<!-- 	<th>공개 여부</th>  -->
							<th>작성일</th>
							<th>조회</th>
					
							<c:if test="${member.member_grade eq 2 }">				
								<th  class="admin">관리자 버튼</th>
							</c:if>
						</tr>
						
						<c:forEach var="cs" items="${ csList }">
							<tr class="cs_td">	
								<td width="5%" id="cs_id" style="font-weight:600">${cs.cs_id }</td>
								<td width="*" align="left">
									<span style="padding-right:15px"></span>
									<!-- 비공개일때 조건 -->
									 <c:if test="${cs.cs_show eq 'N'}" >
										 <i class="fas fa-lock"></i>
							              <c:choose>
									           <c:when test="${cs.member_id eq member.member_id || member.member_grade eq 2 }"> 
													<c:choose>
														<c:when test="${cs.cs_re_order > 0 }">
															<c:forEach begin="1" end="${cs.cs_re_order}"  step="1">
																<span class="cs_reply"><i class="fab fa-replyd"></i>  : ↪   </span>
															</c:forEach>
															<a href="getCs.do?cs_id=${cs.cs_id }&curPage=${scri.curPage}&perPageNum=${scri.perPageNum }&searchOption=${scri.searchOption}&searchKeyword=${scri.searchKeyword}">${cs.cs_title}</a>
														</c:when>
														<c:otherwise>
																<a href="getCs.do?cs_id=${cs.cs_id }&curPage=${scri.curPage}&perPageNum=${scri.perPageNum }&searchOption=${scri.searchOption}&searchKeyword=${scri.searchKeyword}">${cs.cs_title}</a>
														</c:otherwise>
													</c:choose>	
												</c:when>
												<c:otherwise>비밀글은 작성자와 관리자만 볼 수 있습니다.</c:otherwise>
											</c:choose>
									</c:if>
									<!-- 공개일때 조건 -->
									<c:if test="${cs.cs_show eq 'Y'}" >
	              						<c:choose>
											<c:when test="${cs.cs_re_order > 0 }">
												<c:forEach begin="1" end="${cs.cs_re_order}"  step="1">
													<span style="padding-left:15px; font-weight:bold; color:red;"><i class="fab fa-replyd"></i> : ↪  </span>
												</c:forEach>
											<a href="getCs.do?cs_id=${cs.cs_id }&curPage=${scri.curPage}&perPageNum=${scri.perPageNum }&searchOption=${scri.searchOption}&searchKeyword=${scri.searchKeyword}">${cs.cs_title}</a>
											</c:when>
											<c:otherwise>
												<a href="getCs.do?cs_id=${cs.cs_id }&curPage=${scri.curPage}&perPageNum=${scri.perPageNum }&searchOption=${scri.searchOption}&searchKeyword=${scri.searchKeyword}">${cs.cs_title}</a>
											</c:otherwise>
										</c:choose>	
	               					</c:if>
	               					<!-- TESSSSSSSSSSSSSSSST -->
	        						<c:if test="${ cs.cs_fileName ne null }">
	               						<span style="text-align:right; margin-left: 20px"><i class="far fa-file-alt"></i></span>
	               					</c:if>		
            					</td>
		            					<td width="15%">${cs.cs_writer}</td>
    					<!--  		<td width="5%">${cs.cs_show }</td>   -->
								<td width="20%"><fmt:formatDate value="${cs.cs_regdate }" pattern="yyyy년 MM월 dd일"/></td>			
								<td width="7%">${cs.cs_hit }</td>
								<c:if test="${member.member_grade eq 2 }">
									<td width="15%" class="btns">
										<button class="update_btn btn-default"><a class="alink" href="updateCs.do?cs_id=${cs.cs_id}">수정</a></button> 
										<button  class="delete_btn btn-default" style="color:white"><a class="alink" href="deleteCs.do?cs_id=${cs.cs_id }">삭제</a></button> 		
									</td>		
								</c:if>		
							</tr>								
						</c:forEach>
					</table>
				</c:when>
				<c:otherwise>
					<p class="empty"><b><span>준비중입니다.. 👻</span></b></p>	
				</c:otherwise>
			</c:choose>	
		</section>
		
	<!--  css : add curpage, pagination (no outline), nextpage, prevpage  -->
		<section class="container">
		<c:if test="${csPagination.totalCount > 0 }">
				<!-- 페이지 네비게이션 출력 -->
					<table class="pagination">
						<tr>
							<td colspan="7" align="center">
							 <c:if test="${csPagination.prev}">
							  	<a class="prevpage" href="getCsList.do${csPagination.makeSearch(csPagination.startPage - 1)}">◀ 이전</a>
							  </c:if> 
							<c:forEach var="num"  begin="${csPagination.startPage}" end="${csPagination.endPage}">
									<c:choose>
										<c:when test="${csPagination.cri.curPage eq num }">
											<a href="getCsList.do${csPagination.makeSearch(num)}" class="curpage">${num}</a>&nbsp;
										</c:when>
										<c:otherwise>
											<a href="getCsList.do${csPagination.makeSearch(num)}">${num}</a>&nbsp;
										</c:otherwise>
									</c:choose>
							</c:forEach>
							<c:if test="${csPagination.next && csPagination.endPage >0}">
							 <a class="nextpage" href="getCsList.do${csPagination.makeSearch(csPagination.endPage+1)}">다음 ▶</a>
							</c:if>
							</td>
						</tr>			
					</table>
		</c:if>
		</section>	
	</form>
	<script type="text/javascript">
	$(document).ready(function () {
		var formObj = $("form[name='getForm']");
		var cs_id = $("#cs_id").val();
		//게시물 지우기
		$(".delete_btn").on("click", function(){
			var yn = confirm("게시글을 삭제하시겠습니까? \n* 게시물 삭제시 답변도 함게 삭제됩니다 *");
			if (yn) {
				alert("게시물이 삭제되었습니다");
			} else {
				alert("삭제를 실패했습니다.");
				return false;				
			}
		})
	})
	
	function getCsList(curPage) {			
		location.href="${path}/cs/getCsList?curPage="+curPage+"&searchOption=${searchOption}"+"&searchKeyword=${searchKeyword}";
	};
		//검색
	$(function(){
		$('#searchBtn').click(function() {
			self.location="getCsList.do"+'${csPagination.makeQuery(1)}'+"&searchOption="+$("select[name=searchOption2]").val()+"&searchKeyword="+encodeURIComponent($('#keywordInput').val());
			});
		});
	</script>
	</body>
<%@ include file="../include/Footer.jsp"%>
</html>