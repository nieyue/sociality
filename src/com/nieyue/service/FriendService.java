package com.nieyue.service;

import com.nieyue.bean.Friend;
import io.swagger.models.auth.In;

import java.util.List;

/**
 * 好友逻辑层接口
 * @author yy
 *
 */
public interface FriendService {
	/** 新增 */
	public boolean add(Friend friend) ;
	/** 删除 */
	public boolean delete(Integer friendId) ;
	/** 更新*/
	public boolean update(Friend friend);
	/** 装载 */
	public Friend load(Integer friendId);
	/** 数目 */
	public int count(Integer accountId,Integer friendAccountId);
	/** 列表 */
	public List<Friend> list(
			Integer accountId,
			Integer friendAccountId,
            int pageNum,
            int pageSize,
            String orderName,
            String orderWay) ;
}
