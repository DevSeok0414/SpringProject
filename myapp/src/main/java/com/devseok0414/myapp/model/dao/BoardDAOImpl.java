package com.devseok0414.myapp.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.devseok0414.myapp.common.Criteria;
import com.devseok0414.myapp.model.dto.BoardDTO;

@Repository
public class BoardDAOImpl implements BoardDAO{
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public List<BoardDTO> listCriteria(Criteria criteria) {
		return sqlSession.selectList("board.listCriteria", criteria);
	}
	
	@Override
	public int listCountCriteria(Criteria criteria) {
		return sqlSession.selectOne("board.listCountCriteria", criteria);
	}
	
	@Override
	public List<BoardDTO> searchListCriteria(Criteria criteria) {
		return sqlSession.selectList("board.searchListCriteria", criteria);
	}
	
	@Override
	public int searchListCountCriteria(Criteria criteria) {
		return sqlSession.selectOne("board.searchListCountCriteria", criteria);
	}
	
	@Override
	public BoardDTO boardListView(int no) throws Exception {
		return sqlSession.selectOne("board.boardListView", no);
	}
	
	@Override
	public void saveWrite(BoardDTO dto) throws Exception {
		sqlSession.insert("board.saveWrite", dto);
	}
	
	@Override
	public String authView(int no) throws Exception {
		return sqlSession.selectOne("board.authView", no);
	}
	
	@Override
	public int selectRef(BoardDTO dto) throws Exception {
		return sqlSession.selectOne("board.selectRef", dto);
	}
	
	@Override
	public int calcReStep(int ref) throws Exception {
		return sqlSession.selectOne("board.calcReStep", ref);
	}
	
	@Override
	public void saveReply(BoardDTO dto) throws Exception {
		sqlSession.insert("board.saveReply", dto);
	}
	
	@Override
	public void modifyReStep(BoardDTO dto) throws Exception {
		sqlSession.update("board.modifyReStep", dto);
	}
	
	@Override
	public void removeBoard(int no) throws Exception {
		sqlSession.delete("board.removeBoard", no);
	}
	
	@Override
	public void modifyBoard(BoardDTO dto) throws Exception {
		sqlSession.update("board.modifyBoard", dto);
	}
}
