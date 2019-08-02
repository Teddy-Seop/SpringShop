package com.ms.shop.Controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ms.shop.Dao.ShopDao;
import com.ms.shop.Vo.ProductVo;
import com.ms.shop.Vo.UserVo;

@Controller
public class MainController {

	ShopDao shopDao;
	
	@Autowired
	public void setDao(ShopDao dao) {
		this.shopDao = dao;
	}
	
	//초기 페이지
	@RequestMapping("/")
	public String index() {
		
		return "index";
	}
	
	//로그인 페이지
	@RequestMapping("/SignIn")
	public String SignIn(Model model, HttpServletRequest request) {
		
		return "SignIn";
	}
	
	//로그인 처리
	@RequestMapping("/SignInProcessing")
	public String SignInProcessing(Model model, HttpServletRequest request, HttpSession session) throws Exception {
		
		String u_id = request.getParameter("id");
		String u_pw = request.getParameter("pw");

		List<UserVo> user = shopDao.loginCheck(u_id);
		String id = user.get(0).getId();
		String pw = user.get(0).getPw();
		int power = user.get(0).getPower();
		
		if(u_id.equals(id) && u_pw.equals(pw)) {
			
			session.setAttribute("login", u_id);
			
			if(power == 1) {
				return "redirect:Main";
			}else if(power == 2) {
				return "redirect:seller";
			}
		}
		return "err";
	}
	
	//회원가입 페이지
	@RequestMapping("/SignUp")
	public String SignUp(Model model) throws Exception {
		
		return "SignUp";
	}
	
	//회원가입 처리
	@RequestMapping("/SignUpProcessing")
	public String SignUpProcessing(Model model, HttpServletRequest request) throws Exception {
			
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		int power = 1;
			
		UserVo user = new UserVo();
		user.setId(id);
		user.setPw(pw);
		user.setName(name);
		user.setPhone(phone);
		user.setAddress(address);
		user.setPower(power);
			
		shopDao.signUp(user);
			
		return "redirect:SignIn";
	}
	
	//메인 페이지
	@RequestMapping("/Main")
	public String Main(Model model, HttpSession session) throws Exception {
		
		if(session.getAttribute("login") != null) {
			
			//제품 출력
			List<ProductVo> productList = shopDao.productList();
			model.addAttribute("productList", productList);
			return "Main";
		}
		
		return "err";
	}
}
