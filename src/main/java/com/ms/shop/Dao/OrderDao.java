package com.ms.shop.Dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.ms.shop.Vo.OrderVo;

@Repository("OrderDao")
public class OrderDao {
	
JdbcTemplate template;
	
	@Autowired
	public void setTemplate(JdbcTemplate template) {
		this.template = template;
	}
	
	@Autowired
	private SqlSession sqlSession;
	
	String Namespace = "com.ms.shop.Dao.OrderDao";
	
	public List<OrderVo> customerPurchaseList(String id) throws Exception {
		
		return sqlSession.selectList(Namespace + ".customerPurchaseList", id);
	}
	
	public List<OrderVo> brandPurchaseList(String brand) throws Exception {
		
		return sqlSession.selectList(Namespace + ".brandPurchaseList", brand);
	}
	
	public OrderVo havePick(OrderVo info) throws Exception {
		
		return sqlSession.selectOne(Namespace + ".havePick", info);
	}
	
	public List<OrderVo> customerPick(String id) throws Exception {
		
		return sqlSession.selectList(Namespace + ".customerPick", id);
	}
	
	public List<OrderVo> reviewList(OrderVo info) throws Exception{
		
		return sqlSession.selectList(Namespace + ".reviewList", info);
	}
	
	public void pick(OrderVo info) throws Exception {
		
		sqlSession.insert(Namespace + ".pick", info);
	}
	
	public void unpick(OrderVo info) throws Exception {
		
		sqlSession.delete(Namespace + ".unpick", info);
	}
	
	public void insertPurchase(OrderVo info) throws Exception {
		
		sqlSession.insert(Namespace + ".insertPurchase", info);
	}
	
	public void insertReivew(OrderVo info) throws Exception{
		
		sqlSession.insert(Namespace + ".insertReview", info);
	}
	
	public void handlingPurchase(int purchaseno) throws Exception {
		
		sqlSession.update(Namespace + ".handlingPurchase", purchaseno);
	}
}
