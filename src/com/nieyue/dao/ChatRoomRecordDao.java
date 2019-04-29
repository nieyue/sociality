package com.nieyue.dao;

import com.nieyue.bean.ChatRoomRecord;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 聊天房聊天记录数据库接口
 * @author yy
 *
 */
@Mapper
public interface ChatRoomRecordDao {
    /** 新增*/
    public boolean add(ChatRoomRecord chatRoomRecord) ;
    /** 删除 */
    public boolean delete(Integer chatRoomRecordId) ;
    /** 更新*/
    public boolean update(ChatRoomRecord chatRoomRecord);
    /** 装载 */
    public ChatRoomRecord load(Integer chatRoomRecordId);
    /**总共数目 */
    public int count(
            @Param("chatRoomId") Integer chatRoomId,
            @Param("fromAccountId") Integer fromAccountId,
            @Param("toAccountId") Integer toAccountId
    );
    /** 列表 */
    public List<ChatRoomRecord> list(
            @Param("chatRoomId") Integer chatRoomId,
            @Param("fromAccountId") Integer fromAccountId,
            @Param("toAccountId") Integer toAccountId,
            @Param("pageNum") int pageNum,
            @Param("pageSize") int pageSize,
            @Param("orderName") String orderName,
            @Param("orderWay") String orderWay) ;
}