package com.nieyue.service.impl;

import com.nieyue.bean.Account;
import com.nieyue.bean.Friend;
import com.nieyue.dao.FriendDao;
import com.nieyue.service.AccountService;
import com.nieyue.service.FriendService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

@Service
public class FriendServiceImpl implements FriendService{
	@Autowired
	FriendDao friendDao;
	@Autowired
	AccountService accountService;
	@Transactional(propagation=Propagation.REQUIRED)
	@Override
	public boolean add(Friend friend) {
		friend.setCreateDate(new Date());
		friend.setUpdateDate(new Date());
		boolean b = friendDao.add(friend);
		return b;
	}
	@Transactional(propagation=Propagation.REQUIRED)
	@Override
	public boolean delete(Integer friendId) {
		boolean b = friendDao.delete(friendId);
		return b;
	}
	@Transactional(propagation= Propagation.REQUIRED)
	@Override
	public boolean update(Friend friend) {
		friend.setUpdateDate(new Date());
		boolean b = friendDao.update(friend);
		return b;
	}

	@Override
	public Friend load(Integer friendId) {
		Friend r = friendDao.load(friendId);
		if(r!=null){
			Account account = accountService.load(r.getFriendAccountId());
			r.setFriendAccount(account);
		}
		return r;
	}

	@Override
	public int count(Integer accountId,Integer friendAccountId) {
		int c = friendDao.count(accountId, friendAccountId);
		return c;
	}

	@Override
	public List<Friend> list(Integer accountId,Integer friendAccountId,int pageNum, int pageSize,
			String orderName, String orderWay) {
		if(pageNum<1){
			pageNum=1;
		}
		if(pageSize<1){
			pageSize=0;//没有数据
		}
		List<Friend> l = friendDao.list(accountId,friendAccountId,pageNum-1, pageSize, orderName, orderWay);
		l.forEach(r->{
			if(r!=null){
				Account account = accountService.load(r.getFriendAccountId());
				r.setFriendAccount(account);
			}
		});
		return l;
	}

	
}
