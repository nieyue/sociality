package com.nieyue.service;

import com.nieyue.bean.ChatRoomMember;

import java.util.List;

/**
 * 聊天房成员逻辑层接口
 * @author yy
 *
 */
public interface ChatRoomMemberService {
	/** 新增 */
	public boolean add(ChatRoomMember chatRoomMember) ;
	/** 删除 */
	public boolean delete(Integer chatRoomMemberId) ;
	/** 更新*/
	public boolean update(ChatRoomMember chatRoomMember);
	/** 装载 */
	public ChatRoomMember load(Integer chatRoomMemberId);
	/** 数目 */
	public int count(Integer chatRoomId,
					 Integer accountId);
	/** 列表 */
	public List<ChatRoomMember> list(
			Integer chatRoomId,
			Integer accountId,
            int pageNum,
            int pageSize,
            String orderName,
            String orderWay) ;
}
