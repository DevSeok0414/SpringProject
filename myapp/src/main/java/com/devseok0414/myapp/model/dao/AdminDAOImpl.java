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
import com.devseok0414.myapp.model.dto.ProductDTO;

@Repository
public class AdminDAOImpl implements AdminDAO{
	@Autowired
	SqlSession sqlSession;

	@Override
	public void productSave(ProductDTO dto) throws Exception {
		sqlSession.insert("admin.productSave", dto);
	}

	@Override
	public ProductDTO productListView(int no) throws Exception {
		return sqlSession.selectOne("product.productListView", no);
	}

	@Override
	public void productModify(ProductDTO dto) throws Exception {
		sqlSession.update("admin.productModify", dto);
	}
	
	@Override
	public void productRemove(int no) {
		sqlSession.delete("admin.productRemove", no);
	}
	
	@Override
	public List<MemberDTO> memberList(Criteria criteria) {
		return sqlSession.selectList("admin.memberList", criteria);
	}
	
	@Override
	public List<AddressDTO> memberAddressList(Criteria criteria) {
		return sqlSession.selectList("admin.memberAddressList", criteria);
	}
	
	@Override
	public int memberListCount(Criteria criteria) {
		return sqlSession.selectOne("admin.memberListCount", criteria);
	}
	
	@Override
	public List<MemberDTO> searchMemberList(Criteria criteria) {
		return sqlSession.selectList("admin.searchMemberList", criteria);
	}
	
	@Override
	public List<AddressDTO> searchMemberAddressList(Criteria criteria) {
		return sqlSession.selectList("admin.searchMemberAddressList", criteria);
	}
	
	@Override
	public int searchMemberListCount(Criteria criteria) {
		return sqlSession.selectOne("admin.searchMemberListCount", criteria);
	}
	
	@Override
	public List<OrderDTO> orderList(Criteria criteria) {
		return sqlSession.selectList("admin.orderList", criteria);
	}
	
	@Override
	public int orderListCount(Criteria criteria) {
		return sqlSession.selectOne("admin.orderListCount", criteria);
	}
	
	@Override
	public List<OrderDTO> searchOrderList(Criteria criteria) {
		return sqlSession.selectList("admin.searchOrderList", criteria);
	}
	
	@Override
	public int searchOrderListCount(Criteria criteria) {
		return sqlSession.selectOne("admin.searchOrderListCount", criteria);
	}
	
	@Override
	public OrderDTO selectOrder(int no) {
		return sqlSession.selectOne("admin.selectOrder", no);
	}
	
	@Override
	public List<OrderDetailDTO> selectOrderDetailList(int no) {
		return sqlSession.selectList("admin.selectOrderDetailList", no);
	}
	
	@Override
	public String selectProductName(int productNo) {
		return sqlSession.selectOne("admin.selectProductName", productNo);
	}
	
	@Override
	public void modifyOrderStatus(OrderDTO dto) {
		sqlSession.update("admin.modifyOrderStatus", dto);
	}
}
