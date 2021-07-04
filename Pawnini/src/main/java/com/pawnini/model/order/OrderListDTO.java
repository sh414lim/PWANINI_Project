package com.pawnini.model.order;

import java.sql.Date;

public class OrderListDTO {
	// Ord table
	private String ord_id;
	private String member_id;
	private String recipient_name;
	private String ord_postcode;
	private String ord_f_addr;
	private String ord_s_addr;
	private String ord_email;
	private String ord_phone;
	private Date ord_date;
	private int ord_total;
	private String ord_status;
	private String ord_card_info1;
	private int ord_used_mileage;
	private String ord_req_msg;
	private int cart_total;
	
	//Ord_details table
	private int ord_d_id;
	private int product_id;
	private int cart_amount;
	
	//Product table
	private String product_name;
	private String product_thumb_img;
	private int product_price;
	
	//etc
	private String fav_item_name;
	private int fav_item_qty;
	
	public String getOrd_id() {
		return ord_id;
	}
	public void setOrd_id(String ord_id) {
		this.ord_id = ord_id;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getRecipient_name() {
		return recipient_name;
	}
	public void setRecipient_name(String recipient_name) {
		this.recipient_name = recipient_name;
	}
	public String getOrd_postcode() {
		return ord_postcode;
	}
	public void setOrd_postcode(String ord_postcode) {
		this.ord_postcode = ord_postcode;
	}
	public String getOrd_f_addr() {
		return ord_f_addr;
	}
	public void setOrd_f_addr(String ord_f_addr) {
		this.ord_f_addr = ord_f_addr;
	}
	public String getOrd_s_addr() {
		return ord_s_addr;
	}
	public void setOrd_s_addr(String ord_s_addr) {
		this.ord_s_addr = ord_s_addr;
	}
	public String getOrd_phone() {
		return ord_phone;
	}
	public void setOrd_phone(String ord_phone) {
		this.ord_phone = ord_phone;
	}
	public Date getOrd_date() {
		return ord_date;
	}
	public void setOrd_date(Date ord_date) {
		this.ord_date = ord_date;
	}
	public int getOrd_d_id() {
		return ord_d_id;
	}
	public void setOrd_d_id(int ord_d_id) {
		this.ord_d_id = ord_d_id;
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
	public int getOrd_total() {
		return ord_total;
	}
	public void setOrd_total(int ord_total) {
		this.ord_total = ord_total;
	}
	public String getOrd_email() {
		return ord_email;
	}
	public void setOrd_email(String ord_email) {
		this.ord_email = ord_email;
	}
	public String getOrd_status() {
		return ord_status;
	}
	public void setOrd_status(String ord_status) {
		this.ord_status = ord_status;
	}
	public String getOrd_card_info1() {
		return ord_card_info1;
	}
	public void setOrd_card_info1(String ord_card_info1) {
		this.ord_card_info1 = ord_card_info1;
	}
	public int getOrd_used_mileage() {
		return ord_used_mileage;
	}
	public void setOrd_used_mileage(int ord_used_mileage) {
		this.ord_used_mileage = ord_used_mileage;
	}
	public String getOrd_req_msg() {
		return ord_req_msg;
	}
	public void setOrd_req_msg(String ord_req_msg) {
		this.ord_req_msg = ord_req_msg;
	}
	public int getCart_total() {
		return cart_total;
	}
	public void setCart_total(int cart_total) {
		this.cart_total = cart_total;
	}
	public String getFav_item_name() {
		return fav_item_name;
	}
	public void setFav_item_name(String fav_item_name) {
		this.fav_item_name = fav_item_name;
	}
	public int getFav_item_qty() {
		return fav_item_qty;
	}
	public void setFav_item_qty(int fav_item_qty) {
		this.fav_item_qty = fav_item_qty;
	}
	@Override
	public String toString() {
		return "OrderListDTO [ord_id=" + ord_id + ", member_id=" + member_id + ", recipient_name=" + recipient_name
				+ ", ord_postcode=" + ord_postcode + ", ord_f_addr=" + ord_f_addr + ", ord_s_addr=" + ord_s_addr
				+ ", ord_email=" + ord_email + ", ord_phone=" + ord_phone + ", ord_date=" + ord_date + ", ord_total="
				+ ord_total + ", ord_status=" + ord_status + ", ord_card_info1=" + ord_card_info1
				+ ", ord_used_mileage=" + ord_used_mileage + ", ord_req_msg=" + ord_req_msg + ", cart_total="
				+ cart_total + ", ord_d_id=" + ord_d_id + ", product_id=" + product_id + ", cart_amount=" + cart_amount
				+ ", product_name=" + product_name + ", product_thumb_img=" + product_thumb_img + ", product_price="
				+ product_price + ", fav_item_name=" + fav_item_name + ", fav_item_qty=" + fav_item_qty + "]";
	}
	
	
	
}
