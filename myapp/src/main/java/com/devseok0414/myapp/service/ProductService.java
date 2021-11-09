package com.devseok0414.myapp.service;

import java.util.List;

import com.devseok0414.myapp.common.Criteria;
import com.devseok0414.myapp.model.dto.ProductDTO;

public interface ProductService {
	public List<ProductDTO> listCriteria(Criteria criteria);
	public int listCountCriteria(Criteria criteria);
	public List<ProductDTO> searchListCriteria(Criteria criteria);
	public int searchListCountCriteria(Criteria criteria);

}
