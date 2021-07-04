<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http//code.jquery.com/jquery-latest.js"></script>
<link rel="stylesheet" href="../../style/productRegistration.css" />
<link rel="stylesheet" href="https//cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
<title>상품 추가</title>
</head>
   <%@ include file="../../include/Header.jsp" %> 
<body>
	<div class="Guide">
		<span>ADMIN</span>
	</div>
	
	<div class="insert_product">
		<form class="insProd_form" action="insertProduct.do" method="post" enctype="multipart/form-data">
			<h1 class="insProd_heading">신규 상품 등록 <i class="fas fa-paw"></i></h1>
			<hr>
			<div class="insProd_field">
				<label class="insProd_label">1차 분류</label> 
				<select name="product_f_code" id="categori1"  class="option">
					<option value="" selected="selected">--선택--</option>
					<option value="DOG">강아지</option>
					<option value="CAT">고양이</option>
				</select>
			</div>
			<div  class="insProd_field">
				<label class="insProd_label">2차 분류  </label>
				<div class="dog"> 
					<select name="product_s_code" id="product_s_code_dog" class="option">
						<option value="" selected="selected">--선택--</option>
						<option value="MEAL">사료</option> 
						<option value="SNACK">간식</option> 
						<option value="SUPPLIES">강아지용품</option> 
					</select>
				</div>
				<div class="cat" hidden="hide">
					<select name="product_s_code" id="product_s_code_cat" disabled="disabled" class="option">
						<option value="" selected="selected">--선택--</option>
						<option value="MEAL">사료</option> 
						<option value="SNACK">간식</option> 
						<option value="SUPPLIES">고양이용품</option> 
					</select>
				</div>
			</div>
			<div  class="insProd_field">
				<label class="insProd_label">3-1차분류 </label> 
				<div class="dog_meal" >
					<select name="product_t_code" id="product_t_code_dog_meal" class="option">
						<option value="" selected="selected">--선택--</option>
						<option value="건식">건식</option>
						<option value="습식">습식</option>
					</select>
				</div>
				<div class="dog_snack" hidden="hide">
					<select name="product_t_code" id="product_t_code_dog_snack" disabled="disabled" class="option">
						<option value="" selected="selected">--선택--</option>
						<option value="껌">껌</option>
						<option value="사사미">사사미</option>
						<option value="저키/트릿">저키/트릿</option>
						<option value="비스켓">비스켓</option>
						<option value="소시지">소시지</option>
						<option value="캔/파우치">캔/파우치</option>
					</select>
				</div>
				<div class="dog_supplies" hidden="hide">
					<select name="product_t_code" id="product_t_code_dog_supplies" disabled="disabled" class="option">
						<option value="" selected="selected">--선택--</option>
						<option value="의류/악세사리">의류/악세사리</option>
						<option value="식기/이동장">식기/이동장</option>
						<option value="집/방석">집/방석</option>
						<option value="배변/위생">배변/위생</option>
						<option value="장난감">장난감</option>
						<option value="미용/목욕">미용/목욕</option>
					</select>
				</div>
				<div class="cat_meal" hidden="hide">
					<select name="product_t_code" id="product_t_code_cat_meal" disabled="disabled" class="option">
						<option value="" selected="selected">--선택--</option>
						<option value="건식">건식</option>
						<option value="습식">습식</option>
					</select>
				</div>
				<div class="cat_snack" hidden="hide">
					<select name="product_t_code" id="product_t_code_cat_snack" disabled="disabled" class="option">
						<option value="" selected="selected">--선택--</option>
						<option value="수제">수제간식</option>
						<option value="츄르">츄르</option>
						<option value="육포/사사미">육포/사사미</option>
						<option value="껌/뼈">껌/뼈</option>
						<option value="빵/비스켓">빵/비스켓</option>
						<option value="캔디">캔디</option>
					</select>
				</div>
				<div class="cat_supplies" hidden="hide">
					<select name="product_t_code" id="product_t_code_cat_supplies" disabled="disabled" class="option">
						<option value="" selected="selected">--선택--</option>
						<option value="장난감">장난감</option>
						<option value="배변/위생">배변/위생</option>
						<option value="미용/목욕">미용/목욕</option>
						<option value="캣타워/집">캣타워/집</option>
					</select>
				</div>
			</div>
			<div  class="insProd_field">
				<label class="insProd_label">3-2차분류  </label>
				<input type="text" name="product_t_code2" id="categori3-2">
			</div>
			<div  class="insProd_field">
				<label class="insProd_label">브랜드  </label>
				<input type="text" name="product_brand" required>
			</div>
			<div  class="insProd_field">
				<label class="insProd_label">상품명  </label>
				<input type="text" name="product_name" required>
			</div>
			<div  class="insProd_field">
				<label class="insProd_label">상품 옵션 </label>
				<input type="text" name="product_option" >
			</div>
			<div  class="insProd_field_noborder">
				<label class="insProd_label" for="product_img">상품 이미지 </label>
				<input type="file" name="file" id="product_img" size="10" required>
			</div>
			<div  class="insProd_field">
				<label class="insProd_label">미리보기</label>
				<div class="select_img"><img src="" /></div>
			</div>
			<div  class="insProd_field">
				<label class="insProd_label">상품 설명 </label>
				<textarea class="product_desc" rows="20" cols="100" name="product_desc" required></textarea>
			</div>
			<div  class="insProd_field">
				<label class="insProd_label">상품 재고 </label>
				<input type="text" name="product_stock" required>
			</div>
			<div  class="insProd_field">
				<label class="insProd_label">상품 가격 </label>
				<input type="text" name="product_price" required>&nbsp;원
			</div>
			<div  class="insProd_field">
				<label class="insProd_label">상품 원가 </label>
				<input type="text" name="product_c_price" required>&nbsp;원
			</div>
		<div class="btns">
				<input class="button" type="submit" value="등록하기"/>		
		</div>			
	</form>
	</div>
</body>
    <%@ include file="../../include/Footer.jsp" %>
<!-- 상품등록 미리보기 -->   
<script>
  $("#product_img").change(function(){
   if(this.files && this.files[0]) {
    var reader = new FileReader;
    reader.onload = function(data) {
     $(".select_img img").attr("src", data.target.result).width(300);        
    }
    reader.readAsDataURL(this.files[0]);
   }
  });
 </script>
<!-- 1차, 2차, 3차 카테고리 변경 -->
<script type="text/javascript">
	$(document).ready(function() {
		$('#categori1').change(function() {
			var result=$('#categori1 optionselected').val();
			if(result=='DOG'){
				$('.dog').show();
				$('.cat').hide();
				$('#product_s_code_dog').prop("disabled", false);
				$('#product_s_code_cat').prop("disabled", true);
				
				$('#product_s_code_dog').change(function() {
					var categori2_dog=$('#product_s_code_dog optionselected').val();
					if(categori2_dog=='MEAL'){
						$('.dog_meal').show();
						$('.dog_snack').hide();
						$('.dog_supplies').hide();
						$('.cat_meal').hide();
						$('.cat_snack').hide();
						$('.cat_supplies').hide();
						$('#product_t_code_dog_meal').prop("disabled", false);
						$('#product_t_code_dog_snack').prop("disabled", true);
						$('#product_t_code_dog_supplies').prop("disabled", true);
						$('#product_t_code_cat_meal').prop("disabled", true);
						$('#product_t_code_cat_snack').prop("disabled", true);
						$('#product_t_code_cat_supplies').prop("disabled", true);
					
					}
					else if (categori2_dog=='SNACK'){
						$('.dog_meal').hide();
						$('.dog_snack').show();
						$('.dog_supplies').hide();
						$('.cat_meal').hide();
						$('.cat_snack').hide();
						$('.cat_supplies').hide();
						$('#product_t_code_dog_meal').prop("disabled", true);
						$('#product_t_code_dog_snack').prop("disabled", false);
						$('#product_t_code_dog_supplies').prop("disabled", true);
						$('#product_t_code_cat_meal').prop("disabled", true);
						$('#product_t_code_cat_snack').prop("disabled", true);
						$('#product_t_code_cat_supplies').prop("disabled", true);
					}
					else if (categori2_dog=='SUPPLIES'){
						$('.dog_meal').hide();
						$('.dog_snack').hide();
						$('.dog_supplies').show();
						$('.cat_meal').hide();
						$('.cat_snack').hide();
						$('.cat_supplies').hide();
						$('#product_t_code_dog_meal').prop("disabled", true);
						$('#product_t_code_dog_snack').prop("disabled", true);
						$('#product_t_code_dog_supplies').prop("disabled", false);
						$('#product_t_code_cat_meal').prop("disabled", true);
						$('#product_t_code_cat_snack').prop("disabled", true);
						$('#product_t_code_cat_supplies').prop("disabled", true);
					}
				});
				
				
			}
			else if (result=='CAT'){
				$('.cat').show();
				$('.dog').hide();
				$('#product_s_code_cat').prop("disabled", false);
				$('#product_s_code_dog').prop("disabled", true);
				

				$('#product_s_code_cat').change(function() {
					var categori2_cat=$('#product_s_code_cat optionselected').val();
					if(categori2_cat=='MEAL'){
						$('.dog_meal').hide();
						$('.dog_snack').hide();
						$('.dog_supplies').hide();
						$('.cat_meal').show();
						$('.cat_snack').hide();
						$('.cat_supplies').hide();
						$('#product_t_code_dog_meal').prop("disabled", true);
						$('#product_t_code_dog_snack').prop("disabled", true);
						$('#product_t_code_dog_supplies').prop("disabled", true);
						$('#product_t_code_cat_meal').prop("disabled", false);
						$('#product_t_code_cat_snack').prop("disabled", true);
						$('#product_t_code_cat_supplies').prop("disabled", true);	
					}
					else if (categori2_cat=='SNACK'){
						$('.dog_meal').hide();
						$('.dog_snack').hide();
						$('.dog_supplies').hide();
						$('.cat_meal').hide();
						$('.cat_snack').show();
						$('.cat_supplies').hide();
						$('#product_t_code_dog_meal').prop("disabled", true);
						$('#product_t_code_dog_snack').prop("disabled", true);
						$('#product_t_code_dog_supplies').prop("disabled", true);
						$('#product_t_code_cat_meal').prop("disabled", true);
						$('#product_t_code_cat_snack').prop("disabled", false);
						$('#product_t_code_cat_supplies').prop("disabled", true);	
					}
					else if (categori2_cat=='SUPPLIES'){
						$('.dog_meal').hide();
						$('.dog_snack').hide();
						$('.dog_supplies').hide();
						$('.cat_meal').hide();
						$('.cat_snack').hide();
						$('.cat_supplies').show();
						$('#product_t_code_dog_meal').prop("disabled", true);
						$('#product_t_code_dog_snack').prop("disabled", true);
						$('#product_t_code_dog_supplies').prop("disabled", true);
						$('#product_t_code_cat_meal').prop("disabled", true);
						$('#product_t_code_cat_snack').prop("disabled", true);
						$('#product_t_code_cat_supplies').prop("disabled", false);	
					}
				});				
			}
		});			
	});
</script>

</html>
















