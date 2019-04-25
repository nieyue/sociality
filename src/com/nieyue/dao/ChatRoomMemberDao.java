package com.nieyue.dao;

import com.nieyue.bean.ChatRoomMember;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 聊天房成员数据库接口
 * @author yy
 *
 */
@Mapper
public interface ChatRoomMemberDao {
    /** 新增*/
    public boolean add(ChatRoomMember chatRoomMember) ;
    /** 删除 */
    public boolean delete(Integer chatRoomMemberId) ;
    /** 更新*/
    public boolean update(ChatRoomMember chatRoomMember);
    /** 装载 */
    public ChatRoomMember load(Integer chatRoomMemberId);
    /**总共数目 */
    public int count( @Param("chatRoomId") Integer chatRoomId,
                      @Param("accountId") Integer accountId);
    /** 列表 */
    public List<ChatRoomMember> list(
            @Param("chatRoomId") Integer chatRoomId,
            @Param("accountId") Integer accountId,
            @Param("pageNum") int pageNum,
            @Param("pageSize") int pageSize,
            @Param("orderName") String orderName,
            @Param("orderWay") String orderWay) ;
}