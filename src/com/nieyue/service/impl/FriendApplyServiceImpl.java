package com.nieyue.service.impl;

import com.nieyue.bean.Account;
import com.nieyue.bean.FriendApply;
import com.nieyue.dao.FriendApplyDao;
import com.nieyue.service.AccountService;
import com.nieyue.service.FriendApplyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

@Service
public class FriendApplyServiceImpl implements FriendApplyService{
	@Autowired
	FriendApplyDao friendApplyDao;
	@Autowired
	AccountService accountService;
	@Transactional(propagation=Propagation.REQUIRED)
	@Override
	public boolean add(FriendApply friendApply) {
		friendApply.setCreateDate(new Date());
		friendApply.setUpdateDate(new Date());
		boolean b = friendApplyDao.add(friendApply);
		return b;
	}
	@Transactional(propagation=Propagation.REQUIRED)
	@Override
	public boolean delete(Integer friendApplyId) {
		boolean b = friendApplyDao.delete(friendApplyId);
		return b;
	}
	@Transactional(propagation= Propagation.REQUIRED)
	@Override
	public boolean update(FriendApply friendApply) {
		friendApply.setUpdateDate(new Date());
		boolean b = friendApplyDao.update(friendApply);
		return b;
	}

	@Override
	public FriendApply load(Integer friendApplyId) {
		FriendApply r = friendApplyDao.load(friendApplyId);
		if(r!=null){
			Account account = accountService.load(r.getAccountId());
			r.setAccount(account);
		}
		return r;
	}

	@Override
	public int count(Integer accountId,Integer friendAccountId,Integer status) {
		int c = friendApplyDao.count(accountId, friendAccountId,status);
		return c;
	}

	@Override
	public List<FriendApply> list(Integer accountId,Integer friendAccountId,Integer status,int pageNum, int pageSize,
			String orderName, String orderWay) {
		if(pageNum<1){
			pageNum=1;
		}
		if(pageSize<1){
			pageSize=0;//没有数据
		}
		List<FriendApply> l = friendApplyDao.list(accountId,friendAccountId,status,pageNum-1, pageSize, orderName, orderWay);
		l.forEach(r->{
			if(r!=null){
				Account account = accountService.load(r.getAccountId());
				r.setAccount(account);
			}
		});
		return l;
	}

	
}
