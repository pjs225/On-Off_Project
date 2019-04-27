package com.t.s.model.biz;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.t.s.model.dao.UserDao;
import com.t.s.model.dto.UserDto;

@Service
public class UserBizImpl implements UserBiz {
	
	@Autowired
	private UserDao dao;

	@Override
	public UserDto login(String id, String pw) {
		return dao.login(id, pw);
	}

	@Override
	public UserDto idchk(String id) {
		return dao.idchk(id);
	}

	@Override
	public int regist(UserDto dto) {
		return dao.regist(dto);
	}

	@Override
	public String searchpassword(String id) {
		return dao.searchpassword(id);
	}

	@Override
	public UserDto myinfo(String id) {
		return dao.myinfo(id);
	}

	@Override
	public int dropuser(String id) {
		return dao.dropuser(id);
	}

	@Override
	public int updateuser(UserDto dto) {
		return dao.updateuser(dto);
	}

}
