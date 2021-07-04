<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지사항 상세</title>
<link rel="stylesheet" href="../style/getNotice.css"/>

<script type="text/javascript">
	function deleteNotice() {
		window.location.href="deleteNotice.do?notice_id="+${ notice.notice_id};
	}
	function getNoticeList() {
		window.location.href="getNoticeList.do";
	}
</script>

</head>
<%@ include file="../include/Header.jsp"%>
<body>
	<div align="center">
		<div class="Guide">
			<span>공지사항</span>
		</div>
		<div class="form_box">
			<form action="go_updateNotice.do" method="post">
				<input name="notice_id" type="hidden" value="${ notice.notice_id }" />
				<div class="title">
					<div>
					<label><strong>제목 </strong> 
					</label> 
					${ notice.notice_title }
					</div>
					<div>
					<label><strong>등록일 </strong> 
					</label>
					<fmt:formatDate value="${ notice.notice_date }" pattern="yyyy-MM-dd" />
					</div>
				</div>
				<div class="writer">
					<strong><label>작성자  </label></strong>
					${ notice.notice_name }
				</div>
				<div class="content">
				<strong><label>내용</label></strong>
				</div>
					<div class="content_box">${ notice.notice_content }</div>
				<div class="btnList">
				<c:if test="${notice.notice_name eq member.member_nickname}">
					<input class="button" type="submit" value="수정하기">
					<input type="button" onclick="deleteNotice()" value="삭제하기">
				</c:if>
					<input type="button" onclick="getNoticeList()" value="목록으로">
				</div>
			</form>
		</div>
			
	</div>

</body>
<%@ include file="../include/Footer.jsp"%>
</html>
