package com.nieyue.dao;

import com.nieyue.bean.Friend;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 好友数据库接口
 * @author yy
 *
 */
@Mapper
public interface FriendDao {
    /** 新增*/
    public boolean add(Friend friend) ;
    /** 删除 */
    public boolean delete(Integer friendId) ;
    /** 更新*/
    public boolean update(Friend friend);
    /** 装载 */
    public Friend load(Integer friendId);
    /**总共数目 */
    public int count(@Param("accountId") Integer accountId,
                     @Param("friendAccountId") Integer friendAccountId);
    /** 列表 */
    public List<Friend> list(
            @Param("accountId") Integer accountId,
            @Param("friendAccountId") Integer friendAccountId,
            @Param("pageNum") int pageNum,
            @Param("pageSize") int pageSize,
            @Param("orderName") String orderName,
            @Param("orderWay") String orderWay) ;
}