package com.devseok0414.myapp.common;

import lombok.Getter;
import lombok.ToString;

@Getter @ToString
public class Criteria {

    private int pageNumber;         // 보여줄 페이지 번호
    private int pageSize;           // 페이지당 보여 줄 게시글의 수

    private String searchText;
    private String searchSelect;
    
    private String memberId;
    
    public Criteria() {
        this.pageNumber = 1;
        this.pageSize = 12;
    }
    
    public Criteria(int pageSize) {
    	this.pageNumber = 1;
    	this.pageSize = pageSize;
    }

    public void setPageNumber(int pageNumber) {
        if(pageNumber <= 0) {
            this.pageNumber = 1;
            return;
        }
        this.pageNumber = pageNumber;
    }

    public void setPageSize(int pageSize) {
        if(pageSize <= 0) {
            this.pageSize = 12;
            return;
        }
        this.pageSize = pageSize;
    }
    
    public void setSearchText(String searchText) {
		this.searchText = searchText;
    }
    
    public void setSearchSelect(String searchSelect) {
		this.searchSelect = searchSelect;
    }
    
    public void setMemberId(String memberId) {
    	this.memberId = memberId;
    }
}