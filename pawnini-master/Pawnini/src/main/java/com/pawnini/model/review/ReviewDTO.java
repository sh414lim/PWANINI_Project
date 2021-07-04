package com.pawnini.model.review;

import java.sql.Date;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
// 후기 DB 컬럼
@XmlAccessorType(XmlAccessType.FIELD)
public class ReviewDTO {
	private int rev_id;
	private String rev_writer;
	private String rev_content;
	private Date rev_date;
	private int rev_like_cnt;
	private int rev_stars;
	private String rev_f_img;
	private String rev_thumb_img;
	private String member_id;
	private int product_id;
	public int getRev_id() {
		return rev_id;
	}
	public void setRev_id(int rev_id) {
		this.rev_id = rev_id;
	}
	public String getRev_writer() {
		return rev_writer;
	}
	public void setRev_writer(String rev_writer) {
		this.rev_writer = rev_writer;
	}
	public String getRev_content() {
		return rev_content;
	}
	public void setRev_content(String rev_content) {
		this.rev_content = rev_content;
	}
	public Date getRev_date() {
		return rev_date;
	}
	public void setRev_date(Date rev_date) {
		this.rev_date = rev_date;
	}
	public int getRev_like_cnt() {
		return rev_like_cnt;
	}
	public void setRev_like_cnt(int rev_like_cnt) {
		this.rev_like_cnt = rev_like_cnt;
	}
	public int getRev_stars() {
		return rev_stars;
	}
	public void setRev_stars(int rev_stars) {
		this.rev_stars = rev_stars;
	}
	public String getRev_f_img() {
		return rev_f_img;
	}
	public void setRev_f_img(String rev_f_img) {
		this.rev_f_img = rev_f_img;
	}
	public String getRev_thumb_img() {
		return rev_thumb_img;
	}
	public void setRev_thumb_img(String rev_thumb_img) {
		this.rev_thumb_img = rev_thumb_img;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	@Override
	public String toString() {
		return "ReviewDTO [rev_id=" + rev_id + ", rev_writer=" + rev_writer + ", rev_content=" + rev_content
				+ ", rev_date=" + rev_date + ", rev_like_cnt=" + rev_like_cnt + ", rev_stars=" + rev_stars
				+ ", rev_f_img=" + rev_f_img + ", rev_thumb_img=" + rev_thumb_img + ", member_id=" + member_id
				+ ", product_id=" + product_id + "]";
	}
	
}
