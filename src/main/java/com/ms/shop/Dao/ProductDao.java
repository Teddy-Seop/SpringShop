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
public class ProductDao {

	JdbcTemplate template;
	
	@Autowired
	public void setTemplate(JdbcTemplate template) {
		this.template = template;
	}
	
	@Autowired
	private SqlSession sqlSession;
	
	private String Namespace = "com.ms.shop.Dao.IProductDao";

	public List<ProductVo> productList() throws Exception {
		
		return sqlSession.selectList(Namespace + ".productList");
	}

	public List<ProductVo> productListGender(ProductVo info) throws Exception {
		
		return sqlSession.selectList(Namespace + ".productListGender", info);
	}
	
	public List<ProductVo> productListCategory(ProductVo info) throws Exception {
		
		return sqlSession.selectList(Namespace + ".productListCategory", info);
	}
	
	public ProductVo productDetail(int no) throws Exception {
		
		return sqlSession.selectOne(Namespace + ".productDetail", no);
	}
	
	public List<ProductVo> productSearch(String keyword) throws Exception {
		
		return sqlSession.selectList(Namespace + ".productSearch", keyword);
	}
	
	public List<ProductVo> productRank() throws Exception {
		
		return sqlSession.selectList(Namespace + ".productRank");
	}
	
	public List<ProductVo> productNew() throws Exception {
		
		return sqlSession.selectList(Namespace + ".productNew");
	}
	
	public void productRegister(ProductVo product) throws Exception {
		
		sqlSession.insert(Namespace + ".productRegister", product);
	}

	public List<ProductVo> managementList(String brand) throws Exception {
		
		return sqlSession.selectList(Namespace + ".managementList", brand);
	}

	public void productManagement(Map<String, Integer> map) throws Exception {
		
		sqlSession.update(Namespace + ".productManagement", map);
	}

	public void productStock(int no) throws Exception {
		
		sqlSession.update(Namespace + ".productStock", no);
	}

	public void productDelete(int no) throws Exception {
		
		sqlSession.delete(Namespace + ".productDelete", no);
	}
}
