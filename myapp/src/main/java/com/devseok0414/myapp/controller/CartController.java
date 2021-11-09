package com.devseok0414.myapp.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.devseok0414.myapp.model.dto.CartDTO;
import com.devseok0414.myapp.model.dto.CartListDTO;
import com.devseok0414.myapp.model.dto.MemberDTO;
import com.devseok0414.myapp.service.CartService;

@Controller
public class CartController {
	
	@Autowired
	CartService cartService;
	
	@ResponseBody
	@RequestMapping(value = "/cart/save.do", method = RequestMethod.POST)
	public int addCart(CartDTO dto, HttpSession session) throws Exception {
	 
		int result = 0;
		
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		
		if(member != null) {
			dto.setMemberId(member.getId());
			cartService.saveCart(dto);
			result = 1;
		}
		
		return result;
	}
	
	@RequestMapping(value = "/cart/list.do", method = RequestMethod.GET)
	public String list(HttpSession session, Model model) throws Exception {
	
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		String id = member.getId();
		
		List<CartListDTO> cartList = cartService.cartList(id);
		
		System.out.println("cartList = " + cartList);
		
		model.addAttribute("cartList", cartList);
		
		return "cart/list";
	}
	
	@ResponseBody
	@RequestMapping(value = "/cart/removeCart.do", method = RequestMethod.POST)
	public int removeCart(HttpSession session, @RequestParam(value = "checkArr[]") List<String> chkArr, CartDTO dto, Model model) throws Exception {
	
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		String id = member.getId();
		
		int result = 0;
		int no = 0;
		
		if(member != null) {
			dto.setMemberId(id);
			
			for(String i : chkArr) {
				no = Integer.parseInt(i);
				dto.setNo(no);
				cartService.removeCart(dto);
			}
			result = 1;
		}
		
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value = "/cart/allPrice.do", method = RequestMethod.POST)
	public int allPrice(HttpSession session, @RequestParam(value = "priceArr[]") List<String> allPriceArr, CartListDTO dto, Model model) throws Exception {
		
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		
		int allPrice = 0;
		int no = 0;
		
		if(member != null) {
			for(String i : allPriceArr) {
				no = Integer.parseInt(i);
				allPrice += cartService.allPrice(no);
			}
		}
		return allPrice;
	}
	

	
}
