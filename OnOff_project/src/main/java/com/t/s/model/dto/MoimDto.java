package com.t.s.model.dto;

import java.util.Date;

public class MoimDto {
	
	//테이블 명 MOIM
	////////////////////date을 String으로 변경 경도위도 Dto에 추가해야할듯 디비랑
	private int moimno;
	private String userid;
	private int groupno;
	private String moimtitle;
	private String moimcontent;
	private String moimrecruit;
	private String moimaddr;
	private Date moimregdate;
	private String moimenddate;
	private String moimdate;
	private String lat;
	private String lng;
	
	public MoimDto() {
		//super();
	}
//파라미터 포함된 생성자는 만들어서 사용하세요 말씀해주시고요
	
	
	public MoimDto(int moimno, String userid, int groupno, String moimtitle, String moimcontent, String moimrecruit,
			String moimaddr, Date moimregdate, String moimenddate, String moimdate, String lat, String lng) {
		super();
		this.moimno = moimno;
		this.userid = userid;
		this.groupno = groupno;
		this.moimtitle = moimtitle;
		this.moimcontent = moimcontent;
		this.moimrecruit = moimrecruit;
		this.moimaddr = moimaddr;
		this.moimregdate = moimregdate;
		this.moimenddate = moimenddate;
		this.moimdate = moimdate;
		this.lat = lat;
		this.lng = lng;
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


	public String getMoimtitle() {
		return moimtitle;
	}


	public void setMoimtitle(String moimtitle) {
		this.moimtitle = moimtitle;
	}


	public String getMoimcontent() {
		return moimcontent;
	}


	public void setMoimcontent(String moimcontent) {
		this.moimcontent = moimcontent;
	}


	public String getMoimrecruit() {
		return moimrecruit;
	}


	public void setMoimrecruit(String moimrecruit) {
		this.moimrecruit = moimrecruit;
	}


	public String getMoimaddr() {
		return moimaddr;
	}


	public void setMoimaddr(String moimaddr) {
		this.moimaddr = moimaddr;
	}


	public Date getMoimregdate() {
		return moimregdate;
	}


	public void setMoimregdate(Date moimregdate) {
		this.moimregdate = moimregdate;
	}


	public String getMoimenddate() {
		return moimenddate;
	}


	public void setMoimenddate(String moimenddate) {
		this.moimenddate = moimenddate;
	}


	public String getMoimdate() {
		return moimdate;
	}


	public void setMoimdate(String moimdate) {
		this.moimdate = moimdate;
	}


	public String getLat() {
		return lat;
	}


	public void setLat(String lat) {
		this.lat = lat;
	}


	public String getLng() {
		return lng;
	}


	public void setLng(String lng) {
		this.lng = lng;
	}

	
	@Override
	public String toString() {
		return "MoimDto [moimtitle=" + moimtitle + ", moimaddr=" + moimaddr + ", moimdate=" + moimdate + "]";
	}
	

/*	@Override
	public String toString() {
		return "MoimDto [moimno=" + moimno + ", userid=" + userid + ", groupno=" + groupno + ", moimtitle=" + moimtitle
				+ ", moimcontent=" + moimcontent + ", moimrecruit=" + moimrecruit + ", moimaddr=" + moimaddr
				+ ", moimregdate=" + moimregdate + ", moimenddate=" + moimenddate + ", moimdate=" + moimdate + ", lat="
				+ lat + ", lng=" + lng + "]";
	}
*/
	


	
	

}
