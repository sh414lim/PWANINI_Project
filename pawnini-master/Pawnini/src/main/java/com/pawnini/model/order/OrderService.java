package com.pawnini.model.order;

import java.util.List;

import com.pawnini.model.product.ProductDTO;

public interface OrderService {

	// 주문 정보 삽입
	public void insertOrder(OrderDTO dto) throws Exception;

	// 회원정보 적립금 업데이트
	public void updateMileage(String member_id) throws Exception;

	// 주문 테이블 내 적립금 상태 업데이트
	public void checkMileageStatus(OrderDTO dto) throws Exception;

	// 상세주문 정보 삽입
	public void insertOrderDetails(OrderDetailsDTO dto) throws Exception;

	// 전체 주문목록 불러오기(관리자)
	public List<OrderDTO> getAllOrders() throws Exception;

	// 특정 ID 상세주문 불러오기(관리자)
	public List<OrderListDTO> getAllOrderDetails(String ord_id) throws Exception;

	// 특정 ID 주문 정보 불러오기
	public List<OrderDTO> getOrderList(OrderDTO dto) throws Exception;

	// 상세주문 보기
	public List<OrderListDTO> getOrderDetails(OrderDTO dto) throws Exception;

	// 배송현황 업데이트
	public void updateOrdStatus(OrderDTO dto) throws Exception;

	// 배송 제품 재고 차감
	public void updateStock(ProductDTO dto) throws Exception;

	// 주문 삭제
	public void deleteOrder(OrderDTO dto) throws Exception;

	// 주문 취소 적립금 환불
	public void refundMileage(OrderDTO dto) throws Exception;

	// 장바구니 제품 추가
	public void addToCart(CartDTO dto) throws Exception;

	// 장바구니 목록 불러오기
	public List<CartDTO> getCartList(String member_id) throws Exception;

	// 장바구니 수정
	public void modifyCart(CartDTO dto) throws Exception;

	// 장바구니 중복 제품 확인
	public int countCart(int product_id, String member_id) throws Exception;

	// 장바구니 중복 제품 수량 합치기
	public void checkOverlap(CartDTO dto) throws Exception;

	// 장바구니 ID 삭제
	public void deleteCartId(int cart_id) throws Exception;

	// 특정 회원 장바구니 삭제
	public void deleteCartByMember(String member_id) throws Exception;

	// 장바구니 금액 합계 구하기
	public int getSum(String member_id) throws Exception;

	// 현재 적립금 구하기
	public int getCurrentMileage(String member_id) throws Exception;

	// Mypage 주문금액, 적립금, 주문건수
	public List<OrderDTO> getMyPageInfo(String member_id) throws Exception;

	// 관리자 매출정보 구하기
	public List<OrderDTO> getTotalSales() throws Exception;

}
