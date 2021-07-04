<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>공지사항 등록</title>
<link rel="stylesheet" href="../style/insertNotice.css"/>
<script src = "${path}/ckeditor/ckeditor.js"></script>

<script type="text/javascript">
	function getNoticeList() {
		window.location.href="getNoticeList.do";
	}
</script>

</head>
	  <%@ include file="../include/Header.jsp" %>

<body>
		<div class="Guide">
      		<span>공지사항</span>
    	</div>

<div class="insertForm">
	<form action="insertNotice.do" method="post">
	<input type="hidden" name="notice_name"  value="${member.member_nickname}">
   		<div class="title">
	        <label for="notice_title"><span>제목</span></label>
	        <input type="text" id="notice_title" name="notice_title" required/><br>
   		</div>
	    <div class="writer">
	        <label for="notice_name"><span>작성자</span></label>
	        ${member.member_nickname}<br>
	    </div>
		<div class="content">
			<label for="notice_content"><span>내용</span></label>
	        <textarea name="notice_content" id="notice_content" cols="50" rows="50" required="required" wrap="soft" ></textarea>
	        <script type="text/javascript">
	        	CKEDITOR.replace("notice_content");
	        </script>
		</div>
		<div class="btn">
	        <button type="submit">새글 등록</button>
	        <button type="button" onclick="getNoticeList()">목록으로</button>
		</div>
	</form>
</div>
			
</body>
   <%@ include file="../include/Footer.jsp" %>

</html>
