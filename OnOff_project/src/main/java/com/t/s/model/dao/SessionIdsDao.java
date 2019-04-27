package com.t.s.model.dao;

import com.t.s.model.dto.SessionIds;

public interface SessionIdsDao {
	
	String NAMESPACE = "onoff.";
	
	public int insertIds(SessionIds sessionIds);
	public int deleteIds(String sessionIds);
	public SessionIds selectOne(String ids);

}
