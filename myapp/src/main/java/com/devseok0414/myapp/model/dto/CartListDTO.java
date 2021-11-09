package com.devseok0414.myapp.model.dto;

import lombok.Data;

@Data
public class CartListDTO {
	private int no;
	private String memberId;
	private int productNo;
	private int productAmount;
	private String name;
	private int price;
	private String productImage;
	private int totalPrice;
}
