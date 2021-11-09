package com.devseok0414.myapp.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.devseok0414.myapp.model.dto.AddressDTO;
import com.devseok0414.myapp.model.dto.CartDTO;
import com.devseok0414.myapp.model.dto.CartListDTO;
import com.devseok0414.myapp.model.dto.MemberDTO;
import com.devseok0414.myapp.model.dto.OrderDTO;
import com.devseok0414.myapp.model.dto.OrderDetailDTO;
import com.devseok0414.myapp.service.CartService;
import com.devseok0414.myapp.service.OrderService;

@Controller
public class OrderController {
	
	@Autowired
	OrderService orderService;
	
	@Autowired
	CartService cartService;
	
	@ResponseBody
	@RequestMapping(value = "/order/checkArr.do", method = RequestMethod.POST)
	public List<String> checkArr(@RequestBody List<String> checkArr) {
		
		return checkArr;
	}
	
	@RequestMapping(value ="/order/list.do/*", method = RequestMethod.GET)
	public String orderList(HttpServletRequest request, HttpSession session, CartListDTO cartListDTO, Model model) throws Exception {
		String servletPath = request.getServletPath();
		String[] pathArray = servletPath.split("/");
		String cartList = pathArray[3];
		String[] cartListNoArray = cartList.split(",");
		
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		int no = 0;
		String id = member.getId();
		List<CartListDTO> innerList = new ArrayList<>();
		List<List> outerList = new ArrayList<>();
		int allPrice = 0;
		String cartListNoString = "";
		
		List<MemberDTO> memberList = new ArrayList<>();
		List<AddressDTO> addressList = new ArrayList<>();
		
		if (member != null) {
			cartListDTO.setMemberId(id);
			
			for(int i = 0; i < cartListNoArray.length; i++) {
				cartListNoString += cartListNoArray[i] + ",";
				no = Integer.parseInt(cartListNoArray[i]);
				cartListDTO.setNo(no);
				innerList = orderService.orderList(cartListDTO);
				allPrice += innerList.get(0).getTotalPrice();
				outerList.add(innerList);
			}
			memberList = orderService.memberList(id); 
			addressList = orderService.addressList(id); 
		}
		
		model.addAttribute("cartListNoString", cartListNoString);
		model.addAttribute("outerList", outerList);
		model.addAttribute("allPrice", allPrice);
		model.addAttribute("memberList", memberList);
		model.addAttribute("addressList", addressList);
		
		return "order/list";
	}
	
	@RequestMapping(value = "/order/pay.do", method = RequestMethod.POST)
	public String list(HttpServletRequest request, Model model, HttpSession session) throws Exception {
		
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		String memberId = member.getId();
		String receiverName = request.getParameter("inputReceiverName");
		String receiverPhone = request.getParameter("inputReceiverPhone");
		String receiverAddress = request.getParameter("inputReceiverAddress1") + ", " + request.getParameter("inputReceiverAddress2") + ", " + request.getParameter("inputReceiverAddress3") + ", " + request.getParameter("inputReceiverAddress4") + ", " + request.getParameter("inputReceiverAddress5");
		String finalPrice_ = request.getParameter("inputFinalPrice");
		int finalPrice = Integer.parseInt(finalPrice_);
		String cartListNoString = request.getParameter("inputCartListNoString");
		String[] cartListNoArray = cartListNoString.split(",");
		String payment = request.getParameter("inputPayment");
		
		OrderDTO orderDTO = new OrderDTO();
		orderDTO.setMemberId(memberId);
		orderDTO.setTotalPrice(finalPrice);
		orderDTO.setReceiverName(receiverName);
		orderDTO.setReceiverPhone(receiverPhone);
		orderDTO.setReceiverAddress(receiverAddress);
		
		int saveOrderReturnValue = orderService.saveOrder(orderDTO);
		int orderNo = orderDTO.getNo();
		int cartListNo = 0;
		
		OrderDetailDTO orderDetailDTO = new OrderDetailDTO();
		
		List<CartDTO> cartList = new ArrayList<>();
		
		for(int i = 0; i<cartListNoArray.length; i++) {
			cartListNo = Integer.parseInt(cartListNoArray[i]);
			cartList = orderService.cartList(cartListNo);
			for(int j = 0; j<cartList.size(); j++) {
				int productNo = cartList.get(j).getProductNo();
				int productAmount = cartList.get(j).getProductAmount();
				int tempPrice = orderService.productPrice(productNo);
				int productPrice = productAmount*tempPrice;
				
				orderDetailDTO.setOrderNo(orderNo);
				orderDetailDTO.setProductNo(productNo);
				orderDetailDTO.setProductAmount(productAmount);
				orderDetailDTO.setProductPrice(productPrice);
				orderService.saveOrderDetail(orderDetailDTO);
			}
		}
		
		orderService.removeAllCart(memberId);
		
		model.addAttribute("orderNo", orderNo);
		return "order/pay";
	}
	
	
	
}
