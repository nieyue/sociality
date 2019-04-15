package com.nieyue.service.impl;

import com.nieyue.bean.CircleComment;
import com.nieyue.dao.CircleCommentDao;
import com.nieyue.service.CircleCommentService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

@Service
public class CircleCommentServiceImpl implements CircleCommentService{
	@Resource
	CircleCommentDao circleCommentDao;
	@Transactional(propagation=Propagation.REQUIRED)
	@Override
	public boolean add(CircleComment circleComment) {
		circleComment.setCreateDate(new Date());
		circleComment.setUpdateDate(new Date());
		boolean b = circleCommentDao.add(circleComment);
		return b;
	}
	@Transactional(propagation=Propagation.REQUIRED)
	@Override
	public boolean delete(Integer circleCommentId) {
		boolean b = circleCommentDao.delete(circleCommentId);
		return b;
	}
	@Transactional(propagation= Propagation.REQUIRED)
	@Override
	public boolean update(CircleComment circleComment) {
		circleComment.setUpdateDate(new Date());
		boolean b = circleCommentDao.update(circleComment);
		return b;
	}

	@Override
	public CircleComment load(Integer circleCommentId) {
		CircleComment r = circleCommentDao.load(circleCommentId);
		return r;
	}

	@Override
	public int count(Integer accountId) {
		int c = circleCommentDao.count(accountId);
		return c;
	}

	@Override
	public List<CircleComment> list(Integer accountId,int pageNum, int pageSize,
			String orderName, String orderWay) {
		if(pageNum<1){
			pageNum=1;
		}
		if(pageSize<1){
			pageSize=0;//没有数据
		}
		List<CircleComment> l = circleCommentDao.list(accountId,pageNum-1, pageSize, orderName, orderWay);
		return l;
	}

	
}
