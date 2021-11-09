package com.devseok0414.myapp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.devseok0414.myapp.common.Criteria;
import com.devseok0414.myapp.common.PageMaker;
import com.devseok0414.myapp.model.dto.ProductDTO;
import com.devseok0414.myapp.service.AdminService;
import com.devseok0414.myapp.service.ProductService;

@Controller
public class ProductController {
	
	@Autowired
	@Qualifier("uploadPath")
	String uploadPath;
	
	@Autowired
	AdminService adminService;
	
	@Autowired
	ProductService productService;
	
	@RequestMapping(value="/product/list.do", method=RequestMethod.GET)
	public String list(@RequestParam(value="pageNumber", required=false, defaultValue="1") int pageNumber,@ModelAttribute("criteria") Criteria criteria, Model model) throws Exception {
		
		criteria.setPageNumber(pageNumber);
		model.addAttribute("list", productService.listCriteria(criteria));
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCriteria(criteria);
		pageMaker.setTotalRecord(productService.listCountCriteria(criteria));
		
		model.addAttribute("pageMaker", pageMaker);
		
		return "product/list";
	}
	
	@RequestMapping(value="/product/searchList.do", method=RequestMethod.GET)
	public String searchListGET(
			@RequestParam(value="pageNumber", required=false, defaultValue="1") int pageNumber,
			@RequestParam(value="searchSelect") String searchSelect,
			@RequestParam(value="searchText") String searchText,
			@ModelAttribute("criteria") Criteria criteria, Model model) throws Exception {
		
		criteria.setPageNumber(pageNumber);
		criteria.setSearchSelect(searchSelect);
		criteria.setSearchText(searchText);
		model.addAttribute("searchList", productService.searchListCriteria(criteria));
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCriteria(criteria);
		pageMaker.setTotalRecord(productService.searchListCountCriteria(criteria));
		
		model.addAttribute("searchSelect", searchSelect);
		model.addAttribute("searchText", searchText);
		model.addAttribute("pageMaker", pageMaker);
		
		
		return "product/searchList";
		
	}
	
	@RequestMapping(value="/product/searchList.do", method=RequestMethod.POST)
	public String searchListPOST(
			@RequestParam(value="pageNumber", required=false, defaultValue="1") int pageNumber,
			@RequestParam(value="searchSelect") String searchSelect,
			@RequestParam(value="searchText") String searchText,
			@ModelAttribute("criteria") Criteria criteria, Model model) throws Exception {
		
		criteria.setPageNumber(pageNumber);
		criteria.setSearchSelect(searchSelect);
		criteria.setSearchText(searchText);
		model.addAttribute("searchList", productService.searchListCriteria(criteria));
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCriteria(criteria);
		pageMaker.setTotalRecord(productService.searchListCountCriteria(criteria));
		
		model.addAttribute("searchSelect", searchSelect);
		model.addAttribute("searchText", searchText);
		model.addAttribute("pageMaker", pageMaker);
		
		
		return "product/searchList";
		
	}
	
	@RequestMapping(value="/product/view.do", method=RequestMethod.GET)
	public String productView(@RequestParam("no") int no, Model model) throws Exception {
		
		ProductDTO dto = adminService.productListView(no);
		
		model.addAttribute("dto", dto);
		
		return "product/view";
	}
}