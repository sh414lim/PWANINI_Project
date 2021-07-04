<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
 <!-- absolute path:    -->

<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" rel="stylesheet" href="../style/cs.css"/>

<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<title>PAWNINI - 고객서비스 게시물 추가</title>
	<style type="text/css">
	 .main_title {
		text-align: center;
		padding: 20px auto;
		color: rosyBrown;
	}
	   a, a:hover, a:focus, a:active {
	      color: black;
	      text-decoration: none;
	   }
	</style>    

	
<script src="${path}/ckeditor/ckeditor.js "></script>
<script type="text/javascript">
	function getCsList() {
		window.location.href="getCsList.do";
		}

</script>
</head>
<%@ include file="../include/Header.jsp"%>
<body>

<!-- my bit -->
<div class="Guide">
      <span>고객센터 문의사항 추가</span>
    </div>

<div class="insertForm">
   <form name="insertForm" action="insertCs.do" method="post" enctype="multipart/form-data">
   <input type="hidden" name="member_id" id="member_id" value="${member.member_id }"/>
         <div class="title">
			<label for="cs_title"><span>제목<span class="star">&nbsp;*</span></span></label>
			<input class="input2" type="text" id="cs_title" name="cs_title" required autofocus>
         </div>
         <div class="writer">
            <label for="cs_writer"><span>작성자</span></label>
            <input class="input2" type="text" id="cs_writer" name="cs_writer" style="background-color:#f5eceb" required value="${member.member_nickname }" readonly>
         </div>
       
       	 <div class="show">
            <label for="cs_show"><span>공개 여부</span></label>
            <select class="input2" name="cs_show" id="cs_show">
            	<option value="Y">Y</option>
                <option value="N">N</option>
            </select>
         </div>
                  
         <div class="content">
            <label for="cs_content" class="content_adjust"><span>내용</span><span class="star">&nbsp;*</span></label>
            <textarea name="cs_content" id="cs_content" cols="50" rows="50" required></textarea>
            <script type="text/javascript">
            	CKEDITOR.replace("cs_content");
            </script>
         </div>
              
         <div class="attach">
           	<label for="cs_uploadFile"><span>첨부파일</span></label>
           	<input class="input2" type="file" name="cs_uploadFile" id="cs_uploadFile"/>
         </div>               
         
         <div class="btns">
            <button class="insertBtn btn-default" type="submit" style="cursor: pointer" value="글 등록">글 등록</button>
            <button type="button" class="btn-default" onclick="getCsList()">목록으로</button>
         </div>
	</form>
	</div>
</body>
<%@ include file="../include/Footer.jsp"%>
</html>