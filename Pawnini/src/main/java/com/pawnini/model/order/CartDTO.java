package com.pawnini.model.order;

public class CartDTO {
	// Cart table
	private int cart_id;
	private int cart_amount;
	private int product_id;
	private String member_id;
	
	// Product table
	private String product_name;
	private String product_thumb_img;
	private int product_price;
	
	// Member table
	private int member_mileage;
	

	// cart_amount * product_price
	private int cart_total;

	public int getMember_mileage() {
		return member_mileage;
	}
	
	public void setMember_mileage(int member_mileage) {
		this.member_mileage = member_mileage;
	}
	public int getCart_id() {
		return cart_id;
	}

	public void setCart_id(int cart_id) {
		this.cart_id = cart_id;
	}

	public int getCart_amount() {
		return cart_amount;
	}

	public void setCart_amount(int cart_amount) {
		this.cart_amount = cart_amount;
	}

	public int getProduct_id() {
		return product_id;
	}

	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public String getProduct_thumb_img() {
		return product_thumb_img;
	}

	public void setProduct_thumb_img(String product_thumb_img) {
		this.product_thumb_img = product_thumb_img;
	}

	public int getProduct_price() {
		return product_price;
	}

	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}

	public int getCart_total() {
		return cart_total;
	}

	public void setCart_total(int cart_total) {
		this.cart_total = cart_total;
	}

	@Override
	public String toString() {
		return "CartDTO [cart_id=" + cart_id + ", cart_amount=" + cart_amount + ", product_id=" + product_id
				+ ", member_id=" + member_id + ", product_name=" + product_name + ", product_thumb_img="
				+ product_thumb_img + ", product_price=" + product_price + ", cart_total=" + cart_total + "]";
	}
	
	
	
}
