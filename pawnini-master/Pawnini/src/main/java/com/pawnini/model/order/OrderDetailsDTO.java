package com.pawnini.model.order;

public class OrderDetailsDTO {
	private int ord_d_id;
	private String ord_id;
	private int product_id;
	private int cart_amount;
	private String member_id;
	
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public int getOrd_d_id() {
		return ord_d_id;
	}
	public void setOrd_d_id(int ord_d_id) {
		this.ord_d_id = ord_d_id;
	}
	public String getOrd_id() {
		return ord_id;
	}
	public void setOrd_id(String ord_id) {
		this.ord_id = ord_id;
	}
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public int getCart_amount() {
		return cart_amount;
	}
	public void setCart_amount(int cart_amount) {
		this.cart_amount = cart_amount;
	}
	@Override
	public String toString() {
		return "OrderDetailsDTO [ord_d_id=" + ord_d_id + ", ord_id=" + ord_id + ", product_id=" + product_id
				+ ", cart_amount=" + cart_amount + "]";
	}
	
}
