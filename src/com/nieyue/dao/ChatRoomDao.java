package com.nieyue.dao;

import com.nieyue.bean.ChatRoom;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 聊天房数据库接口
 * @author yy
 *
 */
@Mapper
public interface ChatRoomDao {
    /** 新增*/
    public boolean add(ChatRoom chatRoom) ;
    /** 删除 */
    public boolean delete(Integer chatRoomId) ;
    /** 更新*/
    public boolean update(ChatRoom chatRoom);
    /** 装载 */
    public ChatRoom load(Integer chatRoomId);
    /**总共数目 */
    public int count(@Param("accountId") Integer accountId);
    /** 列表 */
    public List<ChatRoom> list(
            @Param("accountId") Integer accountId,
            @Param("pageNum") int pageNum,
            @Param("pageSize") int pageSize,
            @Param("orderName") String orderName,
            @Param("orderWay") String orderWay) ;
}