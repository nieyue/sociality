package com.nieyue.service;

import com.nieyue.bean.ChatRoom;

import java.util.List;

/**
 * 聊天房逻辑层接口
 * @author yy
 *
 */
public interface ChatRoomService {
	/** 新增 */
	public boolean add(ChatRoom chatRoom) ;
	/** 删除 */
	public boolean delete(Integer chatRoomId) ;
	/** 更新*/
	public boolean update(ChatRoom chatRoom);
	/** 装载 */
	public ChatRoom load(Integer chatRoomId);
	/** 数目 */
	public int count(Integer accountId,Integer type);
	/** 列表 */
	public List<ChatRoom> list(
            Integer accountId,
            Integer type,
            int pageNum,
            int pageSize,
            String orderName,
            String orderWay) ;
}
