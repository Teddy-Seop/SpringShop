package com.ms.shop.Controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	@RequestMapping("/kakaoSignUp/{id:.+}")
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
	
	//로그아웃
	@RequestMapping("/logout")
	public String logout(Model model, HttpSession session) throws Exception {
		
		if(session.getAttribute("login") != null) {
			
			session.removeAttribute("login");
			
			return "redirect:/";
		}
		
		return "err";
	}
	
	//메인 페이지
	@RequestMapping("/Main")
	public String Main(Model model, HttpSession session) throws Exception {
		
		if(session.getAttribute("login") != null) {
			
//			//제품 출력
//			List<ProductVo> productList = productDao.productList();
//			model.addAttribute("productList", productList);
			return "Main";
		}
		
		return "err";
	}
	
	//성별별 리스트
	@RequestMapping("/list/{gender}")
	public String genderList(Model model, HttpSession session, @PathVariable String gender) throws Exception{
		
		if(session.getAttribute("login") != null) {
			
			//제품 출력
			List<ProductVo> productList = productDao.productListGender(gender);
			model.addAttribute("productList", productList);
			
			return "list";
		}
		return "err";
	}
	
	//카테고리별 리스트
	@RequestMapping("/list/{gender}/{category}")
	public String categoryList(Model model, HttpSession session, @PathVariable String gender, @PathVariable String category) throws Exception{
		
		if(session.getAttribute("login") != null) {
			
			//제품 출력
			ProductVo info = new ProductVo();
			info.setGender(gender);
			info.setCategory(category);
			List<ProductVo> productList = productDao.productListCategory(info);
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
			
			//찜
			OrderVo info = new OrderVo();
			info.setId((String) session.getAttribute("login"));
			info.setNo(no);
			OrderVo pick = orderDao.havePick(info);
			model.addAttribute("pick", pick);
			
			return "detail";
		}
		return "err";
	}
	
	//찜 ajax
	@ResponseBody
	@RequestMapping(value="/detail/{no}", method=RequestMethod.POST)
	public String pick(@RequestBody String check, HttpSession session, @PathVariable int no) throws Exception {
		
		System.out.println(check);
		OrderVo info = new OrderVo();
		info.setId((String) session.getAttribute("login"));
		info.setNo(no);
		if(check.equals("pick=")) {
			System.out.println("1");
			orderDao.unpick(info);
		}else if(check.equals("unpick=")) {
			System.out.println("2");
			orderDao.pick(info);
		}
		return "test";
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
			String name = request.getParameter("name");
			String id = request.getParameter("id");
			String address = request.getParameter("address");
			String phone = request.getParameter("phone");
			
			//구매목록에 추가
			OrderVo info = new OrderVo();
			info.setBrand(brand);
			info.setName(name);
			info.setNo(no);
			info.setId(id);
			info.setAddress(address);
			info.setPhone(phone);
			
			orderDao.insertPurchase(info);
			
			//상품의 수량이 0이 되었을 때 status off
			if(productDao.productDetail(no).getStock() == 0) {
				
				Map map = new HashMap<String, Integer>();
				map.put("status", 0);
				map.put("stock", 0);
				map.put("no", no);
				
				productDao.productManagement(map);
			}else {
				
				//상품 수량 변경
				productDao.productStock(no);
			}
			
			return "redirect:/Main";
		}
		return "err";
	}
	
	//마이페이지
	@RequestMapping("/mypage")
	public String mypage(Model model, HttpSession session) throws Exception{
		if(session.getAttribute("login") != null) {
			
			//구매목록 출력
			String id = (String) session.getAttribute("login");
			List<OrderVo> purchase = orderDao.customerPurchaseList(id);
			model.addAttribute("purchase", purchase);
			
			//찜목록 출력
			List<OrderVo> pick = orderDao.customerPick(id);
			List<ProductVo> productList = new ArrayList<ProductVo>();
			for(int i=0; i<pick.size(); i++) {
				System.out.println(pick.get(i).getNo());
				int no = pick.get(i).getNo();
				ProductVo product = productDao.productDetail(no);
				productList.add(product);
			}
			model.addAttribute("productList", productList);
			
			return "mypage";
		}
		return "err";
	}
}
