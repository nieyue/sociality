package com.nieyue.service;

import com.nieyue.bean.ChatRoomRecord;

import java.util.List;

/**
 * 聊天房聊天记录逻辑层接口
 * @author yy
 *
 */
public interface ChatRoomRecordService {
	/** 新增 */
	public boolean add(ChatRoomRecord chatRoomRecord) ;
	/** 删除 */
	public boolean delete(Integer chatRoomRecordId) ;
	/** 更新*/
	public boolean update(ChatRoomRecord chatRoomRecord);
	/** 装载 */
	public ChatRoomRecord load(Integer chatRoomRecordId);
	/** 数目 */
	public int count(Integer chatRoomId,Integer fromAccountId,Integer toAccountId);
	/** 列表 */
	public List<ChatRoomRecord> list(
            Integer chatRoomId,
			Integer fromAccountId,
			Integer toAccountId,
            int pageNum,
            int pageSize,
            String orderName,
            String orderWay) ;
}
