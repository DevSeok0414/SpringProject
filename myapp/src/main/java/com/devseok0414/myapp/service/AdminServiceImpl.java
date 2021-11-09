package com.devseok0414.myapp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.devseok0414.myapp.common.Criteria;
import com.devseok0414.myapp.model.dao.AdminDAO;
import com.devseok0414.myapp.model.dto.AddressDTO;
import com.devseok0414.myapp.model.dto.MemberDTO;
import com.devseok0414.myapp.model.dto.OrderDTO;
import com.devseok0414.myapp.model.dto.OrderDetailDTO;
import com.devseok0414.myapp.model.dto.ProductDTO;

@Service
public class AdminServiceImpl implements AdminService{
	
	@Autowired
	AdminDAO adminDAO;

	@Override
	public void productSave(ProductDTO dto) throws Exception {
		adminDAO.productSave(dto);
	}

	@Override
	public ProductDTO productListView(int no) throws Exception {
		
		return adminDAO.productListView(no);
	}

	@Override
	public void productModify(ProductDTO dto) throws Exception {
		
		adminDAO.productModify(dto);
	}
	
	@Override
	public void productRemove(int no) {
		adminDAO.productRemove(no);
	}
	
	
	@Override
	public List<MemberDTO> memberList(Criteria criteria) {
		return adminDAO.memberList(criteria);
	}
	
	@Override
	public List<AddressDTO> memberAddressList(Criteria criteria) {
		return adminDAO.memberAddressList(criteria);
	}
	
	@Override
	public int memberListCount(Criteria criteria) {
		return adminDAO.memberListCount(criteria);
	}
	
	@Override
	public List<MemberDTO> searchMemberList(Criteria criteria) {
		return adminDAO.searchMemberList(criteria);
	}
	
	@Override
	public List<AddressDTO> searchMemberAddressList(Criteria criteria) {
		return adminDAO.searchMemberAddressList(criteria);
	}
	
	@Override
	public int searchMemberListCount(Criteria criteria) {
		return adminDAO.searchMemberListCount(criteria);
	}
	
	@Override
	public List<OrderDTO> orderList(Criteria criteria) {
		return adminDAO.orderList(criteria);
	}
	
	@Override
	public int orderListCount(Criteria criteria) {
		return adminDAO.orderListCount(criteria);
	}
	
	@Override
	public List<OrderDTO> searchOrderList(Criteria criteria) {
		return adminDAO.searchOrderList(criteria);
	}
	
	@Override
	public int searchOrderListCount(Criteria criteria) {
		return adminDAO.searchOrderListCount(criteria);
	}
	
	@Override
	public OrderDTO selectOrder(int no) {
		return adminDAO.selectOrder(no);
	}
	
	@Override
	public List<OrderDetailDTO> selectOrderDetailList(int no) {
		return adminDAO.selectOrderDetailList(no);
	}
	
	@Override
	public String selectProductName(int productNo) {
		return adminDAO.selectProductName(productNo);
	}
	
	@Override
	public void modifyOrderStatus(OrderDTO dto) {
		adminDAO.modifyOrderStatus(dto);
	}
}
