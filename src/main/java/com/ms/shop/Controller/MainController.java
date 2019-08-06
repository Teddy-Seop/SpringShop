package com.ms.shop.Controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ms.shop.Dao.OrderDao;
import com.ms.shop.Dao.ProductDao;
import com.ms.shop.Dao.UserDao;
import com.ms.shop.Vo.OrderVo;
import com.ms.shop.Vo.ProductVo;
import com.ms.shop.Vo.UserVo;

@Controller
public class MainController {

	ProductDao productDao;
	UserDao userDao;
	OrderDao orderDao;
	
	@Autowired
	public void setDao(ProductDao dao) {
		this.productDao = dao;
	}
	
	@Autowired
	public void setDao(UserDao dao) {
		this.userDao = dao;
	}
	
	@Autowired
	public void setDao(OrderDao dao) {
		this.orderDao = dao;
	}
	
	//초기 페이지
	@RequestMapping("/")
	public String index() {
		
		return "index";
	}
	
	//로그인 페이지
	@RequestMapping("/SignIn")
	public String SignIn(Model model, HttpServletRequest request) throws Exception {
		
		return "SignIn";
	}
	
	//로그인 처리
	@RequestMapping("/SignInProcessing")
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
		
		userDao.signUp(user);
		
		return "redirect:SignIn";
	}
	
	//메인 페이지
	@RequestMapping("/Main")
	public String Main(Model model, HttpSession session) throws Exception {
		
		if(session.getAttribute("login") != null) {
			
			//제품 출력
			List<ProductVo> productList = productDao.productList();
			model.addAttribute("productList", productList);
			return "Main";
		}
		
		return "err";
	}
	
	//성별별 리스트
	@RequestMapping("/list/{gender}")
	public String list(Model model, HttpSession session, @PathVariable String gender) throws Exception{
		
		if(session.getAttribute("login") != null) {
			
			//제품 출력
			List<ProductVo> productList = productDao.productListGender(gender);
			model.addAttribute("productList", productList);
			
			return "list";
		}
		return "err";
	}
	
	//상품 상세보기 페이지
	@RequestMapping("/detail/{no}")
	public String detail(Model model, HttpSession session, @PathVariable int no) throws Exception{
		
		if(session.getAttribute("login") != null) {
			
			//제품 출력
			ProductVo product = productDao.productDetail(no);
			model.addAttribute("product", product);
			
			return "detail";
		}
		return "err";
	}
	
	//구매 페이지
	@RequestMapping("/detail/{no}/purchase")
	public String purchase(Model model, HttpSession session, @PathVariable int no) throws Exception{
		
		if(session.getAttribute("login") != null) {
			
			//제품 정보
			ProductVo product = productDao.productDetail(no);
			model.addAttribute("product", product);
			
			//사용자 정보
			List<UserVo> user = userDao.userInfo((String)session.getAttribute("login"));
			model.addAttribute("user", user.get(0));
			
			return "purchase";
		}
		return "err";
	}
	
	//구매 처리
	@RequestMapping("/detail/{no}/purchaseProcessing")
	public String purchaseProcessing(Model model, HttpSession session, HttpServletRequest request, @PathVariable int no) throws Exception{
		
		if(session.getAttribute("login") != null) {
			
			String brand = request.getParameter("brand");
			String id = request.getParameter("id");
			String address = request.getParameter("address");
			String phone = request.getParameter("phone");
			
			//구매목록에 추가
			OrderVo info = new OrderVo();
			info.setBrand(brand);
			info.setNo(no);
			info.setId(id);
			info.setAddress(address);
			info.setPhone(phone);
			
			orderDao.insertPurchase(info);
			
			//상품 수량 변경
			productDao.productStock(no);
			
			//상품의 수량이 0이 되었을 때 status off
			if(productDao.productDetail(no).getStock() == 0) {
				
				Map map = new HashMap();
				map.put("status", 0);
				map.put("no", no);
				
				productDao.productManagement(map);
			}
			
			return "redirect:/Main";
		}
		return "err";
	}
}
