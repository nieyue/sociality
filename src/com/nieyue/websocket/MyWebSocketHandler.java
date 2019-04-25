package com.nieyue.websocket;

import com.nieyue.bean.ChatRoomRecord;
import com.nieyue.service.ChatRoomMemberService;
import com.nieyue.service.ChatRoomRecordService;
import com.nieyue.service.ChatRoomService;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.*;

import java.io.IOException;
import java.util.Iterator;
import java.util.Map;

@Component
public class MyWebSocketHandler implements WebSocketHandler {

	@Autowired
	private ChatRoomRecordService chatRoomRecordService;
	@Autowired
	private ChatRoomService chatRoomService;
	@Autowired
	private ChatRoomMemberService chatRoomMemberService;

	//握手实现连接后
	public void afterConnectionEstablished(WebSocketSession webSocketSession)
			throws Exception {
		int accountId = (Integer) webSocketSession.getAttributes().get("accountId");
		if (WebSocketMapService.get(accountId) == null) {
			WebSocketMapService.put(accountId, webSocketSession);
		}
	}
	//链接关闭后
	public void afterConnectionClosed(WebSocketSession webSocketSession,
									  CloseStatus closeStatus) throws Exception {
		//断开连接即将此用户对应的WebSocketSession移除，以便再次连接时添加新的WebSocketSession
		Iterator<Map.Entry<Integer, WebSocketSession>> iterator = WebSocketMapService
				.entrySet().iterator();
		while (iterator.hasNext()) {
			Map.Entry<Integer, WebSocketSession> entry = iterator.next();
			if (entry.getValue().getAttributes()
					.get("accountId") == webSocketSession.getAttributes()
					.get("accountId")) {
				WebSocketMapService.remove((Integer) webSocketSession
						.getAttributes().get("accountId"));
			}
		}
	}
	//发送信息前的处理
	public void handleMessage(WebSocketSession webSocketSession,
							  WebSocketMessage<?> webSocketMessage) throws Exception {

		if (webSocketMessage.getPayloadLength() == 0)
			return;
		//获取Socket通道中的数据
		JSONObject object = JSONObject
				.fromObject(webSocketMessage.getPayload().toString());
		System.out.println(object.toString());
		ChatRoomRecord chatRoomRecord = new ChatRoomRecord();
		chatRoomRecord.setAccountId(object.getInt("accountId"));
		chatRoomRecord.setContent(object.getString("content"));
		//...
		//将信息保存至数据库
		//chatRoomRecordService.add(chatRoomRecord);
		// 给用户发送消息
		sendMessageToUser(chatRoomRecord.getAccountId(),
				new TextMessage(JSONObject.fromObject(chatRoomRecord).toString()));
		System.out.println("handleMessage.....");
	}

	public void handleTransportError(WebSocketSession webSocketSession,
									 Throwable throwable) throws Exception {

	}


	public boolean supportsPartialMessages() {
		return false;
	}

	//发送信息的实现
	public void sendMessageToUser(Integer accountId, TextMessage message)
			throws IOException {
		WebSocketSession session = WebSocketMapService.get(accountId);
		if (session != null && session.isOpen()) {
			session.sendMessage(message);
		}
	}
}