package com.devseok0414.myapp.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.devseok0414.myapp.model.dto.CartDTO;
import com.devseok0414.myapp.model.dto.CartListDTO;

@Repository
public class CartDAOImpl implements CartDAO{
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public void saveCart(CartDTO dto) throws Exception {
		sqlSession.insert("cart.saveCart", dto);
	}
	
	@Override
	public List<CartListDTO> cartList(String id) throws Exception {
		return sqlSession.selectList("cart.cartList", id);
	}
	
	@Override
	public void removeCart(CartDTO removeCartDTO) throws Exception {
		sqlSession.delete("cart.removeCart", removeCartDTO);
	}
	
	@Override
	public int allPrice(int no) throws Exception {
		return sqlSession.selectOne("cart.allPrice", no);
	}
}
