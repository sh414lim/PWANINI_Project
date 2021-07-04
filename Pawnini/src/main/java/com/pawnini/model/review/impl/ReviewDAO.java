package com.pawnini.model.review.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pawnini.model.review.ReviewDTO;
import com.pawnini.model.review.ReviewLikeDTO;

@Repository
public class ReviewDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	//후기 등록
	public void insertReview(ReviewDTO dto) throws Exception {
		System.out.println(dto.toString());
		mybatis.insert("ReviewDAO.insertReview", dto);
		System.out.println("Mybatis/insertReview() 기능처리 완료");
	}
	
	//후기 목록
	public List<ReviewDTO> getReviews(ReviewDTO dto) throws Exception {
		System.out.println("Mybatis/getReviews() 기능처리 완료");
		return mybatis.selectList("ReviewDAO.getReviews", dto);
	}
	
	//후기 삭제
	public void deleteReview(ReviewDTO dto) throws Exception {
		System.out.println("Mybatis/deleteReview() 기능처리 완료");
		mybatis.delete("ReviewDAO.deleteReview", dto);
	}
	
	//상품별 평균 별점
	public void getAvgStars(int product_id) throws Exception {
		mybatis.update("ReviewDAO.getAvgStars", product_id);
	}

	//후기 좋아요 생성
	public void insertReviewLike(ReviewLikeDTO reviewLikeDTO) throws Exception{
		System.out.println("Mybatis/insertReviewLike() 기능처리");
		mybatis.insert("ReviewDAO.insertReviewLike", reviewLikeDTO);
	}
	
	//후기 좋아요 삭제
	public void deleteReviewLike(ReviewLikeDTO reviewLikeDTO) throws Exception{
		System.out.println("Mybatis/deleteReviewLike() 기능처리");
		mybatis.delete("ReviewDAO.deleteReviewLike", reviewLikeDTO);
	}
	
	//후기 좋아요 업데이트 (변수 타입 확인!!!!!)
	public void updateReviewLike(int rev_id) throws Exception{
		System.out.println("Mybatis/updateReviewLike() 기능처리");
		mybatis.update("ReviewDAO.updateReviewLike", rev_id);
	}
		
	//후기 좋아요 개수 구하기 (ID 중복 방지용)
	public int getReviewLike(ReviewLikeDTO reviewLikeDTO) throws Exception{
		System.out.println("Mybatis/getReviewLike() 기능처리");
		return mybatis.selectOne("ReviewDAO.getReviewLike", reviewLikeDTO);
	}
	
	//후기 좋아요 개수 구하기 (ID 중복 방지용)
	public int getReviewLikeTotal(ReviewLikeDTO reviewLikeDTO) throws Exception{
		System.out.println("Mybatis/getReviewLikeTotal() 기능처리");
		return mybatis.selectOne("ReviewDAO.getReviewLikeTotal", reviewLikeDTO);
	}

}
