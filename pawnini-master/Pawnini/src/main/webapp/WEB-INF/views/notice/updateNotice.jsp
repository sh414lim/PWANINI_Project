<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>공지사항 수정</title>
</head>
<link rel="stylesheet" href="../style/reviewRegistration.css"/>
<script src = "${path}/ckeditor/ckeditor.js"></script>
	  <%@ include file="../include/Header.jsp" %>
	  
<body>
		<div class="Guide">
      		<span>공지사항</span>
    	</div>
<div class="insertForm">
	<form action="updateNotice.do" method="post">
	<input type="hidden" name="notice_name"  value="${member.member_nickname}">
   		<div class="title_udt">
	        <label for="notice_title"><span>제목</span></label>
	        <input type="text" id="notice_title" name="notice_title" value="${notice.notice_title }" required/><br>
   		</div>
	    <div class="writer">
	        <label for="notice_name"><span>작성자</span></label>
	        ${member.member_nickname}<br>
	    </div>
		<div class="content">
			<label for="notice_content"><span>내용</span></label>
	        <textarea name="notice_content" id="notice_content" cols="50" rows="50" required="required" wrap="soft" >${notice.notice_content}</textarea>
	        <script type="text/javascript">
	        	CKEDITOR.replace("notice_content");
	        </script>
		</div>
		<div class="btn">
	        <button type="submit">수정 완료</button>
	        <button type="button" onclick="getNoticeList()">목록으로</button>
		</div>
	</form>
</div>
		
</body>
   <%@ include file="../include/Footer.jsp" %>
</html>
 