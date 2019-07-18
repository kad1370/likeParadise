package com.project.goTravel.cmmn.vo.pagination;

import org.apache.ibatis.type.Alias;

/**
 *  Criteria 클래스
 *      : 페이징 처리를 위해서 사용될 객체로, 페이지 번호와, 페이지당 출력할 개시글 수를 관리할 객체이다.
 */

@Alias("criteria")
public class Criteria {
	
    private int page; // 현재 페이지 번호
    private int perPageNum; // 한 페이지당 보여줄 게시글의 수
    
    // 특정 페이지의 게시글의 시작 글번호
    public int getPageStart() {
        return (this.page-1)*perPageNum;
    }
    
    // 기본 생성자
    // 최초로 게시글 페이지에 들어왔을 때의 기본 셋팅
    public Criteria() {
        this.page = 1;
        this.perPageNum = 10;
    }
    
    public int getPage() {
        return page;
    }
    public void setPage(int page) {
        if(page <= 0) {
            this.page = 1;
        } else {
            this.page = page;
        }
    }
    public int getPerPageNum() {
        return perPageNum;
    }
    public void setPerPageNum(int pageCount) {
        int cnt = this.perPageNum;
        if(pageCount != cnt) {
            this.perPageNum = cnt;
        } else {
            this.perPageNum = pageCount;
        }
    }
     
}

