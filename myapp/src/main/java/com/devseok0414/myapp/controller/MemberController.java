package com.devseok0414.myapp.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.devseok0414.myapp.common.Criteria;
import com.devseok0414.myapp.common.PageMaker;
import com.devseok0414.myapp.model.dto.AddressDTO;
import com.devseok0414.myapp.model.dto.MemberDTO;
import com.devseok0414.myapp.model.dto.OrderDTO;
import com.devseok0414.myapp.model.dto.OrderDetailDTO;
import com.devseok0414.myapp.service.MemberService;

@Controller
public class MemberController {
	
	@Autowired
	MemberService memberService;
	
	@Inject
	PasswordEncoder passwordEncoder;
	
	@RequestMapping(value="/member/signup.do", method=RequestMethod.GET)
	public String signup() {
		
		return "member/signup";
	}
	
	@RequestMapping(value="/member/signup.do", method=RequestMethod.POST)
	public String signupProc(Model model, HttpServletRequest request) throws Exception {
		
		MemberDTO dto = new MemberDTO();
		
		dto.setId(request.getParameter("id"));
		
		String inputPass = request.getParameter("password");
		String pass = passwordEncoder.encode(inputPass);
		dto.setPassword(pass);
		
		dto.setName(request.getParameter("name"));
		dto.setPhone(request.getParameter("phone"));
		dto.setEmail(request.getParameter("email"));
		
		memberService.signup(dto);
		
		AddressDTO dto2 = new AddressDTO();
		
		dto2.setMemberId(request.getParameter("id"));
		if (request.getParameter("address1") == null || request.getParameter("address1").trim() == "") {
			dto2.setAddress1(0);
		} else {
			String address1_ = request.getParameter("address1");
			dto2.setAddress1(Integer.parseInt(address1_));
		}
		if (request.getParameter("address2") != null || request.getParameter("address2").trim() != "") {
			dto2.setAddress2(request.getParameter("address2"));
		} else {
			dto2.setAddress2("");
		}
		dto2.setAddress3(request.getParameter("address3"));
		if (request.getParameter("address4") != null || request.getParameter("address4").trim() != "") {
			dto2.setAddress4(request.getParameter("address4"));
		} else {
			dto2.setAddress4("");
		}
		if (request.getParameter("address5") != null || request.getParameter("address5").trim() != "") {
			dto2.setAddress5(request.getParameter("address5"));
		} else {
			dto2.setAddress5("");
		}
		
		memberService.addressSave(dto2);
		
		return "redirect:/member/login.do";
	}
	
	@RequestMapping(value="/member/login.do", method=RequestMethod.GET)
	public String login() {
	
		return "member/login";
	}
	
	@RequestMapping(value="/member/login.do", method=RequestMethod.POST)
	public String loginProc(MemberDTO dto, HttpServletRequest request, RedirectAttributes attributes) throws Exception {
		
		MemberDTO login = memberService.login(request.getParameter("id"));
		HttpSession session = request.getSession();
		
		boolean passMatch = passwordEncoder.matches(dto.getPassword(), login.getPassword());
		
		if (login != null && passMatch) {
			session.setAttribute("auth", login.getAuth());
			session.setAttribute("member", login);
		} else {
			session.setAttribute("auth", null);
			session.setAttribute("member", null);
			attributes.addFlashAttribute("msg", false);
			return "redirect:/member/login.do";
		}
		
		
		return "redirect:/";
	}
	
	@RequestMapping(value="/member/logout.do", method=RequestMethod.GET)
	public String logout(HttpSession session) throws Exception {
		memberService.logout(session);
		
		return "redirect:/";
	}
	
	@RequestMapping(value="/member/myPage.do", method=RequestMethod.GET)
	public String mypage(HttpSession session, Model model) throws Exception {
		
		MemberDTO tempMember = (MemberDTO)session.getAttribute("member");
		String memberId = tempMember.getId();
		
		MemberDTO member = memberService.login(memberId);
		AddressDTO dto = memberService.selectAddress(memberId);
		
		model.addAttribute("member", member);
		model.addAttribute("dto", dto);
		
		return "member/myPage";
	}
	
	@RequestMapping(value="/member/modify.do", method=RequestMethod.GET)
	public String modify(HttpSession session, Model model) throws Exception {
		
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		String memberId = member.getId();
		
		AddressDTO dto = memberService.selectAddress(memberId);
		
		model.addAttribute("member", member);
		model.addAttribute("dto", dto);
		
		return "member/modify";
	}
	
	@RequestMapping(value="/member/modifyMember.do", method=RequestMethod.POST)
	public String modifyMember(
			@ModelAttribute("id") String id,
			@ModelAttribute("password") String password,
			@ModelAttribute("phone") String phone,
			@ModelAttribute("email") String email,
			@ModelAttribute("address1") int address1,
			@ModelAttribute("address2") String address2,
			@ModelAttribute("address3") String address3,
			@ModelAttribute("address4") String address4,
			@ModelAttribute("address5") String address5,
			MemberDTO memberDTO, AddressDTO addressDTO, HttpSession session, Model model, HttpServletRequest request) throws Exception {
		
		String inputPass = password;
		String pass = passwordEncoder.encode(inputPass);
		
		memberDTO.setPassword(pass);
		memberDTO.setId(id);
		memberDTO.setPhone(phone);
		memberDTO.setEmail(email);
		
		memberService.modifyMember(memberDTO);
		
		addressDTO.setMemberId(id);
		addressDTO.setAddress1(address1);
		addressDTO.setAddress2(address2);
		addressDTO.setAddress3(address3);
		addressDTO.setAddress4(address4);
		addressDTO.setAddress5(address5);
		memberService.modifyAddress(addressDTO);
		
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		String memberId = member.getId();
		
		AddressDTO dto = memberService.selectAddress(memberId);
		
		model.addAttribute("member", member);
		model.addAttribute("dto", dto);
		
		return "redirect:/member/myPage.do";
	}
	
	@RequestMapping(value="/member/myOrder.do", method=RequestMethod.GET)
	public String myOrder(
			@RequestParam(value="pageNumber", required=false, defaultValue="1") int pageNumber,
			@ModelAttribute("criteria") Criteria criteria,
			Model model, HttpSession session) throws Exception {
		
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		String memberId = member.getId();
		
		criteria.setPageNumber(pageNumber);
		criteria.setPageSize(10);
		criteria.setMemberId(memberId);
		model.addAttribute("list", memberService.listCriteria(criteria));
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCriteria(criteria);
		pageMaker.setRangeSize(5);
		pageMaker.setTotalRecord(memberService.listCountCriteria(criteria));
		
		model.addAttribute("pageMaker", pageMaker);
		
		return "member/myOrder";
	}
	
	@RequestMapping(value="/member/myOrderSearch.do", method=RequestMethod.GET)
	public String myOrderSearch(
			@RequestParam(value="pageNumber", required=false, defaultValue="1") int pageNumber,
			@RequestParam(value="searchSelect") String searchSelect,
			@RequestParam(value="searchText") String searchText,
			@ModelAttribute("criteria") Criteria criteria, Model model, HttpSession session) throws Exception {
		
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		String memberId = member.getId();
		
		criteria.setPageNumber(pageNumber);
		criteria.setPageSize(10);
		criteria.setMemberId(memberId);
		criteria.setSearchSelect(searchSelect);
		criteria.setSearchText(searchText);
		model.addAttribute("searchList", memberService.searchListCriteria(criteria));
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCriteria(criteria);
		pageMaker.setRangeSize(5);
		pageMaker.setTotalRecord(memberService.searchListCountCriteria(criteria));
		
		model.addAttribute("searchSelect", searchSelect);
		model.addAttribute("searchText", searchText);
		model.addAttribute("pageMaker", pageMaker);
		
		
		return "member/myOrderSearch";
	}
	
	@RequestMapping(value="/member/myOrderView.do", method=RequestMethod.GET)
	public String myOrderView(@RequestParam("no") int no, Model model, HttpSession session) throws Exception {
		
		OrderDTO orderDTO = memberService.selectOrder(no);
		List<OrderDetailDTO> orderDetailList = memberService.selectOrderDetailList(no);
		int productNo = 0;
		List<String> productNameList = new ArrayList<>();
		for(int i = 0; i<orderDetailList.size(); i++) {
			productNo = orderDetailList.get(i).getProductNo();
			productNameList.add(memberService.selectProductName(productNo));
		}
		
		model.addAttribute("orderDTO", orderDTO);
		model.addAttribute("orderDetailList", orderDetailList);
		model.addAttribute("productNameList", productNameList);
		
		return "member/myOrderView";
	}
	
	
}
