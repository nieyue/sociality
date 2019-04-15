package com.nieyue.dao;

import com.nieyue.bean.Circle;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 朋友圈数据库接口
 * @author yy
 *
 */
@Mapper
public interface CircleDao {
    /** 新增*/
    public boolean add(Circle circle) ;
    /** 删除 */
    public boolean delete(Integer circleId) ;
    /** 更新*/
    public boolean update(Circle circle);
    /** 装载 */
    public Circle load(Integer circleId);
    /**总共数目 */
    public int count(@Param("accountId") Integer accountId);
    /** 列表 */
    public List<Circle> list(
            @Param("accountId") Integer accountId,
            @Param("pageNum") int pageNum,
            @Param("pageSize") int pageSize,
            @Param("orderName") String orderName,
            @Param("orderWay") String orderWay) ;
}