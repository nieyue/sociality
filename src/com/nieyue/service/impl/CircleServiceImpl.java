package com.nieyue.service.impl;

import com.nieyue.bean.Circle;
import com.nieyue.dao.CircleDao;
import com.nieyue.service.CircleService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

@Service
public class CircleServiceImpl implements CircleService{
	@Resource
	CircleDao circleDao;
	@Transactional(propagation=Propagation.REQUIRED)
	@Override
	public boolean add(Circle circle) {
		circle.setCreateDate(new Date());
		circle.setUpdateDate(new Date());
		boolean b = circleDao.add(circle);
		return b;
	}
	@Transactional(propagation=Propagation.REQUIRED)
	@Override
	public boolean delete(Integer circleId) {
		boolean b = circleDao.delete(circleId);
		return b;
	}
	@Transactional(propagation= Propagation.REQUIRED)
	@Override
	public boolean update(Circle circle) {
		circle.setUpdateDate(new Date());
		boolean b = circleDao.update(circle);
		return b;
	}

	@Override
	public Circle load(Integer circleId) {
		Circle r = circleDao.load(circleId);
		return r;
	}

	@Override
	public int count(Integer accountId) {
		int c = circleDao.count(accountId);
		return c;
	}

	@Override
	public List<Circle> list(Integer accountId,int pageNum, int pageSize,
			String orderName, String orderWay) {
		if(pageNum<1){
			pageNum=1;
		}
		if(pageSize<1){
			pageSize=0;//没有数据
		}
		List<Circle> l = circleDao.list(accountId,pageNum-1, pageSize, orderName, orderWay);
		return l;
	}

	
}
