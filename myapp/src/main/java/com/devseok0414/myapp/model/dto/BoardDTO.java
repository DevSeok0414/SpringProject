package com.devseok0414.myapp.model.dto;

import java.util.Date;

import lombok.Data;

@Data
public class BoardDTO {
	private int no;
	private String memberId;
	private String subject;
	private String content;
	private Date regDate;
	private int ref;
	private int reStep;
	private int reLevel;
	private String password;
	
	public BoardDTO() {
		
	}
}
