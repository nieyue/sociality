package com.nieyue.dao;

import com.nieyue.bean.ChatRecord;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 聊天记录数据库接口
 * @author yy
 *
 */
@Mapper
public interface ChatRecordDao {
    /** 新增*/
    public boolean add(ChatRecord chatRecord) ;
    /** 删除 */
    public boolean delete(Integer chatRecordId) ;
    /** 更新*/
    public boolean update(ChatRecord chatRecord);
    /** 装载 */
    public ChatRecord load(Integer chatRecordId);
    /**总共数目 */
    public int count(@Param("accountId") Integer accountId,
                     @Param("toAccountId") Integer toAccountId);
    /** 列表 */
    public List<ChatRecord> list(
            @Param("accountId") Integer accountId,
            @Param("toAccountId") Integer toAccountId,
            @Param("pageNum") int pageNum,
            @Param("pageSize") int pageSize,
            @Param("orderName") String orderName,
            @Param("orderWay") String orderWay) ;
}