package com.ms.shop.Dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.ms.shop.Vo.ProductVo;
import com.ms.shop.Vo.UserVo;

@Repository
public class ShopDao implements IShopDao {

	JdbcTemplate template;
	
	@Autowired
	public void setTemplate(JdbcTemplate template) {
		this.template = template;
	}
	
	@Autowired
	private SqlSession sqlSession;
	
	private String Namespace = "com.ms.shop.Dao.IShopDao";

	@Override
	public List<UserVo> loginCheck(String id) throws Exception {
		
		return sqlSession.selectList(Namespace + ".loginCheck", id);
	}

	@Override
	public void signUp(UserVo user) throws Exception {
		
		sqlSession.insert(Namespace + ".signUp", user);
	}

	@Override
	public List<ProductVo> productList() throws Exception {
		
		return sqlSession.selectList(Namespace + ".productList");
	}

	@Override
	public void productRegister(ProductVo product) throws Exception {
		
		sqlSession.insert(Namespace + ".productRegister", product);
	}
}
