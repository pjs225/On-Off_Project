package com.t.s.model.dto;

import java.util.Date;

public class ImgBoardAnsDto {
	
	//테이블 명 IMGBOARDANS
	
	private int imgansno;
	private int imgboardno;
	private int moimno;
	private String userid;
	private int groupno;
	private String imganscontent;
	private Date imgansregdate;
	
	
	public ImgBoardAnsDto() {
		//super();
	}

	//파라미터 포함된 생성자는 만들어서 사용하세요 말씀해주시고요

	
	public int getImgansno() {
		return imgansno;
	}
	public void setImgansno(int imgansno) {
		this.imgansno = imgansno;
	}

	public int getImgboardno() {
		return imgboardno;
	}
	public void setImgboardno(int imgboardno) {
		this.imgboardno = imgboardno;
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

	public String getImganscontent() {
		return imganscontent;
	}
	public void setImganscontent(String imganscontent) {
		this.imganscontent = imganscontent;
	}

	public Date getImgansregdate() {
		return imgansregdate;
	}
	public void setImgansregdate(Date imgansregdate) {
		this.imgansregdate = imgansregdate;
	}

}
