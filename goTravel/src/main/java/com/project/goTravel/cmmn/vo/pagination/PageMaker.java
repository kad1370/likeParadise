package com.project.goTravel.cmmn.vo.pagination;

public class PageMaker {

	    private Criteria cri; // page, perPageNum 을 가지고 있음
	 
	    private int totalCount; // 전체 게시글 수
	    private int startPage; // 게시글 번호에 따른 (보여지는)페이지의 시작 번호
	    private int endPage; // 게시글 번호에 따른 (보여지는)페이지의 마지막 번호
	    private boolean prev; // 이전 버튼을 누를 수 있는 경우/없는 경우 분류를 위함
	    private boolean next;
	    private int displayPageNum = 10; // 화면 하단에 보여지는 페이지의 개수

	    // private int tempEndPage;

	    public Criteria getCri() {
	        return cri;
	    }
	 
	/*
	 * public int getTempEndPage() { return tempEndPage; }
	 */	    
	    public void setCri(Criteria cri) {
	        this.cri = cri;
	    }
	 
	    public int getTotalCount() {
	        return totalCount;
	    }
	    
	    public void setTotalCount(int totalCount) {
	        this.totalCount = totalCount;
	        
	        // 총 게시글 수를 셋팅할때 calcData() 메서드를 호출하여 페이징 관련 버튼 계산을 한다.
	        calcData(); 
	    }
	    
	    // 페이징의 버튼들을 생성하는 계산식.
	    // 끝 페이지 번호, 시작 페이지 번호, 이전, 다음 버튼들을 구한다.

	    private void calcData() { 
	    	
	    	//끝 페이지 번호 = (현재 페이지 번호 / 화면에 보여질 페이지 번호의 갯수) * 화면에 보여질 페이지 번호의 갯수
	        endPage = (int) (Math.ceil(cri.getPage() / (double) displayPageNum) * displayPageNum);
	 
	        //마지막 페이지 번호 = 총 게시글 수 / 한 페이지당 보여줄 게시글의 갯수
	        int tempEndPage = (int) (Math.ceil(totalCount / (double) cri.getPerPageNum()));
	        // this.tempEndPage = tempEndPage;
	 
	        if (endPage > tempEndPage) {
	            endPage = tempEndPage;
	        }
	        
	        //시작 페이지 번호 = (끝 페이지 번호 - 화면에 보여질 페이지 번호의 갯수) + 1
	        startPage = (endPage - displayPageNum) + 1;	 
	        if(startPage <= 0) startPage = 1;
	        
	        // 1페이지면 이전 누를 수 없게 false
	        prev = startPage == 1 ? false : true; 
	        
	        //다음 버튼 생성 여부 = 끝 페이지 번호 * 한 페이지당 보여줄 게시글의 갯수 >= 총 게시글의 수 ? false : true
	        next = endPage * cri.getPerPageNum() >= totalCount ? false : true;
	 
	    }
	 
	    public int getStartPage() {
	        return startPage;
	    }
	 
	    public void setStartPage(int startPage) {
	        this.startPage = startPage;
	    }
	 
	    public int getEndPage() {
	        return endPage;
	    }
	 
	    public void setEndPage(int endPage) {
	        this.endPage = endPage;
	    }
	 
	    public boolean isPrev() {
	        return prev;
	    }
	 
	    public void setPrev(boolean prev) {
	        this.prev = prev;
	    }
	 
	    public boolean isNext() {
	        return next;
	    }
	 
	    public void setNext(boolean next) {
	        this.next = next;
	    }
	 
	    public int getDisplayPageNum() {
	        return displayPageNum;
	    }
	 
	    public void setDisplayPageNum(int displayPageNum) {
	        this.displayPageNum = displayPageNum;
	    }
	 

}
