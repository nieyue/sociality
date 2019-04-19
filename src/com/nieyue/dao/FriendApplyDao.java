package com.nieyue.dao;

import com.nieyue.bean.FriendApply;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 好友申请数据库接口
 * @author yy
 *
 */
@Mapper
public interface FriendApplyDao {
    /** 新增*/
    public boolean add(FriendApply friendApply) ;
    /** 删除 */
    public boolean delete(Integer friendApplyId) ;
    /** 更新*/
    public boolean update(FriendApply friendApply);
    /** 装载 */
    public FriendApply load(Integer friendApplyId);
    /**总共数目 */
    public int count(@Param("accountId") Integer accountId,
                     @Param("friendAccountId") Integer friendAccountId,
                     @Param("status") Integer status
    );
    /** 列表 */
    public List<FriendApply> list(
            @Param("accountId") Integer accountId,
            @Param("friendAccountId") Integer friendAccountId,
            @Param("status") Integer status,
            @Param("pageNum") int pageNum,
            @Param("pageSize") int pageSize,
            @Param("orderName") String orderName,
            @Param("orderWay") String orderWay) ;
}