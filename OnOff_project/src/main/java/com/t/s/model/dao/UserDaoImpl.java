package com.t.s.model.dao;

import com.t.s.model.dto.UserDto;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class UserDaoImpl implements UserDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public UserDto login(String id, String pw) {
		UserDto dto = null;
		
		Map<String, String> map = new HashMap<String, String>();
		
		map.put("userid", id);
		map.put("userpw", pw);
		
		try {
			dto = sqlSession.selectOne(NAMESPACE+"login",map);
		}catch(Exception e) {
			System.out.println("login error");
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public UserDto idchk(String id) {
		UserDto dto = new UserDto();
		
		dto = sqlSession.selectOne(NAMESPACE+"idchk",id);
		
		return dto;
	}

	@Override
	public int regist(UserDto dto) {
		int res = 0;
		
		try {
			res = sqlSession.insert(NAMESPACE+"regist", dto);
		} catch(Exception e) {
			System.out.println("insert error");
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public String searchpassword(String id) {
		String pw = null;
		
		pw = sqlSession.selectOne(NAMESPACE+"searchpassword",id);
		
		return pw;
	}

	@Override
	public UserDto myinfo(String id) {
		UserDto dto = new UserDto();
		
		dto = sqlSession.selectOne(NAMESPACE+"myinfo",id);
		
		return dto;
	}

	@Override
	public int dropuser(String id) {
		int res = 0;
		
		res = sqlSession.delete(NAMESPACE+"dropuser",id);
		
		return res;
	}

	@Override
	public int updateuser(UserDto dto) {
		int res = 0;
		
		try {
			res = sqlSession.update(NAMESPACE+"updateuser", dto);
		} catch(Exception e) {
			System.out.println("update error");
			e.printStackTrace();
		}
				
		return res;
	}

}
