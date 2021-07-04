<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../../style/AdoptionFormal.css"/>

<title>Insert title here</title>
</head>
<%@ include file="../../include/Header.jsp"%>
<body>
	<div class="Guide">
      <span>분양등록</span>
    </div>
	
	<div align="center">

		<form class="insPaws_form" action="updatePaws.do" method="post" enctype="multipart/form-data">
			<h1 class="insPaws_heading">정보 수정<i class="fas fa-paw"></i></h1>
			<hr>
			<div class="insPaws_field">
				<label class="insPaws_label">1차분류</label> <select class="option"
					name="paws_f_code">
					<option value="DOG">강아지</option>
					<option value="CAT">고양이</option>
				</select>
			</div>
			
			<div class="insPaws_field">
				<label class="insPaws_label">2차분류</label>
				<input type="text" name="paws_s_code" value="${paws.paws_s_code}" required>
			</div>
			
			<div class="insPaws_field">
				<label class="insPaws_label">이름</label>
				<input type="text" name="paws_name" value="${paws.paws_name }" required>
			</div>
			
			<div class="insPaws_field">
				<label class="insPaws_label">나이</label>
				<input type="text" name="paws_age" value="${paws.paws_age }" required>
			</div>
			
			<div class="insPaws_field_noborder">
				<label class="insPaws_label" for="paws_img">이미지</label>
				<input class="file" type="file" id="paws_img" name="file" size="10" />
			</div>
			
			<div class="insPaws_field">
				<label class="insPaws_label">미리보기</label>
				<div class="select_img"><img src="" /></div>
			</div>
			
			<div class="insPaws_field">
				<label class="insPaws_label">설명</label>
				<textarea rows="20" cols="100" name="paws_desc" required>${paws.paws_desc }</textarea>
			</div>
			
			<div class="insPaws_field">
				<label class="insPaws_label">성별</label>
				<input type="text" name="paws_sex" value="${paws.paws_sex }" required>
			</div>
			
			<div class="insPaws_field">
				<label class="insPaws_label">중성화</label>
				<select class="option" name="paws_is_neutered">
					<option value="Y">Y</option>
					<option value="N">N</option>
				</select>
			</div>
			
			<div class="insPaws_field">
				<label class="insPaws_label">건강상태</label>
				<input type="text" name="paws_health" value="${paws.paws_health }" required>
			</div>
			<div class="btns">
				<input class="button" type="submit" value="수정">
				<input class="button" type="button" onclick="List()" value="목록">
			</div>			
		</form>
</div>
	<script type="text/javascript">
		function List() {
			window.location.href="AdminGetPawsList.do";
		}
	</script>
</body>
<%@ include file="../../include/Footer.jsp"%>
</html>