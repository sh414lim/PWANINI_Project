<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<link rel="stylesheet" href="../style/detail.css" />
<link rel="stylesheet" href="../style/main.css" />
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.3/css/all.css"
	integrity="sha384-SZXxX4whJ79/gErwcOYf+zWLeJdY/qpuqC4cAa9rOGUstPomtqpuNWT9wdPEn2fk"
	crossorigin="anonymous">
<style>
.thu_img {
	width: 100px;
	height: 80px;
}

.far, .fas {
	color: #fdcb6e;
}
</style>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript">
	$(document)
			.ready(
					function() {

						//후기 내용 글자수 제한
						$("#rev_content").keyup(
								function(e) {
									var member_id = $("#member_id").val();
									var content = $("#rev_content").val();

									$("#counter").html(
											"(" + content.length
													+ " / 200)"); //글자수 실시간 카운팅
									if (content.length > 200) {
										alert("최대 150자까지 입력 가능합니다.");
										$(this).val(content.substring(0, 200));
										$('#counter').html("(200 / 200)");
									}
								});

						//좋아요 클릭 이벤트
						$(".like")
								.on(
										"click",
										function() {
											var member_id = $("#member_id")
													.val();
											var that = $(".like");
											var rev_id = $(this).attr(
													"data-rev_id");
											//회원일 경우
											if (member_id != "") {
												$
														.ajax({
															url : '/reviewLike.do',
															type : 'post',
															data : {
																"rev_id" : rev_id,
																"member_id" : member_id
															},
															success : function(
																	like) {
																if (like == 1) {
																	likeCount(rev_id);
																	$(
																			"#thumbs-up_"
																					+ rev_id)
																			.attr(
																					"class",
																					"fas fa-thumbs-up");
																} else if (like == 0) {
																	likeCount(rev_id);
																	$(
																			"#thumbs-up_"
																					+ rev_id)
																			.attr(
																					"class",
																					"far fa-thumbs-up");
																}
															}
														});
											} else { //비회원일 경우 
												swal("", "로그인 후 이용 가능합니다.",
														"warning");
											}
										});
						//후기별 좋아요 개수 산정	   
						function likeCount(rev_id) {
							$.ajax({
								url : '/reviewLikeCount.do',
								type : 'post',
								data : {
									"rev_id" : rev_id
								},
								success : function(totalLike) {
									$("#totalLike_" + rev_id).html(totalLike);
								},
							});
						}
						
						//파일 첨부 시 이름, 크기 출력
						$("input[name=file]").on("change",function() {
									var file = this.files[0],
									fileName = file.name,
									fileSize = file.size;
									var fsize = Math.floor(fileSize/1000);
								
									$("#uploadImgInfo").text(fileName+" ("+fsize+"kb)");
								});


					});

	//후기 삭제
	function deleteReview() {
		var rev_id = $("#delRevBtn").attr("data-rev_id");
		var product_id = $("#product_id").val();
		$.ajax({
			url : "deleteReview.do",
			type : "post",
			data : {
				"rev_id" : rev_id,
				"product_id" : product_id
			},
			success : function() {
				swal("", "후기가 삭제되었습니다.", "info");
				setTimeout('window.location.reload(true)', 1500);
			},
			error : function() {
				swal("", "후기 삭제가 불가능합니다..", "warning");
				setTimeout('window.location.reload(true)', 1500);
			}

		});
	}

	//장바구니 추가
	function addToCart() {
		var product_id = $("#product_id").val();
		var cart_amount = $("#cart_amount").val();
		var data = {
			product_id : product_id,
			cart_amount : cart_amount,
		};
		$.ajax({
			url : "addToCart.do",
			type : "post",
			data : data,
			success : function() {
				swal({
					icon : "success",
					text : "장바구니로 이동하시겠습니까?",
					buttons : [ "예", "아니오" ],
				}).then(function(isConfirm) {
					if (isConfirm) {
						window.location.reload();
					} else {
						window.location.href = "getCartList.do";
						$("#cart_amount").val("1");
					}
				});
			},
			error : function() {
				swal("", "로그인 후 이용해 주시기 바랍니다.", "warning").then(function() {
				});
			},
		})
	}
	// 바로 구매 시
	function goToPurchase() {
		var product_id = $("#product_id").val();
		var cart_amount = $("#cart_amount").val();
		var data = {
			product_id : product_id,
			cart_amount : cart_amount,
		};
		$.ajax({
			url : "addToCart.do",
			type : "post",
			data : data,
			success : function() {
				swal("", "주문서로 이동합니다.", "info");
				setTimeout('window.location.href = "orderFormView.do"', 1500);
			},
			error : function() {
				swal("", "로그인 후 이용해 주시기 바랍니다.", "warning").then(function() {
				});
			},
		});
	}

	//비회원 로그인 이동
	function goToLogin() {
		swal("", "로그인 후 이용 가능합니다.", "info");
	}
	//회원 후기 등록
	function insertMsg() {
		var chkFile = $("#rev_f_img").val();
		if(chkFile != ""){
		swal("", "후기가 등록되었습니다.", "success");
		setTimeout(1500);
		$("#insertRevForm").submit();
		}else{
		swal("", "파일을 첨부해 주시기 바랍니다.", "warning");
		}
	}
	
	function insert_product_inq() {
		window.location.href="go_insertProduct_inq.do";
	}
</script>
<%@ include file="../include/Header.jsp"%>
<body>
	<div class="Guide">
		<span>상품설명</span>
	</div>

	<div class="grid">
		<div class="product_image">
			<img class="img_main" src="${product.product_img }">
		</div>
		<div class="box">
			<ul class="product_dis">
				<li>${product.product_brand}</li>
				<li>${product.product_name}</li>
				<li></li>
				<c:set var="c_price" value="${product.product_c_price}" />
				<c:set var="price" value="${product.product_price}" />
				<script type="text/javascript">
					var c_price = '<c:out value = "${product.product_price}"/>' * 1.1;
					var price = '<c:out value = "${product.product_price}"/>'
					var sale = c_price - price;
					$(document).ready(function() {
						$("#c_price").text(Math.floor(c_price) + " 원");
						$("#salePrice").text(Math.floor(sale) + " 원");
					});
				</script>
				<li>정가<span id="c_price"> 원</span></li>
				<li>판매가<span>${product.product_price} 원</span></li>

				<li>할인금액<span id="salePrice"></span></li>
			</ul>
			<div class="product_stock">
				<div class="stpck_one">
					<ul>
						<li><i class="fas fa-star"></i></li>
						<li id="stock">${product.rev_avg_stars}</li>
					</ul>
				</div>

				<div>
					<ul>
						<li><i class="fas fa-truck"></i></li>
						<li>로켓배송</li>
					</ul>
				</div>
				<div>
					<ul>
						<li><i class="fas fa-paw"></i></li>
						<li>프리미엄</li>
					</ul>
				</div>
			</div>
			
			<!-- 구매 관련 버튼 -->
				
				<div class="select__qty">
				<div class="select__div">
				구매 수량
				</div>
				<div class="select__div2">
				<input type="hidden" id="product_id" name="product_id"
					value="${product.product_id}" /> <select id="cart_amount">
					<c:forEach begin="1" end="10" var="i">
						<option value="${i}">${i}개</option>
					</c:forEach>
				</select>
				</div>
				</div>
				
			<div class="btn__area">

				<button type="button" class="button_two" onclick="addToCart();">장바구니
					담기</button>
				<c:set var="stock" value="${product.product_stock}" />
				<c:if test="${product.product_stock != 0 }">
					<button class="button_two" onclick="goToPurchase();">바로구매</button>
				</c:if>
				<c:if test="${product.product_stock == 0 }">
					<button class="button_two">품절</button>
				</c:if>
					<button class="button_two" onclick="insert_product_inq();">상품문의</button>
			</div>
		</div>
	</div>

	<div class="product_Information">
		<h1>상품 상세 정보</h1>
	</div>
	<div class="pawnini">
		<img src="../images/Rogo.jpg" />
	</div>
	<div class="bener">
		<div class="product_bener"></div>

	</div>


	<!-- 상품 설명 상품 제목 -->
	<h1 class="product_title">${product.product_name }</h1>
	<div class="product_img">
		<img src="${product.product_img }" />
	</div>
	<!-- 상품 사진 -->
	<div align="center">
		<h1 class="Product_dis">Q&A</h1>
		<img src="../images/asdasd.png">
		<div class="product_image_des"></div>
	</div>


	<div class="Bouns">
		<ul class="Bouns_ul">
			<li>
				<h3>
					<i class="fas fa-drumstick-bite lg"></i>신선한 사료
				</h3>
			</li>
			<li>
				<h3>
					<i class="far fa-clock"></i>유통기한 100% 책임제
				</h3>

			</li>
			<li>
				<h3>
					<i class="fas fa-shipping-fast"></i>신속! 정확! 배송!
				</h3>
			</li>
			<li>
				<h3>
					<i class="fas fa-rss"></i>5만원 이상 구매시 무료배송
				</h3>
			</li>
		</ul>
	</div>

	<hr>

	<!-- REVIEW -->

	<div class="Guide">
		<span>상품후기</span>
	</div>
	
	<div class="rev__div">
	
	<!-- 평점보드  -->
	<div class="score__board">
		<div class="score__prestars">RATING</div>
		<div class="score__stars">
			<c:if test="${product.rev_avg_stars == 0}">
			<i class="far fa-star"></i>
			</c:if>
			<c:if test="${product.rev_avg_stars == 0.5}">
			<i class="fas fa-star-half-alt"></i>
			</c:if>
			<c:if test="${product.rev_avg_stars == 1}">
			<i class="fas fa-star"></i>
			</c:if>
			<c:if test="${product.rev_avg_stars == 1.5}">
			<i class="fas fa-star"></i><i class="fas fa-star-half-alt"></i>
			</c:if>
			<c:if test="${product.rev_avg_stars == 2}">
			<i class="fas fa-star"></i><i class="fas fa-star"></i>
			</c:if>
			<c:if test="${product.rev_avg_stars == 2.5}">
			<i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star-half-alt"></i>
			</c:if>
			<c:if test="${product.rev_avg_stars == 3}">
			<i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i>
			</c:if>
			<c:if test="${product.rev_avg_stars == 3.5}">
			<i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star-half-alt"></i>
			</c:if>
			<c:if test="${product.rev_avg_stars == 4}">
			<i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i>
			</c:if>
			<c:if test="${product.rev_avg_stars == 4.5}">
			<i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star-half-alt"></i>
			</c:if>
			<c:if test="${product.rev_avg_stars == 5}">
			<i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i>
			</c:if>
			<span class="score__tstars">${product.rev_avg_stars}</span>
		</div>
	</div>
	
	<!-- 후기 목록 -->
	<c:forEach items="${review}" var="review">
	<div class="review__list">
		<div class="review__f__list">
			<div class="review__f__sublist">
				<div class="review__f__ssublist">
				<div class="review__stars">
					<i class="fas fa-star"></i> 
				</div>
				&nbsp;<span><fmt:formatNumber pattern="0.0" value="${review.rev_stars}"/></span>
				<div class="review__border"></div>
				<fmt:formatDate pattern="yyyy-MM-dd" value="${review.rev_date}" />
				</div>
			<div id="review__writer">${review.rev_writer}</div>
			</div>
		</div>
		
		<div class="review__s__list">
			
			<div class="review__img">
			<img src="${review.rev_thumb_img}" />
			</div>
			<div class="review__text">
			${review.rev_content}
			</div>
			<div class="review__s_border"></div>
		</div>
			<!-- <div class="review__s__border"> -->
		<div class="review__t__list">
			<input type="hidden" id="rev_id" name="rev_id"
								value="${review.rev_id}" data-rev_id="${review.rev_id}" />
				<div class="thumbs__icon">
				<a class="like" data-rev_id="${review.rev_id}">좋아요 
					<i id="thumbs-up_${review.rev_id}" class="far fa-thumbs-up"></i>
				</a> <span id="totalLike_${review.rev_id}"
								data-rev_id="${review.rev_id}">${review.rev_like_cnt}</span>
				</div>
		<!-- 	</div> -->
				<div class="delBtn">
				<c:choose>
						<c:when
							test="${review.member_id eq member.member_id || member.member_grade eq 2}">
							<input type="button" id="delRevBtn" class="delRevBtn" value="삭제"
								data-rev_id="${review.rev_id}" onclick="deleteReview()">
						</c:when>
						<c:otherwise>
							<input type="button" id="delRevBtn" class="delRevBtn" value="삭제"
								data-rev_id="${review.rev_id}" onclick="deleteReview()"
								disabled>
						</c:otherwise>
					</c:choose>
				</div>
		</div>
	</div>
	</c:forEach>
	
	<!-- 후기 작성폼 -->
	<div id="revform">
	<form id="insertRevForm" action="insertReview.do" method="post" enctype="multipart/form-data">
	<input type="hidden" id="member_id" name="member_id" value="${member.member_id}"> 
	<input type="hidden" name="product_id" value="${product.product_id}" />
		<div class="revForm__intro">
		Pawnini의 제품을 평가해 주세요&nbsp; <i class="fas fa-paw"></i>
		</div>
		<div class="revForm__stars">
			<select class="rev__stars" name="rev_stars" id="rev_stars">
				<option value="5">★★★★★</option>
				<option value="4">★★★★</option>
				<option value="3">★★★</option>
				<option value="2">★★</option>
				<option value="1">★</option>
			</select>
		</div>
		
		<div class="revForm__main">
			<div class="revForm__textarea">
				<textarea name="rev_content" id="rev_content" class="rev__textarea" 
				placeholder="200자 이내로 작성해 주시기 바랍니다." required></textarea>
				<span class="counter" id="counter">(0 / 200)</span>
			</div>
		</div>
		
		<div class="revForm__info">
			<div class="revForm__writer">
				<dl>
					<dt>작성자</dt>
					<dd><input type="text" class="rev_writer" id="rev_writer" name="rev_writer"
							value="${member.member_nickname}" readonly></dd>
				</dl>
				<dl>
					<dt>제품명</dt>
					<dd><input type="text" class="product_name" value="${product.product_name}" readonly></dd>
				</dl>
			</div>
		</div>
		
		<div class="revForm__file">
			<div class="revForm__file__icon">
				<label class="input-file" for="rev_f_img"><i id="file__icon" class="fas fa-images"></i></label>
				<input type="file" id="rev_f_img" name="file" style="display: none;" required />
				<span id="uploadImgInfo"></span>
				
			</div>
			<div class="revForm__btn">
				<c:choose>
					<c:when test="${not empty member.member_id}">
						<button type="button" class="insertRevBtn" id="insertRevBtn" onclick="insertMsg()">등록</button>
					</c:when>                 
					<c:otherwise>            
						<button type="button" class="insertRevBtn" id="insertRevBtn" onclick="goToLogin()">등록</button>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</form>
	</div>

	</div>

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.min.js"></script>
	<script src="./time.js"></script>
</body>
<%@ include file="../include/Footer.jsp"%>

</html>