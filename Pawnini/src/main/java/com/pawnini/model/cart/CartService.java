package com.pawnini.model.cart;

import java.util.List;

import com.pawnini.model.order.CartDTO;
import com.pawnini.model.order.CartListDTO;

public interface CartService {
	
	public void addToCart(CartDTO dto) throws Exception;
	
	public List<CartListDTO> getCartList(String member_id) throws Exception;
	
	public void deleteCart(CartDTO dto) throws Exception;

}
