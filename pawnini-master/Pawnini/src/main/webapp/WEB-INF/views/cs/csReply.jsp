<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="${path}/ckeditor/ckeditor.js "></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<link type="text/css" rel="stylesheet" href="../style/cs.css"/>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<title>게시판 답글</title>
<%
	int cs_id = Integer.parseInt(request.getParameter("cs_id"));
	int cs_re_group = Integer.parseInt(request.getParameter("cs_re_group"));
	int cs_re_order = Integer.parseInt(request.getParameter("cs_re_order"));
	int cs_re_depth = Integer.parseInt(request.getParameter("cs_re_depth"));

		
%>
<!-- 게시글 번호 -->
<c:set var="cs_id" value="<%= cs_id%>"/>
<c:set var="cs_re_group" value="<%= cs_re_group %>"/>
<c:set var="cs_re_order" value="<%= cs_re_order %>"/>
<c:set var="cs_re_depth" value="<%= cs_re_depth %>"/>

</head>
  <%@ include file="../include/Header.jsp" %>


<body>
      <div class="Guide">
        <span>게시판 답글  - # ${ cs_id} </span>
      </div>

    <div class="insertForm container">
      <form id="csForm" name="csForm">
        <input  type="hidden" id="cs_parent_cs_id" name="cs_parent_cs_id" value="${cs.cs_id }"/>
        <input type="hidden" name="member_id" value="${member.member_id }" />
        <input type="hidden" name="cs_re_group" value="${cs.cs_re_group }" />
        <input type="hidden" name="cs_re_order" value="${cs.cs_re_order }" />
        <input type="hidden" name="cs_re_depth" value="${cs.cs_re_depth }" />
        <input type="hidden" id="cs_writer" name="cs_writer" value="${member.member_nickname }"/>
        
		<div class='title'>
              <label for="cs_title"><span>제목</span></label>
              <input type="text" class="input2" id="cs_title" name="cs_title" required autofocus/>
        </div>
        <div class="show">
        	 <label for="cs_show"><span>작성자 공개 여부</span></label>
             <input name="cs_show" class="input2"  id="cs_show" style="background-color:#f5eceb;" value="${cs.cs_show }" readonly>
       </div>
       
       <div class="content">
              <label for="cs_content"><span>내용</span></label>
              <textarea name="cs_content" class="input2"  id="cs_content" cols="50" rows="50" required></textarea>
				<script type="text/javascript">
	            	CKEDITOR.replace("cs_content");
	            </script>
		</div>
       
        <div class="attach">
              <label for="cs_fileName"><span>파일</span></label
              ><input class="file" class="input2" type="file" name="cs_fileName" id="cs_fileName" />
       </div>
       
        <div class="btns">
            <button type="submit" class="btn-default reply_btn">답글 추가</button>
            <button type="button" id="btn-cls" class="btn-default">입력 초기화</button>
			<button class="btn-default" onclick="getCsList()">목록으로</button>
        </div>
      </form>
    </div>
<script type="text/javascript">
//게시판 목록 페이지 이동
function getCsList() {
   location.href="getCsList.do";
}      
$(document).ready(function() {
   var formObj = $("form[name='csForm']");
   
   $(".reply_btn").on("click", function() {
       var cs_id = $("#cs_id").val();
       var cs_re_group = $("#cs_re_group").val();
       var cs_re_order = $("#cs_re_order").val();
       var cs_re_depth = $("#cs_re_depth").val();
       var cs_parent_cs_id = $("#cs_parent_cs_id").val();
       var cs_title = $("#cs_title").val();
        var cs_writer = $("#cs_writer").val();
        var cs_show = $("#cs_show").val();
        var cs_content = CKEDITOR.instances['cs_content'].getData();
        // var cs_content = $("#cs_content").val();
        var cs_fileName = $("#cs_fileName").val();
        var member_id =$("#member_id").val();

         if (cs_title == "") {
            swal("", "제목을 입력해주세요!", "warning");
            $("#cs_title").focus();
            return;
         }
         if (cs_content == "") {
            swal("", "내용을 입력해주세요!", "warning");
            $("#cs_content").focus();
            return;
         }
         
      var csReply = confirm("답글을 추가하시겠습니까?");
      
      if (csReply) {
         formObj.attr("action", "insertCsReply.do");
         formObj.submit();
      }   
   })
  
    $("#btn-cls").on("click", function() {
    	location.reload();
    });
});
</script>
</body>
<%@ include file="../include/Footer.jsp"%>
</html>