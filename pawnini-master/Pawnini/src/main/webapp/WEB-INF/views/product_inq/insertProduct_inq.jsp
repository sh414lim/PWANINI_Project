<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>상품문의 등록</title>
<link rel="stylesheet" href="../style/insertNotice.css"/>
<script src = "${path}/ckeditor/ckeditor.js"></script>

<script type="text/javascript">
	function getProduct_inqList() {
		window.location.href="getProduct_inqList.do";
	};
	
</script>

</head>
	  <%@ include file="../include/Header.jsp" %>

<body>
		<div class="Guide">
      		<span>상품문의</span>
    	</div>

<div class="insertForm">
	<form action="insertProduct_inq.do" method="post" enctype="multipart/form-data">
	<input type="hidden" name="inq_name"  value="${member.member_nickname}">
   		<div class="title">
	        <label for="inq_title"><span>제목</span></label>
	        <input type="text" id="inq_title" name="inq_title" required/><br>
   		</div>
	    <div class="writer">
	        <label for="inq_name"><span>작성자</span></label>
	        ${member.member_nickname}<br>
	    </div>
	    <div class="writer"><!-- 추가된 항목  공개 여부 -->
        <label for="inq_show" ><strong>공개여부</strong></label> 
        <select name="inq_show" >
                      <option value="Y">Y</option>
                      <option value="N">N</option>
       </select>
       </div>
		<div class="content">
			<label for="inq_content"><span>내용</span></label>
	        <textarea name="inq_content" id="inq_content" cols="50" rows="50" required="required" wrap="soft" ></textarea>
	        <script type="text/javascript">
	        	CKEDITOR.replace("inq_content");
	        </script>
		</div>
		
        <!-- 이미지 등록 -->
		<div class="writer">		
            <label for="inq_image"><strong>이미지</strong></label>
			<input type="file" id="inq_image" name="file" required/>
        </div>
        
       
       <!-- 회원아이디,제품번호   -->
       <input type="hidden" name="member_id" value="${member.member_id}" >
       <input type="hidden" name="product_id" value="${product.product_id}" >
       
		<div class="btnList">
	        <button type="submit" class="btn-default">새글 등록</button>
	        <button type="button" class="btn-default" onclick="getProduct_inqList()">목록으로</button>
		</div>
	</form>
</div>
			
</body>
   <%@ include file="../include/Footer.jsp" %>

</html>