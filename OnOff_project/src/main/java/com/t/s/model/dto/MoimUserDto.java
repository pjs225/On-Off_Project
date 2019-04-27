package com.t.s.model.dto;

public class MoimUserDto {
	
	//테이블 명 MOIMUSER
	private int moimno;
	private String userid;
	private int groupno;
	private int moimq1;
	private int moimq2;
	private int moimq3;
	private int moimq4;
	private int moimq5;
	private String moimq6;
	
	
	
	public MoimUserDto() {
		//super();
	}

	//파라미터 포함된 생성자는 만들어서 사용하세요 말씀해주시고요

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

	public int getMoimq1() {
		return moimq1;
	}

	public void setMoimq1(int moimq1) {
		this.moimq1 = moimq1;
	}

	public int getMoimq2() {
		return moimq2;
	}

	public void setMoimq2(int moimq2) {
		this.moimq2 = moimq2;
	}

	public int getMoimq3() {
		return moimq3;
	}

	public void setMoimq3(int moimq3) {
		this.moimq3 = moimq3;
	}

	public int getMoimq4() {
		return moimq4;
	}

	public void setMoimq4(int moimq4) {
		this.moimq4 = moimq4;
	}

	public int getMoimq5() {
		return moimq5;
	}

	public void setMoimq5(int moimq5) {
		this.moimq5 = moimq5;
	}

	public String getMoimq6() {
		return moimq6;
	}

	public void setMoimq6(String moimq6) {
		this.moimq6 = moimq6;
	}

}
