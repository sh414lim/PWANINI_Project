package com.pawnini.view.product;

import java.io.File;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.pawnini.model.product.PageMaker;
import com.pawnini.model.product.ProductDTO;
import com.pawnini.model.product.ProductSearchCriteria;
import com.pawnini.model.product.ProductService;
import com.pawnini.model.review.ReviewDTO;
import com.pawnini.model.review.ReviewService;
import com.pawnini.utils.UploadFileUtils;

@Controller
@SessionAttributes("product")
public class ProductController {

	@Autowired
	private ProductService service;
	
	@Autowired
	private ReviewService revService;
	
	@Resource(name="uploadPath")
	private String uploadPath;
	
	//관리자 상품등록 페이지 이동
	@RequestMapping(value="/goInsertProduct.do")
	public String goInsertProduct() {
		return "admin/product/insertProduct";
	}
	
	//상품등록 기능처리
	@RequestMapping(value="/insertProduct.do")
	public String insertProduct(ProductDTO dto, MultipartFile file) throws Exception{
		
		System.out.println("이미지 패스 설정 실행 전");
		
		String imgUploadPath = uploadPath + File.separator + "imgUpload";
		String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
		String fileName = null;

		if(file != null) {
		 fileName =  UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath); 
		} else {
		 fileName = uploadPath + File.separator + "images" + File.separator + "none.png";
		}

		dto.setProduct_img(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
		dto.setProduct_thumb_img(File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
		
		System.out.println("이미지 패스 설정 실행 완료");
		
		service.insertProduct(dto);
		return "redirect:getProductList.do";
	}
	
	// 상품 수정
	@RequestMapping(value="/updateProduct.do", method=RequestMethod.POST)
	public String updateProduct(ProductDTO dto,@ModelAttribute("scri") ProductSearchCriteria scri, MultipartFile file,
			RedirectAttributes rttr, HttpServletRequest req) throws Exception {
		
		// 새로운 파일이 등록되었는지 확인
		if(file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
		// 기존 파일을 삭제
		new File(uploadPath + req.getParameter("product_img")).delete();
		new File(uploadPath + req.getParameter("product_thumb_img")).delete();
		
		// 새로 첨부한 파일을 등록
		String imgUploadPath = uploadPath + File.separator + "imgUpload";
		String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
		String fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);
				  
		dto.setProduct_img(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
		dto.setProduct_thumb_img(File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
				  
		} else {  // 새로운 파일이 등록되지 않았다면
		// 기존 이미지를 그대로 사용
		dto.setProduct_img(req.getParameter("product_img"));
		dto.setProduct_thumb_img(req.getParameter("product_thumb_img"));
		}
		
		// 정보 업데이트
		service.updateProduct(dto);
		
		//Redirect w pager
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchOption());
		rttr.addAttribute("keyword", scri.getSearchKeyword());
		
		return "redirect:getProductList.do";
	}
	// 상품 수정
	@RequestMapping(value="/updateProduct.do", method=RequestMethod.GET)
	public String updateProduct(ProductDTO dto, Model model, @ModelAttribute("scri") ProductSearchCriteria scri) throws Exception {
		
		service.updateProduct(dto);
		model.addAttribute("scri",scri);
		return "redirect:getProductList.do";
	}
	
	// 삭제
	@RequestMapping(value="/deleteProduct.do")
	public String deleteProduct(ProductDTO dto, @ModelAttribute("scri") ProductSearchCriteria scri, RedirectAttributes rttr) {
		service.deleteProduct(dto);
		
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchOption());
		rttr.addAttribute("keyword", scri.getSearchKeyword());
		
		return "redirect:getProductList.do";
		
		
	}
	
	// 상품관리 리스트
	@RequestMapping(value="/getProductList.do")
	public String getProductList(@ModelAttribute("scri") ProductSearchCriteria scri, Model model) throws Exception {
		model.addAttribute("productList", service.getProductList(scri));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(service.getCountProduct(scri));
		model.addAttribute("pageMaker",pageMaker);

		return "admin/product/getProductList";
	}
	@RequestMapping("getProductRand.do")
	public String getProductRand(ProductDTO dto, Model model)throws Exception{
		model.addAttribute("productList", service.getProductRand(dto));
		return "event/event";
	}
	
	// 상품 페이지 이동
	@RequestMapping(value="/goProductList.do")
	public String goProductList(@ModelAttribute("scri") ProductSearchCriteria scri, Model model) throws Exception {
		model.addAttribute("productList", service.getProductList(scri));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(service.getCountProduct(scri));
		
		model.addAttribute("pageMaker",pageMaker);
		
		return "product/product";
	}
	
	
	/*@ResponseBody
	@RequestMapping(value="/detailProduct.do")
	public ModelAndView detailProduct(ProductDTO dto, ModelAndView mav, @ModelAttribute("scri") ProductSearchCriteria scri, ReviewDTO review, HttpSession session) throws Exception{
		
		
		//후기 좋아요
		String member_id = ((MemberDTO) session.getAttribute("member")).getMember_id();
		int rev_id = review.getRev_id();
		
		ReviewLikeDTO likeDTO = new ReviewLikeDTO();
		
		likeDTO.setRev_id(rev_id);
		likeDTO.setMember_id(member_id);
		
		int reviewLike = revService.getReviewLike(likeDTO);
		System.out.println("getReviewLike : " + reviewLike);
		
		//3.저장
		Map<String, Object> map = new HashMap<String, Object>();
		
		service.productHits(dto);
		map.put("product", service.getProduct(dto));
		map.put("scri", scri);
		map.put("review", revService.getReviews(review));
		map.put("like", reviewLike);
		mav.setViewName("product/detail");
		mav.addObject("map", map);
		
		
		return mav;
	}*/
	@RequestMapping(value="/detailProduct.do")
	public String detailProduct(ProductDTO dto, Model model, 
			@ModelAttribute("scri") ProductSearchCriteria scri,
			ReviewDTO review, HttpSession session) throws Exception{
		// 조회수 처리
		service.productHits(dto);
		// 상품 상세정보 저장
		model.addAttribute("product", service.getProduct(dto));
		// Pager 추가
		model.addAttribute("scri", scri);
		
		model.addAttribute("review",revService.getReviews(review));
		
		return "product/detail";
	}
	
	
	// 상품 업데이트 폼 이동
	@RequestMapping(value="/getProduct.do")
	public String getProduct(ProductDTO dto, Model model) throws Exception {
		model.addAttribute("product",service.getProduct(dto));
		return "admin/product/updateProduct";
	}

}











