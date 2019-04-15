package com.nieyue.dao;

import com.nieyue.bean.CircleComment;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 朋友圈评论数据库接口
 * @author yy
 *
 */
@Mapper
public interface CircleCommentDao {
    /** 新增*/
    public boolean add(CircleComment circleComment) ;
    /** 删除 */
    public boolean delete(Integer circleCommentId) ;
    /** 更新*/
    public boolean update(CircleComment circleComment);
    /** 装载 */
    public CircleComment load(Integer circleCommentId);
    /**总共数目 */
    public int count(@Param("accountId") Integer accountId);
    /** 列表 */
    public List<CircleComment> list(
            @Param("accountId") Integer accountId,
            @Param("pageNum") int pageNum,
            @Param("pageSize") int pageSize,
            @Param("orderName") String orderName,
            @Param("orderWay") String orderWay) ;
}