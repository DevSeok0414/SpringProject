package com.devseok0414.myapp.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.devseok0414.myapp.model.dto.AddressDTO;
import com.devseok0414.myapp.model.dto.CartDTO;
import com.devseok0414.myapp.model.dto.CartListDTO;
import com.devseok0414.myapp.model.dto.MemberDTO;
import com.devseok0414.myapp.model.dto.OrderDTO;
import com.devseok0414.myapp.model.dto.OrderDetailDTO;

@Repository
public class OrderDAOImpl implements OrderDAO{
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public List<CartListDTO> orderList(CartListDTO dto) throws Exception {
		return sqlSession.selectList("order.orderList", dto);
	}
	
	@Override
	public List<MemberDTO> memberList(String id) throws Exception {
		return sqlSession.selectList("order.memberList", id);
	}
	
	@Override
	public List<AddressDTO> addressList(String id) throws Exception {
		return sqlSession.selectList("order.addressList", id);
	}
	
	@Override
	public int saveOrder(OrderDTO orderDTO) throws Exception {
		return sqlSession.insert("order.saveOrder", orderDTO);
	}
	
	@Override
	public List<CartDTO> cartList(int cartListNo) throws Exception {
		return sqlSession.selectList("order.cartList", cartListNo);
	}
	
	@Override
	public int productPrice(int productNo) throws Exception {
		return sqlSession.selectOne("order.productPrice", productNo);
	}
	
	@Override
	public void saveOrderDetail(OrderDetailDTO orderDetailDTO) throws Exception {
		sqlSession.insert("order.saveOrderDetail", orderDetailDTO);
	}
	
	@Override
	public void removeAllCart(String memberId) throws Exception {
		sqlSession.delete("order.removeAllCart", memberId);
	}
}
