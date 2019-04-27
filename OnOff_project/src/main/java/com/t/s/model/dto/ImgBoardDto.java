package com.t.s.model.dto;

import java.util.Date;

public class ImgBoardDto {
	
	// 테이블 명 IMGBOARD
	
	private int imgboardno;
	private int moimno;
	private String userid;
	private int groupno;
	private String imgboardtitle;
	private String imgboardcontent;
	private Date imgboardregdate;
	private String imgboardimg;
	
	
	public ImgBoardDto() {
		//super();
	}

	//파라미터 포함된 생성자는 만들어서 사용하세요 말씀해주시고요

	
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

	public String getImgboardtitle() {
		return imgboardtitle;
	}
	public void setImgboardtitle(String imgboardtitle) {
		this.imgboardtitle = imgboardtitle;
	}

	public String getImgboardcontent() {
		return imgboardcontent;
	}
	public void setImgboardcontent(String imgboardcontent) {
		this.imgboardcontent = imgboardcontent;
	}

	public Date getImgboardregdate() {
		return imgboardregdate;
	}
	public void setImgboardregdate(Date imgboardregdate) {
		this.imgboardregdate = imgboardregdate;
	}

	public String getImgboardimg() {
		return imgboardimg;
	}
	public void setImgboardimg(String imgboardimg) {
		this.imgboardimg = imgboardimg;
	}
	
	
	
	

}
