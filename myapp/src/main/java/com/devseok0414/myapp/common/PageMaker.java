package com.devseok0414.myapp.common;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @ToString
public class PageMaker {

    private int totalRecord;
    private int rangeSize = 3;

    private int startPage;
    private int endPage;
    private int totalPage;
    private int startIndex;
    private int endIndex;
   
    private Criteria criteria;

    public void setTotalRecord(int totalRecord) {
        this.totalRecord = totalRecord;

        calcData();
    }

    private void calcData() {
        endPage = (int) (Math.ceil(criteria.getPageNumber() / (double) rangeSize) * rangeSize);

        startPage = (endPage - rangeSize) + 1;

        int tempEndPage = (int) (Math.ceil(totalRecord / (double) criteria.getPageSize()));

        if(endPage > tempEndPage) {
            endPage = tempEndPage;
        }

        startIndex = (criteria.getPageSize() * (criteria.getPageNumber() - 1));
        
        int tempEndIndex = ((criteria.getPageSize() * criteria.getPageNumber()) - 1);
        
        endIndex = tempEndIndex > (totalRecord - 1) ? (totalRecord - 1) : tempEndIndex;    
        
        totalPage = (totalRecord / criteria.getPageSize()) + (totalRecord % criteria.getPageSize() == 0 ? 0 : 1);
        
    }



}
