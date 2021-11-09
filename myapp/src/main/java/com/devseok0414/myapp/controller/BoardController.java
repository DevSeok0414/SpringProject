package com.devseok0414.myapp.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.devseok0414.myapp.common.Criteria;
import com.devseok0414.myapp.common.PageMaker;
import com.devseok0414.myapp.model.dto.BoardDTO;
import com.devseok0414.myapp.model.dto.MemberDTO;
import com.devseok0414.myapp.service.BoardService;

@Controller
public class BoardController {
	@Autowired
	BoardService boardService;
	
	@RequestMapping(value="/board/list.do", method=RequestMethod.GET)
	public String list(@RequestParam(value="pageNumber", required=false, defaultValue="1") int pageNumber,@ModelAttribute("criteria") Criteria criteria, Model model, HttpSession session) throws Exception {
		
		criteria.setPageNumber(pageNumber);
		criteria.setPageSize(15);
		model.addAttribute("list", boardService.listCriteria(criteria));
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCriteria(criteria);
		pageMaker.setRangeSize(5);
		pageMaker.setTotalRecord(boardService.listCountCriteria(criteria));
		
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		int auth = member.getAuth();
		
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("auth", auth);
		
		return "board/list";
	}
	
	@RequestMapping(value="/board/searchList.do", method=RequestMethod.GET)
	public String searchListGET(
			@RequestParam(value="pageNumber", required=false, defaultValue="1") int pageNumber,
			@RequestParam(value="searchSelect") String searchSelect,
			@RequestParam(value="searchText") String searchText,
			@ModelAttribute("criteria") Criteria criteria, Model model) throws Exception {
		
		criteria.setPageNumber(pageNumber);
		criteria.setPageSize(15);
		criteria.setSearchSelect(searchSelect);
		criteria.setSearchText(searchText);
		model.addAttribute("searchList", boardService.searchListCriteria(criteria));
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCriteria(criteria);
		pageMaker.setRangeSize(5);
		pageMaker.setTotalRecord(boardService.searchListCountCriteria(criteria));
		
		model.addAttribute("searchSelect", searchSelect);
		model.addAttribute("searchText", searchText);
		model.addAttribute("pageMaker", pageMaker);
		
		
		return "board/searchList";
	}
	
	
	@RequestMapping(value="/board/authView.do", method=RequestMethod.GET)
	public String authView(@RequestParam("no") int no, Model model) throws Exception {
		
		String boardPassword = boardService.authView(no);
		
		model.addAttribute("no", no);
		model.addAttribute("boardPassword", boardPassword);
		
		return "board/authView";
	}
	
	
	
	@RequestMapping(value="/board/view.do", method=RequestMethod.GET)
	public String productView(@RequestParam("no") int no, Model model, HttpSession session) throws Exception {
		
		BoardDTO dto = boardService.boardListView(no);
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		String sessionId = member.getId();
		int auth = member.getAuth();
		
		model.addAttribute("dto", dto);
		model.addAttribute("sessionId", sessionId);
		model.addAttribute("auth", auth);
		
		return "board/view";
	}
	
	@RequestMapping(value="/board/write.do", method = RequestMethod.GET)
	public String write() throws Exception {
		
		return "board/write";
	}
	
	@RequestMapping(value="/board/saveWrite.do", method = RequestMethod.POST)
	public String saveWrite(
			@RequestParam(value="subject") String subject,
			@RequestParam(value="content") String content,
			@RequestParam(value="password") String password,
			HttpSession session) throws Exception {
		
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		
		BoardDTO dto = new BoardDTO();
		
		dto.setMemberId(member.getId());
		dto.setSubject(subject);
		dto.setContent(content);
		dto.setPassword(password);
		
		boardService.saveWrite(dto);
		
		return "redirect:/board/list.do";
	}
	
	@RequestMapping(value="/board/replyWrite.do", method = RequestMethod.POST)
	public String replyWrite(@RequestParam("no") int no, Model model, HttpSession session) throws Exception {
		
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		String sessionId = member.getId();
		int auth = member.getAuth();
		
		BoardDTO dto = boardService.boardListView(no);
		
		model.addAttribute("sessionId", sessionId);
		model.addAttribute("auth", auth);
		model.addAttribute("dto", dto);
		
		return "board/replyWrite";
	}
	
	@RequestMapping(value="/board/saveReply.do", method = RequestMethod.POST)
	public String saveReply(
			@RequestParam("no") int no,
			@RequestParam("subject") String subject,
			@RequestParam("content") String content,
			HttpSession session) throws Exception {
		
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		
		BoardDTO dto = boardService.boardListView(no);
		dto.setMemberId(member.getId());
		dto.setSubject(subject);
		dto.setContent(content);
		int reStep = boardService.selectRef(dto);
		
		if(reStep == 0) {
			int calcReStep = boardService.calcReStep(dto.getRef());
			dto.setReStep(calcReStep);
			dto.setReLevel(dto.getReLevel()+1);
			boardService.saveReply(dto);
		} else {
			dto.setReStep(reStep);
			boardService.modifyReStep(dto);
			dto.setReLevel(dto.getReLevel()+1);
			boardService.saveReply(dto);
		}
		
		return "redirect:/board/list.do";
	}
	
	@RequestMapping(value="/board/modify.do", method = RequestMethod.GET)
	public String modify(@ModelAttribute("no") int no, Model model) throws Exception {
		
		BoardDTO dto = boardService.boardListView(no);
		
		model.addAttribute("dto", dto);
		
		return "board/modify";
	}
	
	@RequestMapping(value="/board/modifyBoard.do", method = RequestMethod.POST)
	public String modifyBoard(
			@RequestParam("subject") String subject, @RequestParam("content") String content, @ModelAttribute("no") int no, 
			@RequestParam(value="pageNumber", required=false, defaultValue="1") int pageNumber,@ModelAttribute("criteria") Criteria criteria,
			Model model, BoardDTO dto, HttpSession session) throws Exception {
		
		dto.setSubject(subject);
		dto.setContent(content);
		dto.setNo(no);
		
		boardService.modifyBoard(dto);
		
		criteria.setPageNumber(pageNumber);
		criteria.setPageSize(15);
		model.addAttribute("list", boardService.listCriteria(criteria));
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCriteria(criteria);
		pageMaker.setRangeSize(5);
		pageMaker.setTotalRecord(boardService.listCountCriteria(criteria));
		
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		int auth = member.getAuth();
		
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("auth", auth);
		
		return "board/list";
	}
	
	@RequestMapping(value="/board/remove.do", method = RequestMethod.GET)
	public String remove(@ModelAttribute("no") int no, Model model) throws Exception {
		
		BoardDTO dto = boardService.boardListView(no);
		
		model.addAttribute("dto", dto);
		
		return "board/remove";
	}
	
	@RequestMapping(value="/board/removeBoard.do", method = RequestMethod.POST)
	public String removeBoard(
			@ModelAttribute("no") int no,
			@RequestParam(value="pageNumber", required=false, defaultValue="1") int pageNumber,
			@ModelAttribute("criteria") Criteria criteria, Model model, HttpSession session) throws Exception {

		boardService.removeBoard(no);
		
		criteria.setPageNumber(pageNumber);
		criteria.setPageSize(15);
		model.addAttribute("list", boardService.listCriteria(criteria));
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCriteria(criteria);
		pageMaker.setRangeSize(5);
		pageMaker.setTotalRecord(boardService.listCountCriteria(criteria));
		
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		int auth = member.getAuth();
		
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("auth", auth);
		
		return "board/list";
	}
	
}

