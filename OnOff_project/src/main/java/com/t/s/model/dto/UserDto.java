package com.t.s.model.dto;

import java.util.Date;

public class UserDto {

	// 테이블 명 USERINFO
	private String userid;
	private String userpw;
	private String usergrade;
	private String username;
	private String userbirth;
	private String useremail;
	private String useraddr;
	private String usergender;
	private String userphone;
	private Date userregdate;

	public UserDto() {
		// super();
	}

	// 파라미터 포함된 생성자는 만들어서 사용하세요 말씀해주시고요
	public UserDto(String userid, String userpw, String usergrade, String username, String userbirth, String useremail,
			String useraddr, String usergender, String userphone, Date userregdate) {
		super();
		this.userid = userid;
		this.userpw = userpw;
		this.usergrade = usergrade;
		this.username = username;
		this.userbirth = userbirth;
		this.useremail = useremail;
		this.useraddr = useraddr;
		this.usergender = usergender;
		this.userphone = userphone;
		this.userregdate = userregdate;
	}
	
	// 내 정보 수정 생성자
	public UserDto(String userpw, String username, String userbirth, String useremail,
			String useraddr, String usergender, String userphone) {
		super();
		this.userpw = userpw;
		this.username = username;
		this.userbirth = userbirth;
		this.useremail = useremail;
		this.useraddr = useraddr;
		this.usergender = usergender;
		this.userphone = userphone;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getUserpw() {
		return userpw;
	}

	public void setUserpw(String userpw) {
		this.userpw = userpw;
	}

	public String getUsergrade() {
		return usergrade;
	}

	public void setUsergrade(String usergrade) {
		this.usergrade = usergrade;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getUserbirth() {
		return userbirth;
	}

	public void setUserbirth(String userbirth) {
		this.userbirth = userbirth;
	}

	public String getUseremail() {
		return useremail;
	}

	public void setUseremail(String useremail) {
		this.useremail = useremail;
	}

	public String getUseraddr() {
		return useraddr;
	}

	public void setUseraddr(String useraddr) {
		this.useraddr = useraddr;
	}

	public String getUsergender() {
		return usergender;
	}

	public void setUsergender(String usergender) {
		this.usergender = usergender;
	}

	public String getUserphone() {
		return userphone;
	}

	public void setUserphone(String userphone) {
		this.userphone = userphone;
	}

	public Date getUserregdate() {
		return userregdate;
	}

	public void setUserregdate(Date userregdate) {
		this.userregdate = userregdate;
	}

}
