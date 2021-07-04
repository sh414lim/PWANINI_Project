<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page import="java.util.Date" %>


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../style/cs.css" />

<title>수정 [ ${csList.cs_title } ]</title>

	<style type="text/css">
	   a, a:hover, a:focus, a:active {
	      color: black;
	      text-decoration: none;
	   }
	   
	</style>
<script src="${path}/ckeditor/ckeditor.js "></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" href="../style/cs.css" />
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
</head>
<%@ include file="../include/Header.jsp"%>
<body> 
<div class="Guide">
      <span>고객센터 : # ${csList.cs_id } -${csList.cs_title } 수정</span>
    </div>
<!-- my bit -->


<div class="updateForm container">
	<form name="updateForm" id="updateForm" action="updateCs.do" method="post" enctype="multipart/form-data">
	<input type="hidden" id="cs_id" name="cs_id" value="${csList.cs_id }"/>
 <!--  앞에 csList는 controller에서 sessionAttributes and model.addAttribute() -->
 			<div style="padding-bottom:1rem;">
				<span style="padding-left:.6rem;"><i class="fas fa-edit"></i><span>&nbsp;글번호</span><span style="font-weight:bold;"> ${csList.cs_id }</span></span>
<!--			<label for="member_id"><span>멤버아이디</span></label><span id="member_id" style="font-weight:bold;">${member.member_id }</span>  -->
			</div>	
			<div class="use_flex">
				<div class="getTitle">
					<label for="cs_title"><span class="title_label">제목</span></label>
					<input class="input2" type="text" class="input2" id="cs_title" name="cs_title" value="${csList.cs_title }"  autofocus  required>
				</div>
				<div class="getRegdate2">
					<label for="cs_regdate"><span class="title_label">작성일</span></label>
					<fmt:formatDate value="${cs.cs_regdate }" pattern="yyyy년 MM월 dd일"/>
				</div>
			</div>
			<div class="writer">
				<label for="cs_writer"><span class="writer_label">작성자</span></label>
				<input class="input2" type="text" name="cs_writer" class="input2" id="cs_writer" value="${member.member_nickname }" style="background-color:#f5eceb" disabled>
			</div>
			<div class="show">
				<label for="cs_show"><span class="show_label">공개 여부</span></label>
				<select class="input2" name="cs_show" id="cs_show">
	            	<option value="Y">Y</option>
	                <option value="N">N</option>
            	</select>
			</div>
			<!-- 
			<div>
				<label for="cs_regdate"><span>최초 작성일</span></label>
				<fmt:formatDate value="${csList.cs_regdate}" pattern="yyyy년 MM월 dd일 HH시mm분"/>
			</div>

		 			-->

			<div class="content">
				<label for="cs_content"><span>내용</span></label><br/>
				<textarea name="cs_content" class="input2" id="cs_content" cols="50" rows="10" required>${csList.cs_content }</textarea>
				<script type="text/javascript">
	            	CKEDITOR.replace("cs_content");
	            </script>		
			</div>
	
	
			<div class="btns">
				<button class="btn-default update_btn" type="button">수정하기</button>		
				<button class="btn-default" onclick="getCsList()">게시글 목록</button>
			</div>
		</form>

</div>


<script type="text/javascript">
$(document).ready(function(){
	var formObj = $("form[name='updateForm']");
	
	//수정하기
	$(".update_btn").on("click", function(){
		var updateYN = confirm("수정하시겠습니까?");
		if (!updateYN) {
			alert("수정이 취소되었습니다!")
			return false;
		} 
			formObj.attr("action", "updateCs.do");
			formObj.attr("method", "post");
			formObj.submit();		
			alert("게시물이 수정되었습니다!")
	})
	
})
</script>
</body>
<%@ include file="../include/Footer.jsp"%>
</html>