package com.chat.config;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.http.server.ServletServerHttpRequest;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.server.support.HttpSessionHandshakeInterceptor;

import com.t.s.model.dto.GroupUserDto;

public class HandshakeInterceptor extends HttpSessionHandshakeInterceptor{
	
	@Override
    public boolean beforeHandshake(ServerHttpRequest request,ServerHttpResponse response, WebSocketHandler wsHandler,
         Map<String, Object> attributes) throws Exception {    
    
        // 위의 파라미터 중, attributes 에 값을 저장하면 웹소켓 핸들러 클래스의 WebSocketSession에 전달된다
        System.out.println("Before Handshake");
          
        ServletServerHttpRequest ssreq = (ServletServerHttpRequest) request;
        System.out.println("URI:"+request.getURI());
  
        HttpServletRequest req =  ssreq.getServletRequest();
        
        GroupUserDto groupUserdto = new GroupUserDto();
        /*String userId = req.getParameter("userid");
        System.out.println("param, id:"+userId);
        attributes.put("userId", userId);*/
  
        // HttpSession 에 저장된 이용자의 아이디를 추출하는 경우
        
        groupUserdto.setUserid(req.getSession().getAttribute("id").toString());
        System.out.println("handshakerinterceptor에서 받아지는 값 : "+groupUserdto.getUserid());
        int groupnum =0;
        try {
        	groupnum = Integer.parseInt(req.getSession().getAttribute("groupnum").toString());
        }catch (Exception e) {
        	System.out.println("숫자 예외처리함");
        }
        
        
        groupUserdto.setGroupno(groupnum);
        attributes.put("groupUserdto", groupUserdto);
        //attributes.put("groupnum", groupnum);
        System.out.println("HttpSession에 저장된 id:"+groupUserdto.getUserid());
        System.out.println("HttpSession에 저장된 groupnum :" +groupUserdto.getGroupno());
        
        return super.beforeHandshake(request, response, wsHandler, attributes);
    }
   
    @Override
    public void afterHandshake(ServerHttpRequest request, ServerHttpResponse response, WebSocketHandler wsHandler, Exception ex) {
        System.out.println("After Handshake");  
        super.afterHandshake(request, response, wsHandler, ex);
    }


	
}
