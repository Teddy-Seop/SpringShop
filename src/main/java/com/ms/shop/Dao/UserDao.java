package com.ms.shop.Dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.ms.shop.Vo.UserVo;

@Repository("UserDao")
public class UserDao {

	JdbcTemplate template;
	
	@Autowired
	public void setTemplate(JdbcTemplate template) {
		this.template = template;
	}
	
	@Autowired
	private SqlSession sqlSession;
	
	private String Namespace = "com.ms.shop.Dao.UserDao";

	public List<UserVo> loginCheck(String id) throws Exception {
		
		return sqlSession.selectList(Namespace + ".loginCheck", id);
	}

	public void signUp(UserVo user) throws Exception {
		
		sqlSession.insert(Namespace + ".signUp", user);
	}
	
	public List<UserVo> userInfo(String id) throws Exception {
		
		return sqlSession.selectList(Namespace + ".userInfo", id);
	}
	
	public UserVo kakaoUser(String id) throws Exception {
		
		return sqlSession.selectOne(Namespace + ".kakaoUser", id);
	}
	
	public void kakaoSignUp(UserVo user) throws Exception {
		
		sqlSession.insert(Namespace + ".kakaoSignUp", user);
	} 
}
