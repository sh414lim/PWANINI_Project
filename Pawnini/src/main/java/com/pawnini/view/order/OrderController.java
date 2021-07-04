package com.pawnini.view.order;

import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.pawnini.model.member.MemberDTO;
import com.pawnini.model.order.CartDTO;
import com.pawnini.model.order.OrderDTO;
import com.pawnini.model.order.OrderDetailsDTO;
import com.pawnini.model.order.OrderListDTO;
import com.pawnini.model.order.OrderService;
import com.pawnini.model.product.ProductDTO;

@Controller
@SessionAttributes("order")
public class OrderController {

	@Autowired
	OrderService orderService;

	// 주문+결제

	// 주문서 이동
	@RequestMapping(value = "orderFormView.do")
	public ModelAndView orderFormView(HttpSession session, ModelAndView mav) throws Exception {
		MemberDTO member = (MemberDTO) session.getAttribute("member");
		String member_id = member.getMember_id();

		// 장바구니 정보 불러오기
		Map<String, Object> map = new HashMap<String, Object>();
		List<CartDTO> cartList = orderService.getCartList(member_id);
		int curMileage = orderService.getCurrentMileage(member_id);

		// 상품금액 합계에 따라 배송비 지정
		int sumTotal = orderService.getSum(member_id);
		int shippingFee = sumTotal >= 50000 ? 0 : 2500;

		// 관련 정보 map에 저장
		map.put("cartList", cartList);
		map.put("count", cartList.size());
		map.put("sumTotal", sumTotal);
		map.put("shippingFee", shippingFee);
		map.put("finalSum", sumTotal + shippingFee);
		map.put("curMileage", curMileage);
		mav.setViewName("order/orderForm");
		mav.addObject("map", map);

		return mav;

	}

	// 주문 삽입
	@ResponseBody
	@RequestMapping(value = "insertOrder.do", method = RequestMethod.POST)
	public String order(HttpSession session, OrderDTO dto, OrderDetailsDTO dtoList) throws Exception {
		System.out.println("insertOrder.do 작동");

		MemberDTO member = (MemberDTO) session.getAttribute("member");
		String member_id = member.getMember_id();

		// ord_id(주문번호) 랜덤생성
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		String ym = year + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
		String ymd = ym + new DecimalFormat("00").format(cal.get(Calendar.DATE));
		String subNum = "";

		for (int i = 1; i <= 3; i++) {
			subNum += (int) (Math.random() * 10);
		}

		String ord_id = ymd + "_" + subNum;

		dto.setOrd_id(ord_id);
		dto.setMember_id(member_id);

		// 주문 정보 삽입
		orderService.insertOrder(dto);
		// 사용한 마일리지 회원 마일리지에서 차감
		orderService.updateMileage(member_id);
		// 차감된 마일리지 상태 주문 테이블에 업데이트
		orderService.checkMileageStatus(dto);

		dtoList.setOrd_id(ord_id);
		// 상세주문 정보 삽입
		orderService.insertOrderDetails(dtoList);

		// 결제한 장바구니 삭제
		orderService.deleteCartByMember(member_id);

		return "redirect:main.do";

	}

	@RequestMapping(value = "getAllOrders.do")
	public String getOrderList(OrderDTO dto, Model model) throws Exception {

		// 주문 목록 불러오기
		List<OrderDTO> allOrder = orderService.getAllOrders();
		model.addAttribute("allOrder", allOrder);

		// 매출 정보 불러오기
		List<OrderDTO> sales = orderService.getTotalSales();
		model.addAttribute("sales", sales);

		return "order/getAllOrders";

	}

	@RequestMapping(value = "getAllOrderDetails.do", method = RequestMethod.GET)
	public String getAllOrderDetails(@RequestParam("num") String ord_id, OrderDTO dto, Model model) throws Exception {

		// 특정 주문 상세 불러오기
		List<OrderListDTO> allOrderDetails = orderService.getAllOrderDetails(ord_id);
		model.addAttribute("allOrderDetails", allOrderDetails);

		return "order/getAllOrderDetails";
	}

	@RequestMapping(value = "updateOrdStatus.do", method = RequestMethod.POST)
	public String updateOrdStatus(OrderDTO dto, @RequestParam("ord_id") String ord_id) throws Exception {

		// 배송현황 업데이트
		orderService.updateOrdStatus(dto);

		List<OrderListDTO> orderList = orderService.getAllOrderDetails(ord_id);
		ProductDTO product = new ProductDTO();

		for (OrderListDTO i : orderList) {
			product.setProduct_id(i.getProduct_id());
			product.setProduct_stock(i.getCart_amount());
			orderService.updateStock(product);
		}

		return "redirect:getAllOrderDetails.do?num=" + dto.getOrd_id();
	}

	@RequestMapping(value = "getOrderList.do", method = RequestMethod.GET)
	public String getOrderList(HttpSession session, OrderDTO dto, Model model) throws Exception {
		MemberDTO member = (MemberDTO) session.getAttribute("member");
		String member_id = member.getMember_id();
		dto.setMember_id(member_id);

		// 주문 목록 불러오기
		List<OrderDTO> orderList = orderService.getOrderList(dto);
		model.addAttribute("orderList", orderList);

		// 현 적립금 구하기
		int curMileage = orderService.getCurrentMileage(member_id);
		model.addAttribute("curMileage", curMileage);

		// 총 주문금액, 주문건수, 사용한 적립금 구하기
		List<OrderDTO> myinfoList = orderService.getMyPageInfo(member_id);
		model.addAttribute("myinfoList", myinfoList);

		return "order/getOrderList";
	}

	@RequestMapping(value = "getOrderDetails.do", method = RequestMethod.GET)
	public String getOrderDetails(HttpSession session, @RequestParam("num") String ord_id, OrderDTO dto, Model model)
			throws Exception {
		MemberDTO member = (MemberDTO) session.getAttribute("member");
		String member_id = member.getMember_id();

		// 상세주문 불러오기
		dto.setMember_id(member_id);
		dto.setOrd_id(ord_id);
		List<OrderListDTO> orderDetails = orderService.getOrderDetails(dto);
		model.addAttribute("orderDetails", orderDetails);

		return "order/getOrderDetails";
	}

	// 관리자
	// 주문 취소
	@RequestMapping(value = "deleteOrderAdmin.do", method = RequestMethod.POST)
	public String deleteOrderAdimn(OrderDTO dto, ProductDTO product, HttpSession session) throws Exception {

		// 적립금 환불
		orderService.refundMileage(dto);
		System.out.println("Controller - refundMileage");
		// 주문 취소
		orderService.deleteOrder(dto);
		System.out.println("Controller - deleteOrder");

		// 추후 수정?
		return "redirect:getAllOrders.do";

	}

	// 회원
	// 주문취소
	@RequestMapping(value = "deleteOrder.do", method = RequestMethod.POST)
	public String deleteOrder(OrderDTO dto, ProductDTO product, HttpSession session) throws Exception {

		// 적립금 환불
		orderService.refundMileage(dto);
		System.out.println("Controller - refundMileage");
		// 주문 취소
		orderService.deleteOrder(dto);
		System.out.println("Controller - deleteOrder");

		// 추후 수정?
		return "redirect:getOrderList.do";

	}

	// 장바구니
	// 아이템 추가
	@ResponseBody
	@RequestMapping(value = "addToCart.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String addToCart(@ModelAttribute CartDTO dto, HttpSession session) throws Exception {

		MemberDTO member = (MemberDTO) session.getAttribute("member");
		String member_id = member.getMember_id();
		dto.setMember_id(member_id);

		// 제품 번호 추출
		int product_id = dto.getProduct_id();
		// 해당 제품 장바구니 중복 여부 확인
		int count = orderService.countCart(product_id, member_id);

		// 회원일 경우만 장바구니 사용 가능
		if (member != null) {
			if (count == 0) {
				// 장바구니 추가
				orderService.addToCart(dto);
			} else {
				// 중복 제품일 경우 수량 합산
				orderService.checkOverlap(dto);
			}
		}

		return "redirect:getCartList.do";

	}

	// 장바구니 목록
	@ResponseBody
	@RequestMapping(value = "getCartList.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView getCartList(HttpSession session, ModelAndView mav) throws Exception {

		MemberDTO member = (MemberDTO) session.getAttribute("member");
		String member_id = member.getMember_id();

		// 회원ID에 해당하는 장바구니 목록 불러오기
		Map<String, Object> map = new HashMap<String, Object>();
		List<CartDTO> cartList = orderService.getCartList(member_id);

		// 배송비 여부 판단
		int sumTotal = orderService.getSum(member_id);
		int shippingFee = sumTotal >= 50000 ? 0 : 2500;

		// 정보 mav에 저장
		map.put("cartList", cartList);
		map.put("count", cartList.size());
		map.put("sumTotal", sumTotal);
		map.put("shippingFee", shippingFee);
		map.put("finalSum", sumTotal + shippingFee);
		mav.setViewName("order/getCartList");
		mav.addObject("map", map);
		return mav;

	}

	// 장바구니 수정
	@ResponseBody
	@RequestMapping(value = "updateCart.do", method = RequestMethod.POST)
	public String updateCart(@RequestParam int[] cart_amount, @RequestParam int[] product_id, HttpSession session)
			throws Exception {
		MemberDTO member = (MemberDTO) session.getAttribute("member");
		String member_id = member.getMember_id();

		// 장바구니 목록 중 정보 변경 여부 판단 후 장바구니 업데이트
		for (int i = 0; i < product_id.length; i++) {
			CartDTO dto = new CartDTO();
			dto.setMember_id(member_id);
			dto.setCart_amount(cart_amount[i]);
			dto.setProduct_id(product_id[i]);
			orderService.modifyCart(dto);
		}

		// redirect 작동 여부 재확인
		return "redirect:getCartList.do";
	}

	// 장바구니 삭제
	@ResponseBody
	@RequestMapping(value = "deleteCart.do", method = RequestMethod.POST)
	public String deleteCart(@RequestParam int cart_id) throws Exception {
		orderService.deleteCartId(cart_id);

		// redirect 작동 여부 재확인
		return "redirect:getCartList.do";
	}

}
