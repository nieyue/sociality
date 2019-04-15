package com.nieyue.service;

import com.nieyue.bean.CircleComment;

import java.util.List;

/**
 * 朋友圈评论逻辑层接口
 * @author yy
 *
 */
public interface CircleCommentService {
	/** 新增 */
	public boolean add(CircleComment circleComment) ;
	/** 删除 */
	public boolean delete(Integer circleCommentId) ;
	/** 更新*/
	public boolean update(CircleComment circleComment);
	/** 装载 */
	public CircleComment load(Integer circleCommentId);
	/** 数目 */
	public int count(Integer accountId);
	/** 列表 */
	public List<CircleComment> list(
            Integer accountId,
            int pageNum,
            int pageSize,
            String orderName,
            String orderWay) ;
}
