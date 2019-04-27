package com.t.s.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.t.s.model.dto.SessionIds;

@Repository
public class SessionIdsDaoImpl implements SessionIdsDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int insertIds(SessionIds sessionIds) {
		int res = 0;
		
		try {
			res = sqlSession.insert(NAMESPACE+"insertSessionIds",sessionIds);
		}catch(Exception e) {
			System.out.println("insertSession 오류");
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int deleteIds(String sessionIds) {
		int res = 0;
		
		res = sqlSession.delete(NAMESPACE+"deleteSessionIds",sessionIds);
		
		return res;
	}

	@Override
	public SessionIds selectOne(String ids) {
		SessionIds id = null;
		
		id = sqlSession.selectOne(NAMESPACE+"selectSession",ids);
		
		return id;
	}

}
