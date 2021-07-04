package com.pawnini.model.product;

import java.util.List;

public interface ProductService {

	//상품 등록
	void insertProduct(ProductDTO dto);
	
	//상품 수정
	void updateProduct(ProductDTO dto);
	
	//상품 삭제
	void deleteProduct(ProductDTO dto);
	
	//상품 리스트
	List<ProductDTO> getProductList(ProductSearchCriteria scri) throws Exception;
	
	//상품 랜덤 리스트 (이벤트)
	List<ProductDTO> getProductRand(ProductDTO dto) throws Exception;
	//상품 랜덤 리스트 (추천)
	List<ProductDTO> getProductMain(ProductDTO dto) throws Exception;
	//상품 랜덤 리스트 (세일)
	List<ProductDTO> getProductSale(ProductDTO dto) throws Exception;
	
	//상품 총 갯수
	int getCountProduct(ProductSearchCriteria scri) throws Exception;

	//상품 상세정보 조회
	ProductDTO getProduct(ProductDTO dto) throws Exception;
	
	//조회수 처리
	void productHits(ProductDTO dto);
	
	
	
}
