package com.nieyue.websocket;

import com.nieyue.bean.ChatRoomMember;
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
import java.util.List;
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
		//System.out.println(object.toString());
		ChatRoomRecord chatRoomRecord = new ChatRoomRecord();
		chatRoomRecord.setChatRoomId(object.getInt("chatRoomId"));
		chatRoomRecord.setContent(object.getString("content"));
		try{
			//获取历史数据(接受端数据)
			chatRoomRecord.setToAccountId(object.getInt("toAccountId"));
			int number = object.getInt("number");
			if(number>0){
				List<ChatRoomRecord> crrlist = chatRoomRecordService.list(chatRoomRecord.getChatRoomId(), null,chatRoomRecord.getToAccountId(), 1, number, "chat_room_record_id", "desc");
				for (int i = crrlist.size()-1; i >=0 ; i--) {
					ChatRoomRecord crr = crrlist.get(i);
					// 给用户发送消息
					sendMessageToUser(crr.getToAccountId(),
							new TextMessage(JSONObject.fromObject(crr).toString()));
				}
				return;
			}
		}catch (Exception e){

		}
			chatRoomRecord.setFromAccountId(object.getInt("fromAccountId"));
			//获取聊天房里的所有成员
			List<ChatRoomMember> chatRoomMemberList = chatRoomMemberService.list(chatRoomRecord.getChatRoomId(), null,null, 1, Integer.MAX_VALUE, "chat_room_member_id", "asc");
			//获取发送端的账户
			for (int i = 0; i < chatRoomMemberList.size(); i++) {
				if(chatRoomRecord.getFromAccountId().equals(chatRoomMemberList.get(i).getAccountId())){
					chatRoomRecord.setFromAccount(chatRoomMemberList.get(i).getAccount());
				}
			}
			//发给所有接受端
			for (int i = 0; i < chatRoomMemberList.size(); i++) {
				ChatRoomMember chatRoomMember = chatRoomMemberList.get(i);
				ChatRoomRecord crr=new ChatRoomRecord();
				crr.setContent(chatRoomRecord.getContent());
				crr.setFromAccountId(chatRoomRecord.getFromAccountId());//发送端账户id
				crr.setToAccountId(chatRoomMember.getAccountId());//接受端账户id
				crr.setChatRoomId(chatRoomRecord.getChatRoomId());
				//发送方的账户
				crr.setFromAccount(chatRoomRecord.getFromAccount());
				boolean b = chatRoomRecordService.add(crr);
				if(b){
					// 给用户发送消息
					sendMessageToUser(chatRoomMember.getAccountId(),
							new TextMessage(JSONObject.fromObject(crr).toString()));
				}
			}


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