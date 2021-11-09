package com.devseok0414.myapp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.devseok0414.myapp.common.Criteria;
import com.devseok0414.myapp.model.dao.BoardDAO;
import com.devseok0414.myapp.model.dto.BoardDTO;

@Service
public class BoardServiceImpl implements BoardService{

	@Autowired
	BoardDAO boardDAO;
	
	@Override
	public List<BoardDTO> listCriteria(Criteria criteria) {
		return boardDAO.listCriteria(criteria);
	};
	
	@Override
	public int listCountCriteria(Criteria criteria) {
		return boardDAO.listCountCriteria(criteria);
	}
	
	@Override
	public List<BoardDTO> searchListCriteria(Criteria criteria) {
		return boardDAO.searchListCriteria(criteria);
	}
	
	@Override
	public int searchListCountCriteria(Criteria criteria) {
		return boardDAO.searchListCountCriteria(criteria);
	}
	
	@Override
	public BoardDTO boardListView(int no) throws Exception {
		return boardDAO.boardListView(no);
	}
	
	@Override
	public void saveWrite(BoardDTO dto) throws Exception {
		boardDAO.saveWrite(dto);
	}
	
	@Override
	public String authView(int no) throws Exception {
		return boardDAO.authView(no);
	}
	
	@Override
	public int selectRef(BoardDTO dto) throws Exception {
		return boardDAO.selectRef(dto);
	}
	
	@Override
	public int calcReStep(int ref) throws Exception {
		return boardDAO.calcReStep(ref);
	}
	
	@Override
	public void saveReply(BoardDTO dto) throws Exception {
		boardDAO.saveReply(dto);
	}
	
	@Override
	public void modifyReStep(BoardDTO dto) throws Exception {
		boardDAO.modifyReStep(dto);
	}
	
	@Override
	public void removeBoard(int no) throws Exception {
		boardDAO.removeBoard(no);
	}
	
	@Override
	public void modifyBoard(BoardDTO dto) throws Exception {
		boardDAO.modifyBoard(dto);
	}
}
