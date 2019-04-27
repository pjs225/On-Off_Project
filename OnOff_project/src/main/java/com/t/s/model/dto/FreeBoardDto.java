package com.t.s.model.dto;

import java.util.Date;

public class FreeBoardDto {
	
	//테이블 명 FREEBOARD
	
	private int boardno;
	private String userid;
	private int groupno;
	private String boardtitle;
	private String boardcontent;
	private Date boardregdate;
	
	
	public FreeBoardDto() {
		//super();
	}

	//파라미터 포함된 생성자는 만들어서 사용하세요 말씀해주시고요

	
	public int getBoardno() {
		return boardno;
	}
	public void setBoardno(int boardno) {
		this.boardno = boardno;
	}

	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}

	public int getGroupno() {
		return groupno;
	}
	public void setGroupno(int groupno) {
		this.groupno = groupno;
	}

	public String getBoardtitle() {
		return boardtitle;
	}
	public void setBoardtitle(String boardtitle) {
		this.boardtitle = boardtitle;
	}

	public String getBoardcontent() {
		return boardcontent;
	}
	public void setBoardcontent(String boardcontent) {
		this.boardcontent = boardcontent;
	}

	public Date getBoardregdate() {
		return boardregdate;
	}
	public void setBoardregdate(Date boardregdate) {
		this.boardregdate = boardregdate;
	}
		

}
