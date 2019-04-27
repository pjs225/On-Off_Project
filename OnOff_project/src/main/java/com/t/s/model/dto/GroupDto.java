package com.t.s.model.dto;

import java.util.Date;

public class GroupDto {
	
	//테이블 명 GROUPINFO
	private int groupno;
	private String grouptitle;
	private String groupcontent;
	private Date groupregdate;
	private String groupimg;
	
	
	public GroupDto() {
		//super();
	}
	
	//파라미터 포함된 생성자는 만들어서 사용하세요 말씀해주시고요
	public GroupDto(int groupno, String grouptitle, String groupcontent, Date groupregdate, String groupimg) {
		super();
		this.groupno = groupno;
		this.grouptitle = grouptitle;
		this.groupcontent = groupcontent;
		this.groupregdate = groupregdate;
		this.groupimg = groupimg;
	}

	

	public int getGroupno() {
		return groupno;
	}
	
	public void setGroupno(int groupno) {
		this.groupno = groupno;
	}

	public String getGrouptitle() {
		return grouptitle;
	}
	public void setGrouptitle(String grouptitle) {
		this.grouptitle = grouptitle;
	}

	public String getGroupcontent() {
		return groupcontent;
	}
	public void setGroupcontent(String groupcontent) {
		this.groupcontent = groupcontent;
	}

	public Date getGroupregdate() {
		return groupregdate;
	}
	public void setGroupredate(Date groupregdate) {
		this.groupregdate = groupregdate;
	}

	public String getGroupimg() {
		return groupimg;
	}
	public void setGroupimg(String groupimg) {
		this.groupimg = groupimg;
	}
	
	
	
	

}
