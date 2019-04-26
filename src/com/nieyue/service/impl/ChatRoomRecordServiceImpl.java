package com.nieyue.service.impl;

import com.nieyue.bean.Account;
import com.nieyue.bean.ChatRoomRecord;
import com.nieyue.dao.ChatRoomRecordDao;
import com.nieyue.service.AccountService;
import com.nieyue.service.ChatRoomRecordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

@Service
public class ChatRoomRecordServiceImpl implements ChatRoomRecordService{
	@Autowired
	ChatRoomRecordDao chatRoomRecordDao;
	@Autowired
	AccountService accountService;
	@Transactional(propagation=Propagation.REQUIRED)
	@Override
	public boolean add(ChatRoomRecord chatRoomRecord) {
		chatRoomRecord.setCreateDate(new Date());
		chatRoomRecord.setUpdateDate(new Date());
		boolean b = chatRoomRecordDao.add(chatRoomRecord);
		return b;
	}
	@Transactional(propagation=Propagation.REQUIRED)
	@Override
	public boolean delete(Integer chatRoomRecordId) {
		boolean b = chatRoomRecordDao.delete(chatRoomRecordId);
		return b;
	}
	@Transactional(propagation= Propagation.REQUIRED)
	@Override
	public boolean update(ChatRoomRecord chatRoomRecord) {
		chatRoomRecord.setUpdateDate(new Date());
		boolean b =chatRoomRecordDao.update(chatRoomRecord);
		return b;
	}

	@Override
	public ChatRoomRecord load(Integer chatRoomRecordId) {
		ChatRoomRecord r = chatRoomRecordDao.load(chatRoomRecordId);
		if(r!=null){
			Account account = accountService.load(r.getAccountId());
			r.setAccount(account);
		}
		return r;
	}

	@Override
	public int count(Integer chatRoomId,Integer accountId) {
		int c = chatRoomRecordDao.count(chatRoomId,accountId);
		return c;
	}

	@Override
	public List<ChatRoomRecord> list(Integer chatRoomId,Integer accountId,int pageNum, int pageSize,
			String orderName, String orderWay) {
		if(pageNum<1){
			pageNum=1;
		}
		if(pageSize<1){
			pageSize=0;//没有数据
		}
		List<ChatRoomRecord> l = chatRoomRecordDao.list(chatRoomId,accountId,pageNum-1, pageSize, orderName, orderWay);
		l.forEach(r->{
			if(r!=null){
				Account account = accountService.load(r.getAccountId());
				r.setAccount(account);
			}
		});
		return l;
	}

	
}
