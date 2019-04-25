package com.nieyue.websocket;

import com.nieyue.bean.Account;
import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.http.server.ServletServerHttpRequest;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.server.HandshakeInterceptor;

import javax.servlet.http.HttpSession;
import java.util.Map;

public class MyHandShakeInterceptor implements HandshakeInterceptor {
 
	public boolean beforeHandshake(ServerHttpRequest serverHttpRequest,
								   ServerHttpResponse serverHttpResponse,
								   WebSocketHandler webSocketHandler, Map<String, Object> map)
			throws Exception {
		if (serverHttpRequest instanceof ServletServerHttpRequest) {
			ServletServerHttpRequest servletRequest = (ServletServerHttpRequest) serverHttpRequest;
			HttpSession session = servletRequest.getServletRequest()
					.getSession(false);
			// 获取登录时保存到session中的用户信息
			Account account = (Account) session.getAttribute("account");
			if (account != null) {
				map.put("accountId", account.getAccountId());//为服务器创建WebSocketSession做准备
			} else {
				return false;
			}
		}
		return true;
	}
 
	public void afterHandshake(ServerHttpRequest serverHttpRequest,
			ServerHttpResponse serverHttpResponse,
			WebSocketHandler webSocketHandler, Exception e) {
 
	}
}