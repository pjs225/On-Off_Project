package com.t.s.model.dto;

public class SessionIds {
	
	private String sessionid;
	private String userid;
	private int groupno;
	 
	public SessionIds() {
		
	}
	public SessionIds(String sessionid, String userid, int groupno) {
		this.sessionid=sessionid;
		this.userid=userid;
		this.groupno=groupno;
	}
	
	
	public int getGroupno() {
		return groupno;
	}
	public void setGroupno(int groupno) {
		this.groupno = groupno;
	}
	public String getSessionid() {
		return sessionid;
	}
	public void setSessionid(String sessionid) {
		this.sessionid = sessionid;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	
	

}
