package com.devseok0414.myapp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.devseok0414.myapp.model.dao.CartDAO;
import com.devseok0414.myapp.model.dto.CartDTO;
import com.devseok0414.myapp.model.dto.CartListDTO;

@Service
public class CartServiceImpl implements CartService{
	@Autowired
	CartDAO cartDAO;

	@Override
	public void saveCart(CartDTO dto) throws Exception {
		cartDAO.saveCart(dto);
	}

	@Override
	public List<CartListDTO> cartList(String id) throws Exception {
		return cartDAO.cartList(id);
	}
	
	@Override
	public void removeCart(CartDTO removeCartDTO) throws Exception {
		cartDAO.removeCart(removeCartDTO);
	}
	
	@Override
	public int allPrice(int no) throws Exception {
		return cartDAO.allPrice(no);
	}
}
