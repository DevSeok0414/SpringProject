package com.devseok0414.myapp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.devseok0414.myapp.model.dao.OrderDAO;
import com.devseok0414.myapp.model.dto.AddressDTO;
import com.devseok0414.myapp.model.dto.CartDTO;
import com.devseok0414.myapp.model.dto.CartListDTO;
import com.devseok0414.myapp.model.dto.MemberDTO;
import com.devseok0414.myapp.model.dto.OrderDTO;
import com.devseok0414.myapp.model.dto.OrderDetailDTO;

@Service
public class OrderServiceImpl implements OrderService{
	@Autowired
	OrderDAO orderDAO;
	
	@Override
	public List<CartListDTO> orderList(CartListDTO dto) throws Exception {
		
		return orderDAO.orderList(dto);
	}
	
	@Override
	public List<MemberDTO> memberList(String id) throws Exception {
		return orderDAO.memberList(id);
	}
	
	
	@Override
	public List<AddressDTO> addressList(String id) throws Exception {
		return orderDAO.addressList(id);
	}
	
	@Override
	public int saveOrder(OrderDTO orderDTO) throws Exception {
		return orderDAO.saveOrder(orderDTO);
	}
	
	@Override
	public List<CartDTO> cartList(int cartListNo) throws Exception {
		return orderDAO.cartList(cartListNo);
	}
	
	@Override
	public int productPrice(int productNo) throws Exception {
		return orderDAO.productPrice(productNo);
	}
	
	@Override
	public void saveOrderDetail(OrderDetailDTO orderDetailDTO) throws Exception {
		orderDAO.saveOrderDetail(orderDetailDTO);
	}
	
	@Override
	public void removeAllCart(String memberId) throws Exception {
		orderDAO.removeAllCart(memberId);
	}
}
