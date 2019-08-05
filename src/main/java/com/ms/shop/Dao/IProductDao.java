package com.ms.shop.Dao;

import java.util.List;
import java.util.Map;

import com.ms.shop.Vo.ProductVo;
import com.ms.shop.Vo.UserVo;

public interface IProductDao {

	public List<ProductVo> productList() throws Exception;
	public List<ProductVo> productListGender(String gender) throws Exception;
	public ProductVo productDetail(int no) throws Exception;
	public void productRegister(ProductVo product) throws Exception;
	public List<ProductVo> managementList(String brand) throws Exception;
	public void productManagement(Map<String, String> map) throws Exception;
	public void productStock(int no) throws Exception;
}
