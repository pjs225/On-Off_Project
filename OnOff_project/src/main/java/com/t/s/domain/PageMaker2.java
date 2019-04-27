package com.t.s.domain;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

public class PageMaker2 {
	private int totalCount;
	private int startPage;
	private int endPage;
	private boolean prev;
	private boolean next;

	private int displayPageNum = 5;

	private Criteria pc;

	public void setCri(Criteria pc) {
		this.pc = pc;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		calcData();
	}

	public int getTotalCount() {
		return totalCount;
	}

	public int getStartPage() {
		return startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public boolean isPrev() {
		return prev;
	}

	public boolean isNext() {
		return next;
	}

	public int getDisplayPageNum() {
		return displayPageNum;
	}

	public Criteria getCri() {
		return pc;
	}

	private void calcData() {
		endPage = (int) (Math.ceil(pc.getPage() / (double) displayPageNum) * displayPageNum);
		startPage = (endPage - displayPageNum) + 1;

		int tempEndPage = (int) (Math.ceil(totalCount / (double) pc.getPerPageNum()));
		if (endPage > tempEndPage) {
			endPage = tempEndPage;
		}
		prev = startPage == 1 ? false : true;
		next = endPage * pc.getPerPageNum() >= totalCount ? false : true;
	}

	
	 public String makeQuery(int page) { 
		 UriComponents uriComponents = UriComponentsBuilder.newInstance().queryParam("page", page).queryParam("perPageNum", pc.getPerPageNum()).build(); 
		 return uriComponents.toUriString(); 
	 }
	 
	public String makeSearch(int page) {
		
		//UriComponents uriComponents = null;
		
		if(((SearchCriteria) pc).getSearchType().equals("") && ((SearchCriteria) pc).getKeyword().equals("")) {
			UriComponents uriComponents = UriComponentsBuilder.newInstance().queryParam("page", page).queryParam("perPageNum", pc.getPerPageNum()).build();
			return uriComponents.toUriString();
		} else {
			UriComponents uriComponents = UriComponentsBuilder.newInstance().queryParam("page", page)
					.queryParam("perPageNum", pc.getPerPageNum())
					.queryParam("searchType", ((SearchCriteria) pc).getSearchType())
					.queryParam("keyword", encoding(((SearchCriteria) pc).getKeyword())).build();
			return uriComponents.toUriString();
		}
		//return uriComponents.toUriString();
	}

	private String encoding(String keyword) {
		if (keyword == null || keyword.trim().length() == 0) {
			return "";
		}

		try {
			return URLEncoder.encode(keyword, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			return "";
		}
	}
}
