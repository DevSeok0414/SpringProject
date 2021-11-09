package com.devseok0414.myapp.service;

import java.util.List;

import com.devseok0414.myapp.model.dto.AddressDTO;
import com.devseok0414.myapp.model.dto.CartDTO;
import com.devseok0414.myapp.model.dto.CartListDTO;
import com.devseok0414.myapp.model.dto.MemberDTO;
import com.devseok0414.myapp.model.dto.OrderDTO;
import com.devseok0414.myapp.model.dto.OrderDetailDTO;

public interface OrderService {
	public List<CartListDTO> orderList(CartListDTO dto) throws Exception;
	public List<MemberDTO> memberList(String id) throws Exception;
	public List<AddressDTO> addressList(String id) throws Exception;
	public int saveOrder(OrderDTO orderDTO) throws Exception;
	public List<CartDTO> cartList(int cartListNo) throws Exception;
	public int productPrice(int productNo) throws Exception;	
	public void saveOrderDetail(OrderDetailDTO orderDetailDTO) throws Exception;
	public void removeAllCart(String memberId) throws Exception;
}
