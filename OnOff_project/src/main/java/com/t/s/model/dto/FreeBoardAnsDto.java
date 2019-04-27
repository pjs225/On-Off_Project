package com.t.s.model.dto;

import java.util.Date;

public class FreeBoardAnsDto {
	
	//테이블 명 FREEBOARDANS
	private int boardansno;
	private int boardno;
	private String userid;
	private int groupno;
	private String boardanscontent;
	private Date boardansregdate;
	
	
	public FreeBoardAnsDto() {
		//super();
	}

	//파라미터 포함된 생성자는 만들어서 사용하세요 말씀해주시고요

	
	public int getBoardansno() {
		return boardansno;
	}
	public void setBoardansno(int boardansno) {
		this.boardansno = boardansno;
	}

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

	public String getBoardanscontent() {
		return boardanscontent;
	}
	public void setBoardanscontent(String boardanscontent) {
		this.boardanscontent = boardanscontent;
	}

	public Date getBoardansregdate() {
		return boardansregdate;
	}
	public void setBoardansregdate(Date boardansregdate) {
		this.boardansregdate = boardansregdate;
	}
	
	

}
