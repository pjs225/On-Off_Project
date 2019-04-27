package com.t.s.model.dto;

import java.util.Date;

public class MoimAnsDto {
	
	//테이블 명 MOIMANS
	
	private int moimansno;
	private int moimno;
	private String userid;
	private int groupno;
	private String moimanscontent;
	private Date moimansregdate;
	
	
	public MoimAnsDto() {
		//super();
	}

	//파라미터 포함된 생성자는 만들어서 사용하세요 말씀해주시고요

	
	public int getMoimansno() {
		return moimansno;
	}
	public void setMoimansno(int moimansno) {
		this.moimansno = moimansno;
	}

	public int getMoimno() {
		return moimno;
	}
	public void setMoimno(int moimno) {
		this.moimno = moimno;
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

	public String getMoimanscontent() {
		return moimanscontent;
	}
	public void setMoimanscontent(String moimanscontent) {
		this.moimanscontent = moimanscontent;
	}

	public Date getMoimansregdate() {
		return moimansregdate;
	}
	public void setMoimansregdate(Date moimansregdate) {
		this.moimansregdate = moimansregdate;
	}
	
	
	
}
