package com.devseok0414.myapp.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.devseok0414.myapp.common.Criteria;
import com.devseok0414.myapp.model.dao.MemberDAO;
import com.devseok0414.myapp.model.dto.AddressDTO;
import com.devseok0414.myapp.model.dto.MemberDTO;
import com.devseok0414.myapp.model.dto.OrderDTO;
import com.devseok0414.myapp.model.dto.OrderDetailDTO;

@Service
public class MemberServiceImpl implements MemberService{
	@Autowired
	MemberDAO memberDAO;

	@Override
	public void signup(MemberDTO dto) throws Exception {
		memberDAO.signup(dto);
	}
	
	@Override
	public void addressSave(AddressDTO dto) throws Exception {
		memberDAO.addressSave(dto);
	}
	
	@Override
	public MemberDTO login(String id) throws Exception {
		return memberDAO.login(id);
	}
	
	@Override
	public void logout(HttpSession session) throws Exception {
		session.invalidate();
	}
	
	@Override
	public AddressDTO selectAddress(String memberId) throws Exception {
		return memberDAO.selectAddress(memberId);
	}
	
	@Override
	public void modifyMember(MemberDTO dto) throws Exception {
		memberDAO.modifyMember(dto);
	}
	
	@Override
	public void modifyAddress(AddressDTO dto) throws Exception {
		memberDAO.modifyAddress(dto);
	}
	
	@Override
	public List<OrderDTO> listCriteria(Criteria criteria) {
		return memberDAO.listCriteria(criteria);
	}
	
	@Override
	public int listCountCriteria(Criteria criteria) {
		return memberDAO.listCountCriteria(criteria);
	}
	
	@Override
	public List<OrderDTO> searchListCriteria(Criteria criteria) {
		return memberDAO.searchListCriteria(criteria);
	}
	
	@Override
	public int searchListCountCriteria(Criteria criteria) {
		return memberDAO.searchListCountCriteria(criteria);
	}
	
	@Override
	public OrderDTO selectOrder(int no) {
		return memberDAO.selectOrder(no);
	}
	
	@Override
	public List<OrderDetailDTO> selectOrderDetailList(int no) {
		return memberDAO.selectOrderDetailList(no);
	}
	
	@Override
	public String selectProductName(int productNo) {
		return memberDAO.selectProductName(productNo);
	}
}
