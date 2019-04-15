package com.nieyue.service.impl;

import com.nieyue.bean.Notice;
import com.nieyue.dao.NoticeDao;
import com.nieyue.service.NoticeService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

@Service
public class NoticeServiceImpl implements NoticeService{
	@Resource
	NoticeDao noticeDao;
	@Transactional(propagation=Propagation.REQUIRED)
	@Override
	public boolean add(Notice notice) {
		notice.setCreateDate(new Date());
		notice.setUpdateDate(new Date());
		boolean b = noticeDao.add(notice);
		return b;
	}
	@Transactional(propagation=Propagation.REQUIRED)
	@Override
	public boolean delete(Integer noticeId) {
		boolean b = noticeDao.delete(noticeId);
		return b;
	}
	@Transactional(propagation= Propagation.REQUIRED)
	@Override
	public boolean update(Notice notice) {
		notice.setUpdateDate(new Date());
		boolean b = noticeDao.update(notice);
		return b;
	}

	@Override
	public Notice load(Integer noticeId) {
		Notice r = noticeDao.load(noticeId);
		return r;
	}

	@Override
	public int count() {
		int c = noticeDao.count();
		return c;
	}

	@Override
	public List<Notice> list(int pageNum, int pageSize,
			String orderName, String orderWay) {
		if(pageNum<1){
			pageNum=1;
		}
		if(pageSize<1){
			pageSize=0;//没有数据
		}
		List<Notice> l = noticeDao.list(pageNum-1, pageSize, orderName, orderWay);
		return l;
	}

	
}
