package com.nieyue.service;

import com.nieyue.bean.ChatRecord;

import java.util.List;

/**
 * 聊天记录逻辑层接口
 * @author yy
 *
 */
public interface ChatRecordService {
	/** 新增 */
	public boolean add(ChatRecord chatRecord) ;
	/** 删除 */
	public boolean delete(Integer chatRecordId) ;
	/** 更新*/
	public boolean update(ChatRecord chatRecord);
	/** 装载 */
	public ChatRecord load(Integer chatRecordId);
	/** 数目 */
	public int count(Integer accountId, Integer toAccountId);
	/** 列表 */
	public List<ChatRecord> list(
            Integer accountId,
            Integer toAccountId,
            int pageNum,
            int pageSize,
            String orderName,
            String orderWay) ;
}
