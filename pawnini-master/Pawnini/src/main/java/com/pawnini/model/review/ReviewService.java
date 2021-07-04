package com.pawnini.model.review;
import java.util.List;


public interface ReviewService {
	//후기 등록
	public void insertReview(ReviewDTO dto) throws Exception;
	
	//후기 목록
	public List<ReviewDTO> getReviews(ReviewDTO dto) throws Exception;
	
	//후기 삭제
	public void deleteReview(ReviewDTO dto) throws Exception;
	
	// 상품별 평균 별점
	public void getAvgStars(int product_id) throws Exception;
	
	//후기 좋아요 생성
	public void insertReviewLike(ReviewLikeDTO reviewLikeDTO) throws Exception;

	//후기 좋아요 삭제
	public void deleteReviewLike(ReviewLikeDTO reviewLikeDTO) throws Exception;
		
	//후기 좋아요 개수 구하기 (ID 중복 방지용)
	public int getReviewLike(ReviewLikeDTO reviewLikeDTO) throws Exception;
	
	//후기 좋아요 총 개수 구하기
	public int getReviewLikeTotal(ReviewLikeDTO reviewLikeDTO) throws Exception;
	
	
}
