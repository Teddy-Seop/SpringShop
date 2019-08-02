package com.ms.shop.Dao;

import java.util.List;

import com.ms.shop.Vo.ProductVo;
import com.ms.shop.Vo.UserVo;

public interface IShopDao {
	
	public List<UserVo> loginCheck(String id) throws Exception;
	public void signUp(UserVo user) throws Exception;
	public List<ProductVo> productList() throws Exception;
	public void productRegister(ProductVo product) throws Exception;
}
