package com.nieyue.service;

import com.nieyue.bean.Circle;

import java.util.List;

/**
 * 朋友圈逻辑层接口
 * @author yy
 *
 */
public interface CircleService {
	/** 新增 */
	public boolean add(Circle circle) ;
	/** 删除 */
	public boolean delete(Integer circleId) ;
	/** 更新*/
	public boolean update(Circle circle);
	/** 装载 */
	public Circle load(Integer circleId);
	/** 数目 */
	public int count(Integer accountId);
	/** 列表 */
	public List<Circle> list(
            Integer accountId,
            int pageNum,
            int pageSize,
            String orderName,
            String orderWay) ;
}
