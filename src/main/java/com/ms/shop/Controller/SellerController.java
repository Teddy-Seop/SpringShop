package com.ms.shop.Controller;

import java.io.File;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.ms.shop.Dao.OrderDao;
import com.ms.shop.Dao.ProductDao;
import com.ms.shop.Dao.UserDao;
import com.ms.shop.Vo.OrderVo;
import com.ms.shop.Vo.ProductVo;

@Controller
public class SellerController {

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
	public void orderDao(OrderDao dao) {
		this.orderDao = dao;
	}
	
	//업로드 파일 경로
	@Resource(name = "uploadPath")
	private String uploadPath;
	
	//판매자 초기 페이지
	@RequestMapping("/seller")
	public String seller(Model model, HttpSession session) throws Exception {
		
		if(session.getAttribute("login") != null) {
			
			return "seller";
		}
		return "err";
	}
	
	//샹품 등록 페이지
	@RequestMapping("/register")
	public String supervise(Model model, HttpSession session) throws Exception {
		
		if(session.getAttribute("login") != null) {
			
			return "register";
		}
		return "err";
	}
	
	//상품 등록 처리
	@RequestMapping("/registerProcessing")
	public String superviseProcessing(Model model, HttpSession session, HttpServletRequest request, HttpServletResponse response, MultipartFile file) throws Exception {
		
		if(session.getAttribute("login") != null) {
			
			//입력한 값 받아오기
			String name = request.getParameter("name");
			int price = Integer.parseInt(request.getParameter("price"));
			//String image = request.getParameter("image");
			String gender = request.getParameter("gender");
			String category = request.getParameter("category");
			String brand = (String)session.getAttribute("login");
			int stock = Integer.parseInt(request.getParameter("stock"));
			int count = 0;
			int status = Integer.parseInt(request.getParameter("status"));
			
			//이미지 처리
			UUID uid = UUID.randomUUID(); //중복 방지하기 위해 임의로 이름 생성
			String savedName = uid.toString() + "_" + file.getOriginalFilename();
			File target = new File(uploadPath, savedName);
			FileCopyUtils.copy(file.getBytes(), target); //업로드 디렉토리에 저장
					
			ProductVo product = new ProductVo();
			product.setName(name);
			product.setPrice(price);
			product.setImage(savedName);
			product.setGender(gender);
			product.setCategory(category);
			product.setBrand(brand);
			product.setStock(stock);
			product.setCount(count);
			product.setStatus(status);
			
			//DB저장
			productDao.productRegister(product);
			
			return "redirect:seller";
		}
		return "err";
	}
	
	//상품 관리 페이지
	@RequestMapping("/management")
	public String management(Model model, HttpSession session) throws Exception {
		
		if(session.getAttribute("login") != null) {
			
			List<ProductVo> managementList =  productDao.managementList((String)session.getAttribute("login"));
			model.addAttribute("managementList", managementList);
			
			return "management";
		}
		return "err";
	}
	
	//상품 관리 처리
	@RequestMapping("/managementProcessing")
	public String managementProcessing(Model model, HttpSession session, HttpServletRequest request) throws Exception{
		
		if(session.getAttribute("login") != null) {
			
			Enumeration e = request.getParameterNames();
			while(e.hasMoreElements()) {
				String no = (String) e.nextElement();
				String status = request.getParameter(no);
				String stock = request.getParameter("stock");
				
				Map<String, String> map = new HashMap<String, String>();
				map.put("no", no);
				map.put("status", status);
				map.put("stock", stock);
				
				productDao.productManagement(map);
			}
			return "redirect:seller";
		}
		return "err";
	}
	
	//구매목록 처리 페이지
	@RequestMapping("/handling")
	public String handling(Model model, HttpSession session) throws Exception{
		
		if(session.getAttribute("login") != null) {
			
			String brand = (String) session.getAttribute("login");
			List<OrderVo> list = orderDao.brandPurchaseList(brand);
			model.addAttribute("list", list);
			
			return "handling";
		}
		return "err";
	}
	
	//구매목록 처리 페이지
	@RequestMapping("/{no}/handlingProcessing")
	public String handlingProcessing(Model model, HttpSession session, @PathVariable int no) throws Exception{
			
		if(session.getAttribute("login") != null) {
				
			orderDao.handlingPurchase(no);
				
			return "redirect:/handling";
		}
		return "err";
	}
}