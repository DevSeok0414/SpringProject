package com.devseok0414.myapp.model.dao;

import java.util.List;

import com.devseok0414.myapp.model.dto.CartDTO;
import com.devseok0414.myapp.model.dto.CartListDTO;

public interface CartDAO {
	public void saveCart(CartDTO dto) throws Exception;
	public List<CartListDTO> cartList(String id) throws Exception;
	public void removeCart(CartDTO removeCartDTO) throws Exception;
	public int allPrice(int no) throws Exception;
}
