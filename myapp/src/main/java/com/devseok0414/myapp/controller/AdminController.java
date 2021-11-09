package com.devseok0414.myapp.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.devseok0414.myapp.common.Criteria;
import com.devseok0414.myapp.common.PageMaker;
import com.devseok0414.myapp.model.dto.AddressDTO;
import com.devseok0414.myapp.model.dto.MemberDTO;
import com.devseok0414.myapp.model.dto.OrderDTO;
import com.devseok0414.myapp.model.dto.OrderDetailDTO;
import com.devseok0414.myapp.model.dto.ProductDTO;
import com.devseok0414.myapp.service.AdminService;
import com.devseok0414.myapp.service.ProductService;
import com.devseok0414.myapp.util.UploadFileUtils;

@Controller
public class AdminController {
	
	@Autowired
	@Qualifier("uploadPath")
	String uploadPath;
	
	@Autowired
	AdminService adminService;
	
	@Autowired
	ProductService productService;
	
	@RequestMapping(value="/admin/productSave.do", method=RequestMethod.GET)
	public String productSave() {
		
		return "admin/productSave";
	}
	
	@RequestMapping(value="/admin/productSave.do", method=RequestMethod.POST)
	public String productSaveProc(ProductDTO dto, MultipartFile file, Model model) throws Exception {
		
		String imgUploadPath = uploadPath + File.separator + "imgUpload";
		String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
		String fileName = null;

		if (file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
			// 파일 인풋박스에 첨부된 파일이 없다면(=첨부된 파일이 이름이 없다면)

			fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);

			// gdsImg에 원본 파일 경로 + 파일명 저장
			dto.setProductImage(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
			// gdsThumbImg에 썸네일 파일 경로 + 썸네일 파일명 저장
			dto.setProductThumbnail(
					File.separator + "imgUpload" + ymdPath + File.separator + "thumbnail" + File.separator + "thumbnail_" + fileName);

		} else { // 첨부된 파일이 없으면
			fileName = File.separator + "images" + File.separator + "none.png";
			// 미리 준비된 none.png파일을 대신 출력함

			dto.setProductImage(fileName);
			dto.setProductThumbnail(fileName);
		}
		
		adminService.productSave(dto);
		return "redirect:/admin/productList.do";
	}
	
	@RequestMapping(value="/admin/productList.do", method=RequestMethod.GET)
	public String productList(@RequestParam(value="pageNumber", required=false, defaultValue="1") int pageNumber,@ModelAttribute("criteria") Criteria criteria, Model model) throws Exception {
		
		criteria.setPageNumber(pageNumber);
		model.addAttribute("list", productService.listCriteria(criteria));  // 게시판의 글 리스트
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCriteria(criteria);
		pageMaker.setTotalRecord(productService.listCountCriteria(criteria));
		
		model.addAttribute("pageMaker", pageMaker);
		
		return "admin/productList";
	}
	
	@RequestMapping(value="/admin/productListView.do", method=RequestMethod.GET)
	public String productListView(@RequestParam("no") int no, Model model) throws Exception {
		
		ProductDTO dto = adminService.productListView(no);
		
		model.addAttribute("dto", dto);
		
		return "admin/productListView";
	}
	
	@RequestMapping(value="/admin/productModify.do", method=RequestMethod.GET)
	public String productModify(@RequestParam("no") int no, Model model) throws Exception {
		
		ProductDTO dto = adminService.productListView(no);
		
		model.addAttribute("dto", dto);
		
		return "admin/productModify";
	}
	
	
	@RequestMapping(value="/admin/productModify.do", method=RequestMethod.POST)
	public String productModifyProc(@RequestParam("no") int no, ProductDTO dto, MultipartFile file, Model model) throws Exception {
		
		String imgUploadPath = uploadPath + File.separator + "imgUpload";
		String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
		String fileName = null;

		if (file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
			// 파일 인풋박스에 첨부된 파일이 없다면(=첨부된 파일이 이름이 없다면)

			fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);

			// gdsImg에 원본 파일 경로 + 파일명 저장
			dto.setProductImage(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
			// gdsThumbImg에 썸네일 파일 경로 + 썸네일 파일명 저장
			dto.setProductThumbnail(
					File.separator + "imgUpload" + ymdPath + File.separator + "thumbnail" + File.separator + "thumbnail_" + fileName);

		} else { // 첨부된 파일이 없으면
			fileName = File.separator + "images" + File.separator + "none.png";
			// 미리 준비된 none.png파일을 대신 출력함

			dto.setProductImage(fileName);
			dto.setProductThumbnail(fileName);
		}
		
		
		adminService.productModify(dto);
		
		model.addAttribute("no", no);
		
		return "redirect:/admin/productListView.do";
	}
	
	
	@RequestMapping(value="/admin/productRemove.do", method=RequestMethod.GET)
	public String productRemove(@RequestParam("no") int no, Model model) throws Exception {
		
		ProductDTO dto = adminService.productListView(no);
		
		model.addAttribute("dto", dto);
		
		return "admin/productRemove";
	}
	
	@RequestMapping(value="/admin/productRemove.do", method=RequestMethod.POST)
	public String productRemoveProc(@RequestParam("no") int no, Model model) {
		
		adminService.productRemove(no);
		
		return "redirect:/admin/productList.do";
	}
	
	@RequestMapping(value="/admin/memberList.do", method=RequestMethod.GET)
	public String memberList(
			@RequestParam(value="pageNumber", required=false, defaultValue="1") int pageNumber,
			@ModelAttribute("criteria") Criteria criteria, Model model, HttpSession session) throws Exception {
		
		criteria.setPageNumber(pageNumber);
		criteria.setPageSize(15);
		List<MemberDTO> memberDTO = adminService.memberList(criteria);
		List<AddressDTO> addressDTO = adminService.memberAddressList(criteria);
		List<String> addressList = new ArrayList<>();
		for (int i = 0; i < addressDTO.size(); i++) {
			addressList.add(addressDTO.get(i).getAddress1()+", "+addressDTO.get(i).getAddress2()+", "+addressDTO.get(i).getAddress3()+", "+addressDTO.get(i).getAddress4()+", "+addressDTO.get(i).getAddress5());
		}
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCriteria(criteria);
		pageMaker.setRangeSize(5);
		pageMaker.setTotalRecord(adminService.memberListCount(criteria));
		
		
		
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("memberList", memberDTO);
		model.addAttribute("addressList", addressList);
		
		return "admin/memberList";
	}
	
	@RequestMapping(value="/admin/searchMemberList.do", method=RequestMethod.GET)
	public String searchMemberList(
			@RequestParam(value="pageNumber", required=false, defaultValue="1") int pageNumber,
			@RequestParam(value="searchSelect") String searchSelect,
			@RequestParam(value="searchText") String searchText,
			@ModelAttribute("criteria") Criteria criteria, Model model, HttpSession session) throws Exception {
		
		criteria.setPageNumber(pageNumber);
		criteria.setPageSize(15);
		criteria.setSearchSelect(searchSelect);
		criteria.setSearchText(searchText);
		List<MemberDTO> memberDTO = adminService.searchMemberList(criteria);
		List<AddressDTO> addressDTO = adminService.searchMemberAddressList(criteria);
		List<String> addressList = new ArrayList<>();
		for (int i = 0; i < addressDTO.size(); i++) {
			addressList.add(addressDTO.get(i).getAddress1()+", "+addressDTO.get(i).getAddress2()+", "+addressDTO.get(i).getAddress3()+", "+addressDTO.get(i).getAddress4()+", "+addressDTO.get(i).getAddress5());
		}
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCriteria(criteria);
		pageMaker.setRangeSize(5);
		pageMaker.setTotalRecord(adminService.searchMemberListCount(criteria));
		
		model.addAttribute("searchSelect", searchSelect);
		model.addAttribute("searchText", searchText);
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("memberList", memberDTO);
		model.addAttribute("addressList", addressList);
		
		return "admin/searchMemberList";
	}
	
	@RequestMapping(value="/admin/orderList.do", method=RequestMethod.GET)
	public String myOrder(
			@RequestParam(value="pageNumber", required=false, defaultValue="1") int pageNumber,
			@ModelAttribute("criteria") Criteria criteria,
			Model model, HttpSession session) throws Exception {
		
		criteria.setPageNumber(pageNumber);
		criteria.setPageSize(10);
		List<OrderDTO> orderDTO = adminService.orderList(criteria);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCriteria(criteria);
		pageMaker.setRangeSize(5);
		pageMaker.setTotalRecord(adminService.orderListCount(criteria));
		
		model.addAttribute("orderList", orderDTO);
		model.addAttribute("pageMaker", pageMaker);
		
		return "admin/orderList";
	}
	
	@RequestMapping(value="/admin/searchOrderList.do", method=RequestMethod.GET)
	public String myOrderSearch(
			@RequestParam(value="pageNumber", required=false, defaultValue="1") int pageNumber,
			@RequestParam(value="searchSelect") String searchSelect,
			@RequestParam(value="searchText") String searchText,
			@ModelAttribute("criteria") Criteria criteria, Model model, HttpSession session) throws Exception {
		
		criteria.setPageNumber(pageNumber);
		criteria.setPageSize(10);
		criteria.setSearchSelect(searchSelect);
		criteria.setSearchText(searchText);
		model.addAttribute("searchList", adminService.searchOrderList(criteria));
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCriteria(criteria);
		pageMaker.setRangeSize(5);
		pageMaker.setTotalRecord(adminService.searchOrderListCount(criteria));
		
		model.addAttribute("searchSelect", searchSelect);
		model.addAttribute("searchText", searchText);
		model.addAttribute("pageMaker", pageMaker);
		
		
		return "admin/searchOrderList";
	}
	
	@RequestMapping(value="/admin/orderListView.do", method=RequestMethod.GET)
	public String myOrderView(@RequestParam("no") int no, Model model, HttpSession session) throws Exception {
		
		OrderDTO orderDTO = adminService.selectOrder(no);
		List<OrderDetailDTO> orderDetailList = adminService.selectOrderDetailList(no);
		int productNo = 0;
		List<String> productNameList = new ArrayList<>();
		for(int i = 0; i<orderDetailList.size(); i++) {
			productNo = orderDetailList.get(i).getProductNo();
			productNameList.add(adminService.selectProductName(productNo));
		}
		
		model.addAttribute("orderDTO", orderDTO);
		model.addAttribute("orderDetailList", orderDetailList);
		model.addAttribute("productNameList", productNameList);
		
		return "admin/orderListView";
	}
	
	@RequestMapping(value="/admin/modify.do", method=RequestMethod.GET)
	public String modify(@RequestParam("no") int no, Model model, HttpSession session) throws Exception {
		
		OrderDTO orderDTO = adminService.selectOrder(no);
		List<OrderDetailDTO> orderDetailList = adminService.selectOrderDetailList(no);
		int productNo = 0;
		List<String> productNameList = new ArrayList<>();
		for(int i = 0; i<orderDetailList.size(); i++) {
			productNo = orderDetailList.get(i).getProductNo();
			productNameList.add(adminService.selectProductName(productNo));
		}
		
		model.addAttribute("orderDTO", orderDTO);
		model.addAttribute("orderDetailList", orderDetailList);
		model.addAttribute("productNameList", productNameList);
		
		return "admin/modifyOrderStatus";
	}
	
	@RequestMapping(value="/admin/modifyOrderStatus.do", method=RequestMethod.POST)
	public String modifyOrderStatus(
			@RequestParam("no") int no, @RequestParam("status") String status, OrderDTO dto,
			@RequestParam(value="pageNumber", required=false, defaultValue="1") int pageNumber,
			@ModelAttribute("criteria") Criteria criteria,
			Model model, HttpSession session) throws Exception {
		
		dto.setNo(no);
		dto.setStatus(status);
		
		adminService.modifyOrderStatus(dto);
		
		criteria.setPageNumber(pageNumber);
		criteria.setPageSize(10);
		List<OrderDTO> orderDTO = adminService.orderList(criteria);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCriteria(criteria);
		pageMaker.setRangeSize(5);
		pageMaker.setTotalRecord(adminService.orderListCount(criteria));
		
		model.addAttribute("orderList", orderDTO);
		model.addAttribute("pageMaker", pageMaker);
		
		return "admin/orderList";
	}
	
}
