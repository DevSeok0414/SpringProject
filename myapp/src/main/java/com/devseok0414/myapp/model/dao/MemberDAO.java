package com.devseok0414.myapp.model.dao;

import java.util.List;

import com.devseok0414.myapp.common.Criteria;
import com.devseok0414.myapp.model.dto.AddressDTO;
import com.devseok0414.myapp.model.dto.MemberDTO;
import com.devseok0414.myapp.model.dto.OrderDTO;
import com.devseok0414.myapp.model.dto.OrderDetailDTO;

public interface MemberDAO {
	public void signup(MemberDTO dto) throws Exception;
	public void addressSave(AddressDTO dto) throws Exception;
	public MemberDTO login(String id) throws Exception;
	public AddressDTO selectAddress(String memberId) throws Exception;
	public void modifyMember(MemberDTO dto) throws Exception;
	public void modifyAddress(AddressDTO dto) throws Exception;
	public List<OrderDTO> listCriteria(Criteria criteria);
	public int listCountCriteria(Criteria criteria);
	public List<OrderDTO> searchListCriteria(Criteria criteria);
	public int searchListCountCriteria(Criteria criteria);
	public OrderDTO selectOrder(int no);
	public List<OrderDetailDTO> selectOrderDetailList(int no);
	public String selectProductName(int productNo);
}
