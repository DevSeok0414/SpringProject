package com.devseok0414.myapp.model.dto;

import java.util.Date;

import lombok.Data;

@Data
public class MemberDTO {
	private String id;
	private String password;
	private String name;
	private String phone;
	private String email;
	private Date regDate;
	private int auth;
}
