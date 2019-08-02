package com.ms.shop.Controller;

import java.io.File;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.ms.shop.Dao.ShopDao;
import com.ms.shop.Vo.ProductVo;

@Controller
public class SellerController {

ShopDao shopDao;
	
	@Autowired
	public void setDao(ShopDao dao) {
		this.shopDao = dao;
	}
	
	//업로드 파일 경로
	@Resource(name = "uploadPath")
	private String uploadPath;
	
	//판매자 초기 페이지
	@RequestMapping("/seller")
	public String seller(Model model, HttpSession session) {
		
		if(session.getAttribute("login") != null) {
			
			return "seller";
		}
		
		return "err";
	}
	
	//샹품 등록 페이지
	@RequestMapping("/register")
	public String supervise(Model model, HttpSession session) {
		
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
			shopDao.productRegister(product);
			
			return "redirect:seller";
		}
		return "err";
	}
}
