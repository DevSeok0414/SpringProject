package com.devseok0414.myapp.service;

import java.util.List;

import com.devseok0414.myapp.common.Criteria;
import com.devseok0414.myapp.model.dto.AddressDTO;
import com.devseok0414.myapp.model.dto.MemberDTO;
import com.devseok0414.myapp.model.dto.OrderDTO;
import com.devseok0414.myapp.model.dto.OrderDetailDTO;
import com.devseok0414.myapp.model.dto.ProductDTO;

public interface AdminService {
	public void productSave(ProductDTO dto) throws Exception;
	public ProductDTO productListView(int no) throws Exception;
	public void productModify(ProductDTO dto) throws Exception;
	public void productRemove(int no);
	public List<MemberDTO> memberList(Criteria criteria);
	public List<AddressDTO> memberAddressList(Criteria criteria);
	public int memberListCount(Criteria criteria);
	public List<MemberDTO> searchMemberList(Criteria criteria);
	public List<AddressDTO> searchMemberAddressList(Criteria criteria);
	public int searchMemberListCount(Criteria criteria);
	public List<OrderDTO> orderList(Criteria criteria);
	public int orderListCount(Criteria criteria);
	public List<OrderDTO> searchOrderList(Criteria criteria);
	public int searchOrderListCount(Criteria criteria);
	public OrderDTO selectOrder(int no);
	public List<OrderDetailDTO> selectOrderDetailList(int no);
	public String selectProductName(int productNo);
	public void modifyOrderStatus(OrderDTO dto);
}
