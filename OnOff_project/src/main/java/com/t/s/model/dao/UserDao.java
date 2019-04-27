package com.t.s.model.dao;

import com.t.s.model.dto.UserDto;

public interface UserDao {
	
	String NAMESPACE = "onoff.";

	// 아래에는 기능만
	// public List<CustomerDto> selectList(); 이런식으로만

	public UserDto login(String id, String pw);
	public UserDto idchk(String id);
	public int regist(UserDto dto);
	public String searchpassword(String id);
	public UserDto myinfo(String id);
	public int dropuser(String id);
	public int updateuser(UserDto dto);
}
