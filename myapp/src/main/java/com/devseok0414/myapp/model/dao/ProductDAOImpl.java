package com.devseok0414.myapp.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.devseok0414.myapp.common.Criteria;
import com.devseok0414.myapp.model.dto.ProductDTO;

@Repository
public class ProductDAOImpl implements ProductDAO{
	
	@Autowired
	SqlSession sqlSession;

	@Override
	public List<ProductDTO> listCriteria(Criteria criteria) {
		return sqlSession.selectList("product.listCriteria", criteria);
	}
	
	@Override
	public int listCountCriteria(Criteria criteria) {
		return sqlSession.selectOne("product.listCountCriteria", criteria);
	}
	
	@Override
	public List<ProductDTO> searchListCriteria(Criteria criteria) {
		return sqlSession.selectList("product.searchListCriteria", criteria);
	}
	
	@Override
	public int searchListCountCriteria(Criteria criteria) {
		return sqlSession.selectOne("product.searchListCountCriteria", criteria);
	}

}
