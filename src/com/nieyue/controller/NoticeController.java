package com.nieyue.controller;

import com.nieyue.bean.Notice;
import com.nieyue.exception.NotAnymoreException;
import com.nieyue.exception.NotIsNotExistException;
import com.nieyue.service.NoticeService;
import com.nieyue.util.ResultUtil;
import com.nieyue.util.StateResultList;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;


/**
 * 公告控制类
 * @author yy
 *
 */
@Api(tags={"notice"},value="公告",description="公告管理")
@RestController
@RequestMapping("/notice")
public class NoticeController {
	@Resource
	private NoticeService noticeService;
	
	/**
	 * 公告分页浏览
	 * @param orderName 商品排序数据库字段
	 * @param orderWay 商品排序方法 asc升序 desc降序
	 * @return
	 */
	@ApiOperation(value = "公告列表", notes = "公告分页浏览")
	@ApiImplicitParams({
	  @ApiImplicitParam(name="pageNum",value="页头数位",dataType="int", paramType = "query",defaultValue="1"),
	  @ApiImplicitParam(name="pageSize",value="每页数目",dataType="int", paramType = "query",defaultValue="10"),
	  @ApiImplicitParam(name="orderName",value="排序字段",dataType="string", paramType = "query",defaultValue="update_date"),
	  @ApiImplicitParam(name="orderWay",value="排序方式",dataType="string", paramType = "query",defaultValue="desc")
	  })
	@RequestMapping(value = "/list", method = {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody StateResultList<List<Notice>> list(
			@RequestParam(value="pageNum",defaultValue="1",required=false)int pageNum,
			@RequestParam(value="pageSize",defaultValue="10",required=false) int pageSize,
			@RequestParam(value="orderName",required=false,defaultValue="update_date") String orderName,
			@RequestParam(value="orderWay",required=false,defaultValue="desc") String orderWay)  {
			List<Notice> list = new ArrayList<Notice>();
			list= noticeService.list(pageNum, pageSize, orderName, orderWay);
			if(list.size()>0){
				return ResultUtil.getSlefSRSuccessList(list);
			}else{
				throw new NotAnymoreException();//没有更多
			}
	}
	/**
	 * 公告修改
	 * @return
	 */
	@ApiOperation(value = "公告修改", notes = "公告修改")
	@RequestMapping(value = "/update", method = {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody StateResultList<List<Notice>> update(@ModelAttribute Notice notice,HttpSession session)  {
		boolean um = noticeService.update(notice);
		if(um){
			List<Notice> list = new ArrayList<>();
			list.add(notice);
			return ResultUtil.getSlefSRSuccessList(list);
		}
		return ResultUtil.getSlefSRFailList(null);
	}
	/**
	 * 公告增加
	 * @return 
	 */
	@ApiOperation(value = "公告增加", notes = "公告增加")
	@RequestMapping(value = "/add", method = {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody StateResultList<List<Notice>> add(@ModelAttribute Notice notice, HttpSession session) {
		boolean am = noticeService.add(notice);
		if(am){
			List<Notice> list = new ArrayList<>();
			list.add(notice);
			return ResultUtil.getSlefSRSuccessList(list);
		}
		return ResultUtil.getSlefSRFailList(null);
	}
	/**
	 * 公告删除
	 * @return
	 */
	@ApiOperation(value = "公告删除", notes = "公告删除")
	@ApiImplicitParams({
		  @ApiImplicitParam(name="noticeId",value="公告ID",dataType="int", paramType = "query",required=true)
		  })
	@RequestMapping(value = "/delete", method = {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody StateResultList<List<Notice>> delete(@RequestParam("noticeId") Integer noticeId,HttpSession session)  {
		Notice notice = noticeService.load(noticeId);
		boolean dm = noticeService.delete(noticeId);
		if(dm){
			List<Notice> list = new ArrayList<>();
			list.add(notice);
			return ResultUtil.getSlefSRSuccessList(list);
		}
		return ResultUtil.getSlefSRFailList(null);
	}
	/**
	 * 公告浏览数量
	 * @return
	 */
	@ApiOperation(value = "公告数量", notes = "公告数量查询")
	@RequestMapping(value = "/count", method = {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody StateResultList<List<Integer>> count(HttpSession session)  {
		Integer count = noticeService.count();
			List<Integer> list = new ArrayList<Integer>();
			list.add(count);
			return ResultUtil.getSlefSRSuccessList(list);
	}
	/**
	 * 公告单个加载
	 * @return
	 */
	@ApiOperation(value = "公告单个加载", notes = "公告单个加载")
	@ApiImplicitParams({
		  @ApiImplicitParam(name="noticeId",value="公告ID",dataType="int", paramType = "query",required=true)
		  })
	@RequestMapping(value = "/load", method = {RequestMethod.GET,RequestMethod.POST})
	public  StateResultList<List<Notice>> load(@RequestParam("noticeId") Integer noticeId,HttpSession session)  {
		List<Notice> list = new ArrayList<Notice>();
		Notice notice = noticeService.load(noticeId);
			if(notice!=null &&!notice.equals("")){
				list.add(notice);
				return ResultUtil.getSlefSRSuccessList(list);
			}else{
				throw new NotIsNotExistException("公告");//不存在
			}
	}
	
}
