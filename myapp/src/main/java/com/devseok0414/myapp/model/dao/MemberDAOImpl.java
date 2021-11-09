package com.devseok0414.myapp.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.devseok0414.myapp.common.Criteria;
import com.devseok0414.myapp.model.dto.AddressDTO;
import com.devseok0414.myapp.model.dto.MemberDTO;
import com.devseok0414.myapp.model.dto.OrderDTO;
import com.devseok0414.myapp.model.dto.OrderDetailDTO;

@Repository
public class MemberDAOImpl implements MemberDAO{
	@Autowired
	SqlSession sqlSession;

	@Override
	public void signup(MemberDTO dto) throws Exception {
		sqlSession.insert("member.signup", dto);
	}
	
	@Override
	public void addressSave(AddressDTO dto) throws Exception {
		sqlSession.insert("member.addressSave", dto);
	}
	
	@Override
	public MemberDTO login(String id) throws Exception {
		return sqlSession.selectOne("member.login", id);
	}
	
	@Override
	public AddressDTO selectAddress(String memberId) throws Exception {
		return sqlSession.selectOne("member.selectAddress", memberId);
	}
	
	@Override
	public void modifyMember(MemberDTO dto) throws Exception {
		sqlSession.update("member.modifyMember", dto);
	}
	
	@Override
	public void modifyAddress(AddressDTO dto) throws Exception {
		sqlSession.update("member.modifyAddress", dto);
	}
	
	@Override
	public List<OrderDTO> listCriteria(Criteria criteria) {
		return sqlSession.selectList("member.listCriteria", criteria);
	}
	
	@Override
	public int listCountCriteria(Criteria criteria) {
		return sqlSession.selectOne("member.listCountCriteria", criteria);
	}
	
	@Override
	public List<OrderDTO> searchListCriteria(Criteria criteria) {
		return sqlSession.selectList("member.searchListCriteria", criteria);
	}
	
	@Override
	public int searchListCountCriteria(Criteria criteria) {
		return sqlSession.selectOne("member.searchListCountCriteria", criteria);
	}
	
	@Override
	public OrderDTO selectOrder(int no) {
		return sqlSession.selectOne("member.selectOrder", no);
	}
	
	@Override
	public List<OrderDetailDTO> selectOrderDetailList(int no) {
		return sqlSession.selectList("member.selectOrderDetailList", no);
	}
	
	@Override
	public String selectProductName(int productNo) {
		return sqlSession.selectOne("member.selectProductName", productNo);
		
	}
}
