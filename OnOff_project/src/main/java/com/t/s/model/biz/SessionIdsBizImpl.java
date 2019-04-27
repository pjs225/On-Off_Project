package com.t.s.model.biz;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.t.s.model.dao.SessionIdsDao;
import com.t.s.model.dto.SessionIds;

@Service
public class SessionIdsBizImpl implements SessionIdsBiz {
	
	@Autowired
	private SessionIdsDao dao;
	
	@Override
	public int insertIds(SessionIds ids) {
		return dao.insertIds(ids);			
	}

	@Override
	public int deleteIds(String sessionIds) {
		return dao.deleteIds(sessionIds);
	}

	@Override
	public SessionIds selectOne(String ids) {
		return dao.selectOne(ids);
	}

}
