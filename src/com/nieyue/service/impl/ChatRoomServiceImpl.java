package com.nieyue.service.impl;

import com.nieyue.bean.Account;
import com.nieyue.bean.ChatRoom;
import com.nieyue.bean.ChatRoomMember;
import com.nieyue.dao.ChatRoomDao;
import com.nieyue.service.AccountService;
import com.nieyue.service.ChatRoomMemberService;
import com.nieyue.service.ChatRoomService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

@Service
public class ChatRoomServiceImpl implements ChatRoomService{
	@Autowired
	ChatRoomDao chatRoomDao;
	@Autowired
	AccountService accountService;
	@Autowired
	ChatRoomMemberService chatRoomMemberService;
	@Transactional(propagation=Propagation.REQUIRED)
	@Override
	public boolean add(ChatRoom chatRoom) {
		chatRoom.setCreateDate(new Date());
		chatRoom.setUpdateDate(new Date());
		boolean b = chatRoomDao.add(chatRoom);
		return b;
	}
	@Transactional(propagation=Propagation.REQUIRED)
	@Override
	public boolean delete(Integer chatRoomId) {
		boolean b = chatRoomDao.delete(chatRoomId);
		return b;
	}
	@Transactional(propagation= Propagation.REQUIRED)
	@Override
	public boolean update(ChatRoom chatRoom) {
		chatRoom.setUpdateDate(new Date());
		boolean b = chatRoomDao.update(chatRoom);
		return b;
	}

	@Override
	public ChatRoom load(Integer chatRoomId) {
		ChatRoom r = chatRoomDao.load(chatRoomId);
		if(r!=null){
			Account account = accountService.load(r.getAccountId());
			r.setAccount(account);
			List<ChatRoomMember> chatRoomMemberList = chatRoomMemberService.list(chatRoomId, null, 1, Integer.MAX_VALUE, "chat_room_member_id", "desc");
			r.setChatRoomMemberList(chatRoomMemberList);
		}
		return r;
	}

	@Override
	public int count(Integer accountId) {
		int c = chatRoomDao.count(accountId);
		return c;
	}

	@Override
	public List<ChatRoom> list(Integer accountId,int pageNum, int pageSize,
			String orderName, String orderWay) {
		if(pageNum<1){
			pageNum=1;
		}
		if(pageSize<1){
			pageSize=0;//没有数据
		}
		List<ChatRoom> l = chatRoomDao.list(accountId,pageNum-1, pageSize, orderName, orderWay);
		l.forEach(r->{
			if(r!=null){
				Account account = accountService.load(r.getAccountId());
				r.setAccount(account);
				List<ChatRoomMember> chatRoomMemberList = chatRoomMemberService.list(r.getChatRoomId(), null, 1, Integer.MAX_VALUE, "chat_room_member_id", "desc");
				r.setChatRoomMemberList(chatRoomMemberList);
			}
		});
		return l;
	}

	
}
