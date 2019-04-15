package com.nieyue.dao;

import com.nieyue.bean.Notice;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 公告数据库接口
 * @author yy
 *
 */
@Mapper
public interface NoticeDao {
    /** 新增*/
    public boolean add(Notice notice) ;
    /** 删除 */
    public boolean delete(Integer noticeId) ;
    /** 更新*/
    public boolean update(Notice notice);
    /** 装载 */
    public Notice load(Integer noticeId);
    /**总共数目 */
    public int count();
    /** 列表 */
    public List<Notice> list(
            @Param("pageNum") int pageNum,
            @Param("pageSize") int pageSize,
            @Param("orderName") String orderName,
            @Param("orderWay") String orderWay) ;
}