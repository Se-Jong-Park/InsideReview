package com.jeonju.movie.comm;

public class PageHandler {
	// 패키징(목록, 이전, 다음 버튼 등)
	private int totalCnt;		// 총 회원수
	// private int pageSize;	// 한 페이지의 크기
	private int navSize = 10;	// 페이지 네비게이션의 크기, 한 페이지에 보여줄 회원 수
	private int totalPage;		// 전체 페이지 수
	// private int page;		// 현재 페이지
	private int beginPage;
	private int endPage;
	private boolean showPrev;
	private boolean showNext;
		
	private SearchCondtion sc;
		// private int offset;
		
	public PageHandler(int totalCnt, int page) {
		this(totalCnt, new SearchCondtion(page, 10));
	}
	public PageHandler(int totalCnt, int page, int pageSize) {
		this(totalCnt, new SearchCondtion(page, pageSize));
	}
	public PageHandler(int totalCnt, SearchCondtion sc) {
		this.totalCnt = totalCnt;
		this.sc = sc;
		doPaging(totalCnt, sc);
	}
	
	// 페이징 데이터 가공
	public void doPaging (int totalCnt, SearchCondtion sc) {
		this.totalPage = (int)Math.ceil(totalCnt/(double)sc.getPageSize());
		this.beginPage = sc.getPage() / navSize * navSize + 1;
		this.endPage = Math.min(beginPage + navSize - 1, totalPage);
		
		this.showPrev = beginPage != 1;
		this.showNext = endPage != totalPage;
		this.sc.setPage(Math.min(sc.getPage(), totalPage));				// page가 totalPage보다 크지 않게
		// this.offset = (page-1)*pageSize;
	}
	public int getTotalCnt() {
		return totalCnt;
	}
	public void setTotalCnt(int totalCnt) {
		this.totalCnt = totalCnt;
	}
	//   public int getPageSize() {
	//      return pageSize;
	//   }
	//   public void setPageSize(int pageSize) {
	//      this.pageSize = pageSize;
	//   }
	public int getNavSize() {
		return navSize;
	}
	public void setNavSize(int navSize) {
		this.navSize = navSize;
	}
	public int getTotalPage() {
		return totalPage;
	}
	//   public int getPage() {
	//      return page;
	//   }
	//   public void setPage(int page) {
	//      this.page = page;
	//   }
	public int getBeginPage() {
		return beginPage;
	}
	public void setBeginPage(int beginPage) {
		this.beginPage = beginPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public boolean isShowPrev() {
		return showPrev;
	}
	public void setShowPrev(boolean showPrev) {
		this.showPrev = showPrev;
	}
	public boolean isShowNext() {
		return showNext;
	}
	public void setShowNext(boolean showNext) {
		this.showNext = showNext;
	}
	//   public int getOffset() {
	//      return offset;
	//   }
	//   public void setOffset(int offset) {
	//      this.offset = offset;
	//   }
	public SearchCondtion getSc() {
		return sc;
	}
	public void setSc(SearchCondtion sc) {
		this.sc = sc;
	}
	@Override
	public String toString() {
		return "PageHandler [totalCnt=" + totalCnt + ", navSize=" + navSize + ", totalPage=" + totalPage 
				+ ", beginPage=" + ", endPage=" + endPage + ", showPrev=" + showPrev + ", showNext=" + showNext 
				+ ", sc=" + sc + "]";
	}
}
