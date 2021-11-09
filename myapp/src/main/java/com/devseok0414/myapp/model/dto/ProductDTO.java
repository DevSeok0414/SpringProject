package com.devseok0414.myapp.model.dto;

import java.util.Date;

import lombok.Data;

@Data
public class ProductDTO {
	private int no;
	private String name;
	private int price;
	private String description;
	private Date regDate;
	private String productImage;
	private String productThumbnail;
}
