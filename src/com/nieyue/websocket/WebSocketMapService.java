package com.nieyue.websocket;

import org.springframework.web.socket.WebSocketSession;

import java.util.Collection;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ConcurrentMap;

public class WebSocketMapService {
	public static final ConcurrentMap<Integer, WebSocketSession> webSocketSessionMap;
	static {
		webSocketSessionMap = new ConcurrentHashMap<Integer, WebSocketSession>();
	}
 
	public static void put(Integer key, WebSocketSession myWebSocket) {
		webSocketSessionMap.put(key, myWebSocket);
	}
 
	public static WebSocketSession get(Integer key) {
		return webSocketSessionMap.get(key);
	}
 
	public static void remove(Integer key) {
		webSocketSessionMap.remove(key);
	}
 
	public static Collection<WebSocketSession> getValues() {
		return webSocketSessionMap.values();
	}
 
	public static Set<Map.Entry<Integer, WebSocketSession>> entrySet() {
		return webSocketSessionMap.entrySet();
	}
}