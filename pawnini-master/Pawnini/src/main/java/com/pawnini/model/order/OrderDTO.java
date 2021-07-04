package com.pawnini.model.order;

import java.sql.Date;

public class OrderDTO {
	private String ord_id;
	private String recipient_name;
	private Date ord_date;
	private String ord_postcode;
	private String ord_f_addr;
	private String ord_s_addr;
	private String ord_phone;
	private String ord_email;
	private String member_id;
	private int ord_total;
	private String ord_req_msg;
	private String ord_card_info1;
	private String ord_card_info2;
	private int ord_used_mileage;
	private int mileage_status;
	private String ord_status;
	private int ord_total2;
	private int ord_used_mileage2;
	private int ord_num;
	private String ord_sales;
	private String ord_cnt;

	
	
	public String getOrd_sales() {
		return ord_sales;
	}
	public void setOrd_sales(String ord_sales) {
		this.ord_sales = ord_sales;
	}
	public String getOrd_cnt() {
		return ord_cnt;
	}
	public void setOrd_cnt(String ord_cnt) {
		this.ord_cnt = ord_cnt;
	}
	public String getOrd_id() {
		return ord_id;
	}
	public void setOrd_id(String ord_id) {
		this.ord_id = ord_id;
	}
	public String getRecipient_name() {
		return recipient_name;
	}
	public void setRecipient_name(String recipient_name) {
		this.recipient_name = recipient_name;
	}
	public Date getOrd_date() {
		return ord_date;
	}
	public void setOrd_date(Date ord_date) {
		this.ord_date = ord_date;
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
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
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
	public String getOrd_req_msg() {
		return ord_req_msg;
	}
	public void setOrd_req_msg(String ord_req_msg) {
		this.ord_req_msg = ord_req_msg;
	}
	public String getOrd_card_info1() {
		return ord_card_info1;
	}
	public void setOrd_card_info1(String ord_card_info1) {
		this.ord_card_info1 = ord_card_info1;
	}
	public String getOrd_card_info2() {
		return ord_card_info2;
	}
	public void setOrd_card_info2(String ord_card_info2) {
		this.ord_card_info2 = ord_card_info2;
	}
	public int getOrd_used_mileage() {
		return ord_used_mileage;
	}
	public void setOrd_used_mileage(int ord_used_mileage) {
		this.ord_used_mileage = ord_used_mileage;
	}
	public int getMileage_status() {
		return mileage_status;
	}
	public void setMileage_status(int mileage_status) {
		this.mileage_status = mileage_status;
	}
	public String getOrd_status() {
		return ord_status;
	}
	public void setOrd_status(String ord_status) {
		this.ord_status = ord_status;
	}
	public int getOrd_total2() {
		return ord_total2;
	}
	public void setOrd_total2(int ord_total2) {
		this.ord_total2 = ord_total2;
	}
	public int getOrd_used_mileage2() {
		return ord_used_mileage2;
	}
	public void setOrd_used_mileage2(int ord_used_mileage2) {
		this.ord_used_mileage2 = ord_used_mileage2;
	}
	public int getOrd_num() {
		return ord_num;
	}
	public void setOrd_num(int ord_num) {
		this.ord_num = ord_num;
	}
	@Override
	public String toString() {
		return "OrderDTO [ord_id=" + ord_id + ", recipient_name=" + recipient_name + ", ord_date=" + ord_date
				+ ", ord_postcode=" + ord_postcode + ", ord_f_addr=" + ord_f_addr + ", ord_s_addr=" + ord_s_addr
				+ ", ord_phone=" + ord_phone + ", ord_email=" + ord_email + ", member_id=" + member_id + ", ord_total="
				+ ord_total + ", ord_req_msg=" + ord_req_msg + ", ord_card_info1=" + ord_card_info1
				+ ", ord_card_info2=" + ord_card_info2 + ", ord_used_mileage=" + ord_used_mileage + ", mileage_status="
				+ mileage_status + ", ord_status=" + ord_status + ", ord_total2=" + ord_total2 + ", ord_used_mileage2="
				+ ord_used_mileage2 + ", ord_num=" + ord_num + "]";
	}
}
