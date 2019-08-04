package com.ms.shop.Dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.ms.shop.Vo.ProductVo;
import com.ms.shop.Vo.UserVo;

@Repository("ProductDao")
public class ProductDao implements IProductDao {

	JdbcTemplate template;
	
	@Autowired
	public void setTemplate(JdbcTemplate template) {
		this.template = template;
	}
	
	@Autowired
	private SqlSession sqlSession;
	
	private String Namespace = "com.ms.shop.Dao.IProductDao";

	@Override
	public List<ProductVo> productList() throws Exception {
		
		return sqlSession.selectList(Namespace + ".productList");
	}

	@Override
	public List<ProductVo> productListGender(String gender) throws Exception {
		
		return sqlSession.selectList(Namespace + ".productListGender", gender);
	}
	
	@Override
	public List<ProductVo> productDetail(int no) throws Exception {
		
		return sqlSession.selectList(Namespace + ".productDetail", no);
	}
	
	@Override
	public void productRegister(ProductVo product) throws Exception {
		
		sqlSession.insert(Namespace + ".productRegister", product);
	}

	@Override
	public List<ProductVo> managementList(String brand) throws Exception {
		
		return sqlSession.selectList(Namespace + ".managementList", brand);
	}

	@Override
	public void productManagement(Map<String, String> map) throws Exception {
		
		sqlSession.update(Namespace + ".productManagement", map);
	}
}
