package com.t.s.model.biz;

import com.t.s.model.dto.UserDto;

public interface UserBiz {
	public UserDto login(String id, String pw);
	public UserDto idchk(String id);
	public int regist(UserDto dto);
	public String searchpassword(String id);
	public UserDto myinfo(String id); 
	public int dropuser(String id);
	public int updateuser(UserDto dto);
}
