package com.nieyue.service;

import com.nieyue.bean.Notice;

import java.util.List;

/**
 * 公告逻辑层接口
 * @author yy
 *
 */
public interface NoticeService {
	/** 新增 */
	public boolean add(Notice notice) ;
	/** 删除 */
	public boolean delete(Integer noticeId) ;
	/** 更新*/
	public boolean update(Notice notice);
	/** 装载 */
	public Notice load(Integer noticeId);
	/** 数目 */
	public int count();
	/** 列表 */
	public List<Notice> list(
            int pageNum,
            int pageSize,
            String orderName,
            String orderWay) ;
}
