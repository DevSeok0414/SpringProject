package com.devseok0414.myapp.model.dto;

import java.util.Date;

import lombok.Data;

@Data
public class OrderDTO {
	private int no;
	private String memberId;
	private int totalPrice;
	private String status;
	private Date regDate;
	private String receiverName;
	private String receiverPhone;
	private String receiverAddress;
}
