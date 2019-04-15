package com.nieyue.service.impl;

import com.nieyue.bean.ChatRecord;
import com.nieyue.dao.ChatRecordDao;
import com.nieyue.service.ChatRecordService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

@Service
public class ChatRecordServiceImpl implements ChatRecordService{
	@Resource
	ChatRecordDao chatRecordDao;
	@Transactional(propagation=Propagation.REQUIRED)
	@Override
	public boolean add(ChatRecord chatRecord) {
		chatRecord.setCreateDate(new Date());
		chatRecord.setUpdateDate(new Date());
		boolean b = chatRecordDao.add(chatRecord);
		return b;
	}
	@Transactional(propagation=Propagation.REQUIRED)
	@Override
	public boolean delete(Integer chatRecordId) {
		boolean b = chatRecordDao.delete(chatRecordId);
		return b;
	}
	@Transactional(propagation= Propagation.REQUIRED)
	@Override
	public boolean update(ChatRecord chatRecord) {
		chatRecord.setUpdateDate(new Date());
		boolean b = chatRecordDao.update(chatRecord);
		return b;
	}

	@Override
	public ChatRecord load(Integer chatRecordId) {
		ChatRecord r = chatRecordDao.load(chatRecordId);
		return r;
	}

	@Override
	public int count(Integer accountId,Integer toAccountId) {
		int c = chatRecordDao.count(accountId, toAccountId);
		return c;
	}

	@Override
	public List<ChatRecord> list(Integer accountId,Integer toAccountId,int pageNum, int pageSize,
			String orderName, String orderWay) {
		if(pageNum<1){
			pageNum=1;
		}
		if(pageSize<1){
			pageSize=0;//没有数据
		}
		List<ChatRecord> l = chatRecordDao.list(accountId,toAccountId,pageNum-1, pageSize, orderName, orderWay);
		return l;
	}

	
}
