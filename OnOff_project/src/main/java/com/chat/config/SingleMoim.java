package com.chat.config;

import java.util.HashMap; 
import java.util.Map;

import org.springframework.web.socket.WebSocketSession;

import com.t.s.model.dto.SessionIds;

public class SingleMoim {

	private Map<SessionIds, WebSocketSession> sessionMap; //한개의 모임세션

	public SingleMoim() {
		sessionMap=new HashMap<SessionIds, WebSocketSession>();
	}
	
	public Map<SessionIds, WebSocketSession> getSessionMap() {
		return sessionMap;
	}

	public void setSessionMap(Map<SessionIds, WebSocketSession> sessionMap) {
		this.sessionMap = sessionMap;
	}
	
	public void addSession(SessionIds key, WebSocketSession session) {
		sessionMap.put(key, session);
	}
	
	public String findSession(SessionIds ids) {
		for(Map.Entry<SessionIds, WebSocketSession> entry : sessionMap.entrySet()){
			if(entry.getKey().getSessionid() == ids.getSessionid()) {
				return entry.getKey().getSessionid();
			}
		}
		return null;
	} 

	
}
