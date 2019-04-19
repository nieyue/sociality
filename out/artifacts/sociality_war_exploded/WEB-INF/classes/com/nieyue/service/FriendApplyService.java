package com.nieyue.service;

import com.nieyue.bean.FriendApply;

import java.util.List;

/**
 * 好友申请逻辑层接口
 * @author yy
 *
 */
public interface FriendApplyService {
	/** 新增 */
	public boolean add(FriendApply friendApply) ;
	/** 删除 */
	public boolean delete(Integer friendApplyId) ;
	/** 更新*/
	public boolean update(FriendApply friendApply);
	/** 装载 */
	public FriendApply load(Integer friendApplyId);
	/** 数目 */
	public int count(Integer accountId,
					 Integer friendAccountId,
					 Integer status
					 );
	/** 列表 */
	public List<FriendApply> list(
            Integer accountId,
			Integer friendAccountId,
			Integer status,
            int pageNum,
            int pageSize,
            String orderName,
            String orderWay) ;
}
