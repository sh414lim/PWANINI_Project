package com.pawnini.model.order.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pawnini.model.order.CartDTO;
import com.pawnini.model.order.OrderDTO;
import com.pawnini.model.order.OrderDetailsDTO;
import com.pawnini.model.order.OrderListDTO;
import com.pawnini.model.order.OrderService;
import com.pawnini.model.product.ProductDTO;

@Service("orderService")
public class OrderServiceImpl implements OrderService {
	@Autowired
	OrderDAO dao;

	@Override
	public void insertOrder(OrderDTO dto) throws Exception {
		System.out.println("주문서 삽입");
		dao.insertOrder(dto);
	}

	@Override
	public void updateMileage(String member_id) throws Exception {
		System.out.println("member 적립금 업데이트");
		dao.updateMileage(member_id);
	}

	@Override
	public void checkMileageStatus(OrderDTO dto) throws Exception {
		System.out.println("order 적립금 처리현황 업데이트");
		dao.checkMileageStatus(dto);
	}

	@Override
	public void insertOrderDetails(OrderDetailsDTO dtoList) throws Exception {
		System.out.println("상세주문서 삽입");
		dao.insertOrderDetails(dtoList);
	}

	@Override
	public List<OrderDTO> getAllOrders() throws Exception {
		System.out.println("전체 주문 목록 불러오기 - 관리자");
		return dao.getAllOrders();
	}

	@Override
	public List<OrderListDTO> getAllOrderDetails(String ord_id) throws Exception {
		System.out.println("특정 상세 주문 불러오기 - 관리자");
		return dao.getAllOrderDetails(ord_id);
	}

	@Override
	public List<OrderDTO> getOrderList(OrderDTO dto) throws Exception {
		System.out.println("주문 목록 불러오기");
		return dao.getOrderList(dto);
	}

	@Override
	public List<OrderListDTO> getOrderDetails(OrderDTO dto) throws Exception {
		System.out.println("상세주문 불러오기");
		return dao.getOrderDetails(dto);
	}

	@Override
	public void updateOrdStatus(OrderDTO dto) throws Exception {
		System.out.println("배송현황 업데이트");
		dao.updateOrdStatus(dto);
	}

	@Override
	public void updateStock(ProductDTO dto) throws Exception {
		System.out.println("상품 재고 업데이트");
		dao.updateStock(dto);
	}

	@Override
	public void refundMileage(OrderDTO dto) throws Exception {
		System.out.println("주문 취소 - 적립금 환불");
		dao.refundMileage(dto);
	}

	@Override
	public void deleteOrder(OrderDTO dto) throws Exception {
		System.out.println("주문 삭제");
		dao.deleteOrder(dto);
	}

	@Override
	public void addToCart(CartDTO dto) throws Exception {
		System.out.println("장바구니 추가");
		dao.addToCart(dto);
	}

	@Override
	public List<CartDTO> getCartList(String member_id) throws Exception {
		System.out.println("장바구니 목록");
		return dao.getCartList(member_id);
	}

	@Override
	public void modifyCart(CartDTO dto) throws Exception {
		System.out.println("장바구니 수정");
		dao.modifyCart(dto);
		System.out.println("장바구니 수정 완료");
	}

	@Override
	public int countCart(int product_id, String member_id) throws Exception {
		System.out.println("장바구니 중복 체크");
		return dao.countCart(product_id, member_id);
	}

	@Override
	public void checkOverlap(CartDTO dto) throws Exception {
		System.out.println("장바구니 중복 상품 수량 합치기");
		dao.checkOverlap(dto);
	}

	@Override
	public void deleteCartId(int cart_id) throws Exception {
		System.out.println("장바구니 삭제");
		dao.deleteCartId(cart_id);
	}

	@Override
	public void deleteCartByMember(String member_id) throws Exception {
		System.out.println("특정 회원 장바구니 삭제");
		dao.deleteCartByMember(member_id);
	}

	public int getSum(String member_id) throws Exception {
		System.out.println("장바구니 금액 합계");
		return dao.getSum(member_id);
	}

	@Override
	public int getCurrentMileage(String member_id) throws Exception {
		System.out.println("현 적립금 불러오기");
		return dao.getCurrentMileage(member_id);
	}

	@Override
	public List<OrderDTO> getMyPageInfo(String member_id) throws Exception {
		System.out.println("Mypage 적립금, 주문액, 주문건수 불러오기");
		return dao.getMyPageInfo(member_id);
	}

	@Override
	public List<OrderDTO> getTotalSales() throws Exception {
		System.out.println("총매출 불러오기");
		return dao.getTotalSales();
	}

}
