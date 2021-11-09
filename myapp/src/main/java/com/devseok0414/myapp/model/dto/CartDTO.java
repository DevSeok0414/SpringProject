package com.devseok0414.myapp.model.dto;

import lombok.Data;

@Data
public class CartDTO {
	private int no;
	private String memberId;
	private int productNo;
	private int productAmount;
}
