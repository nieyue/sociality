package com.nieyue.service.impl;

import com.nieyue.bean.Account;
import com.nieyue.bean.ChatRoomMember;
import com.nieyue.dao.ChatRoomMemberDao;
import com.nieyue.service.AccountService;
import com.nieyue.service.ChatRoomMemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

@Service
public class ChatRoomMemberServiceImpl implements ChatRoomMemberService{
	@Resource
	ChatRoomMemberDao chatRoomMemberDao;
	@Autowired
	AccountService accountService;
	@Transactional(propagation=Propagation.REQUIRED)
	@Override
	public boolean add(ChatRoomMember chatRoomMember) {
		chatRoomMember.setCreateDate(new Date());
		chatRoomMember.setUpdateDate(new Date());
		boolean b = chatRoomMemberDao.add(chatRoomMember);
		return b;
	}
	@Transactional(propagation=Propagation.REQUIRED)
	@Override
	public boolean delete(Integer chatRoomMemberId) {
		boolean b = chatRoomMemberDao.delete(chatRoomMemberId);
		return b;
	}
	@Transactional(propagation= Propagation.REQUIRED)
	@Override
	public boolean update(ChatRoomMember chatRoomMember) {
		chatRoomMember.setUpdateDate(new Date());
		boolean b = chatRoomMemberDao.update(chatRoomMember);
		return b;
	}

	@Override
	public ChatRoomMember load(Integer chatRoomMemberId) {
		ChatRoomMember r = chatRoomMemberDao.load(chatRoomMemberId);
		if(r!=null){
			Account account = accountService.load(r.getAccountId());
			r.setAccount(account);
		}
		return r;
	}

	@Override
	public int count(Integer chatRoomId,
					 Integer accountId) {
		int c =chatRoomMemberDao.count(chatRoomId, accountId);
		return c;
	}

	@Override
	public List<ChatRoomMember> list(Integer chatRoomId,
									 Integer accountId,int pageNum, int pageSize,
			String orderName, String orderWay) {
		if(pageNum<1){
			pageNum=1;
		}
		if(pageSize<1){
			pageSize=0;//没有数据
		}
		List<ChatRoomMember> l = chatRoomMemberDao.list(chatRoomId,accountId,pageNum-1, pageSize, orderName, orderWay);
		l.forEach(r->{
			if(r!=null){
				Account account = accountService.load(r.getAccountId());
				r.setAccount(account);
			}
		});
		return l;
	}

	
}
