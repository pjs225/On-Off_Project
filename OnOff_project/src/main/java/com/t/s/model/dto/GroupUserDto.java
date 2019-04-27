package com.t.s.model.dto;

import java.util.Date;

public class GroupUserDto {
	
	//테이블 명 GROUPUSER
	
	private String userid;
	private int groupno;
	private String groupusergrade;
	private Date groupuserregdate;
	
	
	public GroupUserDto() {
		//super();
	}

	//파라미터 포함된 생성자는 만들어서 사용하세요 말씀해주시고요
	
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

	public String getGroupusergrade() {
		return groupusergrade;
	}
	public void setGroupusergrade(String groupusergrade) {
		this.groupusergrade = groupusergrade;
	}

	public Date getGroupuserregdate() {
		return groupuserregdate;
	}
	public void setGroupuserregdate(Date groupuserregdate) {
		this.groupuserregdate = groupuserregdate;
	}
	
	
	
	
	

}
