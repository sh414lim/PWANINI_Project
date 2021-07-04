package com.pawnini.view.review;

import java.io.File;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.pawnini.model.review.ReviewDTO;
import com.pawnini.model.review.ReviewLikeDTO;
import com.pawnini.model.review.ReviewService;
import com.pawnini.utils.UploadFileUtils;

@Controller
@SessionAttributes("review")
public class ReviewController {
	
	@Autowired
	private ReviewService reviewService;
	
	@Resource(name="uploadPath")
	private String uploadPath;
	
	//후기 등록
	@RequestMapping(value="/insertReview.do", method=RequestMethod.POST)
	public String insertReview(ReviewDTO dto, MultipartFile file) throws Exception {
		
		System.out.println("insertReview.do() 작동");
		
		//이미지 파일 첨부, 썸네일 경로 설정 
		String imgUploadPath = uploadPath + File.separator + "imgUpload";
		String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
		String fileName = null;

		if(file != null) {
		 fileName =  UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath); 
		} else {
		 fileName = uploadPath + File.separator + "images" + File.separator + "none.png";
		}

		dto.setRev_f_img(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
		dto.setRev_thumb_img(File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
		//후기 삽입
		reviewService.insertReview(dto);
		//제품별 평점 업데이트
		int product_id = dto.getProduct_id();
		reviewService.getAvgStars(product_id);

		//productDetail.do로 변경해야 함
		return "redirect:detailProduct.do?product_id="+product_id;
	}
	
	@ResponseBody
	@RequestMapping(value="/deleteReview.do", method=RequestMethod.POST)
	public String deleteReview(ReviewDTO dto) throws Exception {
		
		reviewService.deleteReview(dto);
		//제품별 평점 업데이트
		int product_id = dto.getProduct_id();
		reviewService.getAvgStars(product_id);
		
		return "redirect:detailProduct.do";
	}
	
	//좋아요
	@ResponseBody
	@RequestMapping("/reviewLike.do")
	public int reviewLike(HttpServletRequest req) throws Exception {
		int rev_id = Integer.parseInt(req.getParameter("rev_id"));
		String member_id = req.getParameter("member_id");
		
		ReviewLikeDTO revlikeDTO = new ReviewLikeDTO();
		
		revlikeDTO.setRev_id(rev_id);
		revlikeDTO.setMember_id(member_id);
		
		int like = reviewService.getReviewLike(revlikeDTO);
		
		System.out.println("like:" + like);
		if(like >= 1) {
			reviewService.deleteReviewLike(revlikeDTO);
			System.out.println("deleteReviewLike - Controller");
			like = 0;
		} else {
			reviewService.insertReviewLike(revlikeDTO);
			System.out.println("insertReviewLike - Controller");
			like = 1;
		}
		
		return like;
	}
	
	@ResponseBody
	@RequestMapping("/reviewLikeCount.do")
	public int reviewLikeCount(HttpServletRequest req) throws Exception {
		
		int rev_id = Integer.parseInt(req.getParameter("rev_id"));

		ReviewLikeDTO revLikeDTO = new ReviewLikeDTO();
		
		revLikeDTO.setRev_id(rev_id);
		
		int totalLike = reviewService.getReviewLikeTotal(revLikeDTO);
		System.out.println("totalLike: " + totalLike);
	
		return totalLike;
	}
	
}
