package com.t.s.model.biz;

import com.t.s.model.dto.SessionIds;

public interface SessionIdsBiz {
	
	public int insertIds(SessionIds ids);
	public int deleteIds(String sessionIds);
	public SessionIds selectOne(String ids);

}
