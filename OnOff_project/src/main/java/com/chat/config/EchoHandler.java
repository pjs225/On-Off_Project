package com.chat.config;

import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.t.s.model.biz.SessionIdsBiz;
import com.t.s.model.dto.GroupUserDto;
import com.t.s.model.dto.SessionIds;


public class EchoHandler extends TextWebSocketHandler {

	//private Map<SessionIds, WebSocketSession> sessionList = new HashMap<>();
	
	private Map<Integer, SingleMoim> moims = new HashMap<Integer, SingleMoim>();
	
	SingleMoim singleMoim = new SingleMoim();
	
	GroupUserDto dto = new GroupUserDto();
	// 웹소켓 서버에 클라이언트가 접속하면 호출되는 메소드
	
	int groupnumber = 0;
	
	@Autowired
	SessionIdsBiz biz;
	//아이디 저장하고 불러오고 해야할 biz	
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		Map<String, Object> map = session.getAttributes();
		dto = (GroupUserDto)map.get("groupUserdto"); //아이디랑 그룹넘버 불러옴
		
		SessionIds ids = new SessionIds();
		ids.setSessionid(session.getId());
		System.out.println(session.getId()+" : 들어가는 sessionid");
		ids.setUserid(dto.getUserid());
		System.out.println(dto.getUserid()+" : 들어가는 userid");
		ids.setGroupno(dto.getGroupno());
		System.out.println(dto.getGroupno()+" : 들어가는 groupno");
		
        boolean makeYN = true;
        
        // 해당하는 그룹넘버가 있나 확인
        // 그룹넘버가 없으면 새로 생성하고 있으면 해당하는 그룹을 불러와서 추가하기
        //nowMoim.addSession(ids, session);
		
        //singleMoim.addSession(ids, session);
        
        //지금 열려있는 채팅창이 있을 경우
        for(Entry<Integer, SingleMoim> presentGroup:moims.entrySet()) {
        	if(presentGroup.getKey()==dto.getGroupno()) {
        		singleMoim = presentGroup.getValue();
        		singleMoim.addSession(ids, session);
        		System.out.println("지금 열려있는 채팅창이 있을 경우");
        		makeYN=false;
        		break;
        	}
        }
        
        if(makeYN) {
        	singleMoim=new SingleMoim();
        	singleMoim.addSession(ids, session);
        	
        	moims.put(dto.getGroupno(), singleMoim);
        	//잘들어갔나 확인용
        	for(Entry<SessionIds, WebSocketSession> s:moims.get(dto.getGroupno()).getSessionMap().entrySet()) {
        		System.out.println(s.getKey().getUserid());
        	}
        	System.out.println("새로만들었다.");
        }else {
        	moims.get(dto.getGroupno()).addSession(ids, session);
        	System.out.println("기존에 있던것을 사용했다.");
        }
		
		System.out.println(dto.getUserid()+" 가 입장하였습니다.");

		int res = 0;
        res = biz.insertIds(ids);
        
        if(res != 0) {
        	System.out.println("sessionids 잘 들어갔음");
        }

	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		
		SingleMoim s = null;
		
		groupnumber=biz.selectOne(session.getId()).getGroupno();
		
		for(Map.Entry<Integer, SingleMoim> presentGroup : moims.entrySet()) {
			if(presentGroup.getKey() == groupnumber) {
				s = presentGroup.getValue();
				System.out.println("해당하는 그룹넘버["+presentGroup.getKey()+"] 를 찾았다!");
				break;
			}
		}
		
		for(Map.Entry<SessionIds, WebSocketSession> entry : s.getSessionMap().entrySet()) {
			entry.getValue().sendMessage(new TextMessage(biz.selectOne(session.getId()).getUserid()+" : "+message.getPayload()));
		}
		System.out.println(session.getId()+" 가 보낸 매세지[" + message.getPayload()+"]");

	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		//singleMoim.getSessionMap().get(session);
		
		groupnumber=biz.selectOne(session.getId()).getGroupno();

		for(Entry<SessionIds, WebSocketSession>	entry:moims.get(groupnumber).getSessionMap().entrySet()) {
			if(entry.getKey().getSessionid()==session.getId()) { 
				SessionIds rmkey = entry.getKey(); moims.get(groupnumber).getSessionMap().remove(rmkey); 
			}
		}
		 
		System.out.println(session.getId()+"가 나가셨습니다.");
	}
	
	// 웹소켓 서버측에 텍스트 메시지가 접수되면 호출되는 메소드
 /*   @Override
    public void handleMessage(WebSocketSession session, WebSocketMessage<?> message) throws Exception {
        String payloadMessage = (String) message.getPayload();
        System.out.println("서버에 도착한 메시지:"+payloadMessage);
        for(WebSocketSession sess : sessionList) {
        	session.sendMessage(new TextMessage(session.getId()+" : " + payloadMessage));
        }
        Map<String, Object> map = session.getAttributes();
        GroupUserDto dto = (GroupUserDto)map.get("dto");
        System.out.println("전송자 아이디:"+dto.getUserid());
    }*/
    
    // 메시지 전송시나 접속해제시 오류가 발생할 때 호출되는 메소드
    @Override
    public void handleTransportError(WebSocketSession session,
            Throwable exception) throws Exception {
        super.handleTransportError(session, exception);
        System.out.println("전송오류 발생");
    } 



	
	
}
