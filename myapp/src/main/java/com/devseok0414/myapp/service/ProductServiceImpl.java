package com.devseok0414.myapp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.devseok0414.myapp.common.Criteria;
import com.devseok0414.myapp.model.dao.ProductDAO;
import com.devseok0414.myapp.model.dto.ProductDTO;

@Service
public class ProductServiceImpl implements ProductService{

	@Autowired
	ProductDAO productDAO;
	
	@Override
	public List<ProductDTO> listCriteria(Criteria criteria) {
		return productDAO.listCriteria(criteria);
	}

	@Override
	public int listCountCriteria(Criteria criteria) {
		return productDAO.listCountCriteria(criteria);
	}
	
	@Override
	public List<ProductDTO> searchListCriteria(Criteria criteria) {
		return productDAO.searchListCriteria(criteria);
	}
	
	@Override
	public int searchListCountCriteria(Criteria criteria) {
		return productDAO.searchListCountCriteria(criteria);
	}
}
