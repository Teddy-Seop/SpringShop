package com.ms.shop.Controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ms.shop.Dao.UserDao;
import com.ms.shop.Vo.UserVo;

@Controller
public class UserController {

	UserDao userDao;
	
	@Autowired
	public void setDao(UserDao dao) {
		this.userDao = dao;
	}
	
	//로그인 페이지
	@RequestMapping(value="/SignIn", method=RequestMethod.GET)
	public String SignIn(Model model, HttpServletRequest request) throws Exception {
		
		return "SignIn";
	}
	
	//로그인 처리
	@RequestMapping(value="/SignIn", method=RequestMethod.POST)
	public String SignInProcessing(Model model, HttpServletRequest request, HttpSession session) throws Exception {
		
		String u_id = request.getParameter("id");
		String u_pw = request.getParameter("pw");

		List<UserVo> user = userDao.loginCheck(u_id);
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
		
	//카카오 로그인
	@RequestMapping("/kakaoLogin/{id:.+}")
	public String kakaoLogin(Model model, HttpSession session, @PathVariable String id) throws Exception {
			
		UserVo user = userDao.kakaoUser(id);
		if(user != null) { //카카오 계정으로 가입이 되어있을때
				
			session.setAttribute("login", id);
			return "redirect:/Main";
		}else { //카카오 계정으로 가입이 되어있지 않을때
				
			return "redirect:/kakaoSignUp/" + id;
		}
	}
		
	//카카오 회원가입
	@RequestMapping(value="/kakaoSignUp/{id:.+}", method=RequestMethod.GET)
	public String kakaoSignUp(Model model, @PathVariable String id) throws Exception{
			
		model.addAttribute("id", id);
			
		return "kakaoSignUp";
	}
		
	//카카오 회원가입 처리
	@RequestMapping(value="/kakaoSignUp/{id:.+}", method=RequestMethod.POST)
	public String kakaoSignUpProcessing(Model model, HttpServletRequest request) throws Exception{
			
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		
		UserVo user = new UserVo();
		user.setId(id);
		user.setName(name);
		user.setPhone(phone);
		user.setAddress(address);
		
		userDao.kakaoSignUp(user);
		
		return "redirect:/SignIn";
	}
		
	//회원가입 페이지
	@RequestMapping(value="/SignUp", method=RequestMethod.GET)
	public String SignUp(Model model) throws Exception {
			
		return "SignUp";
	}
		
	//회원가입 처리
	@RequestMapping(value="/SignUp", method=RequestMethod.POST)
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
			
		userDao.signUp(user);
			
		return "redirect:SignIn";
	}
		
	//로그아웃
	@RequestMapping("/logout")
	public String logout(Model model, HttpSession session) throws Exception {
			
		if(session.getAttribute("login") != null) {
			
			session.removeAttribute("login");
			
			return "redirect:/";
		}
		
		return "err";
	}
}
