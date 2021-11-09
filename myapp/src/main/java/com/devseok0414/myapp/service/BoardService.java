package com.devseok0414.myapp.service;

import java.util.List;

import com.devseok0414.myapp.common.Criteria;
import com.devseok0414.myapp.model.dto.BoardDTO;

public interface BoardService {
	public List<BoardDTO> listCriteria(Criteria criteria);
	public int listCountCriteria(Criteria criteria);
	public List<BoardDTO> searchListCriteria(Criteria criteria);
	public int searchListCountCriteria(Criteria criteria);
	public BoardDTO boardListView(int no) throws Exception;
	public void saveWrite(BoardDTO dto) throws Exception;
	public String authView(int no) throws Exception;
	public int selectRef(BoardDTO dto) throws Exception;
	public int calcReStep(int ref) throws Exception;
	public void saveReply(BoardDTO dto) throws Exception;
	public void modifyReStep(BoardDTO dto) throws Exception;
	public void removeBoard(int no) throws Exception;
	public void modifyBoard(BoardDTO dto) throws Exception;
}
