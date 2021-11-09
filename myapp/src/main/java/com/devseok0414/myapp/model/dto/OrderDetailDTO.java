package com.devseok0414.myapp.model.dto;

import lombok.Data;

@Data
public class OrderDetailDTO {
	private int no;
	private int orderNo;
	private int productNo;
	private int productAmount;
	private int productPrice;
}
