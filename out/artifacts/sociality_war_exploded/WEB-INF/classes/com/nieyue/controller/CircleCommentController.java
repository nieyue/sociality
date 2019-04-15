package com.nieyue.controller;

import com.nieyue.bean.CircleComment;
import com.nieyue.exception.NotAnymoreException;
import com.nieyue.exception.NotIsNotExistException;
import com.nieyue.service.CircleCommentService;
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
 * 朋友圈评论控制类
 * @author yy
 *
 */
@Api(tags={"circleComment"},value="朋友圈评论",description="朋友圈评论管理")
@RestController
@RequestMapping("/circleComment")
public class CircleCommentController {
	@Resource
	private CircleCommentService circleCommentService;
	
	/**
	 * 朋友圈评论分页浏览
	 * @param orderName 商品排序数据库字段
	 * @param orderWay 商品排序方法 asc升序 desc降序
	 * @return
	 */
	@ApiOperation(value = "朋友圈评论列表", notes = "朋友圈评论分页浏览")
	@ApiImplicitParams({
	  @ApiImplicitParam(name="accountId",value="账户id外键",dataType="int", paramType = "query"),
	  @ApiImplicitParam(name="pageNum",value="页头数位",dataType="int", paramType = "query",defaultValue="1"),
	  @ApiImplicitParam(name="pageSize",value="每页数目",dataType="int", paramType = "query",defaultValue="10"),
	  @ApiImplicitParam(name="orderName",value="排序字段",dataType="string", paramType = "query",defaultValue="update_date"),
	  @ApiImplicitParam(name="orderWay",value="排序方式",dataType="string", paramType = "query",defaultValue="desc")
	  })
	@RequestMapping(value = "/list", method = {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody StateResultList<List<CircleComment>> list(
			@RequestParam(value="accountId",required=false)Integer accountId,
			@RequestParam(value="pageNum",defaultValue="1",required=false)int pageNum,
			@RequestParam(value="pageSize",defaultValue="10",required=false) int pageSize,
			@RequestParam(value="orderName",required=false,defaultValue="update_date") String orderName,
			@RequestParam(value="orderWay",required=false,defaultValue="desc") String orderWay)  {
			List<CircleComment> list = new ArrayList<CircleComment>();
			list= circleCommentService.list(accountId,pageNum, pageSize, orderName, orderWay);
			if(list.size()>0){
				return ResultUtil.getSlefSRSuccessList(list);
			}else{
				throw new NotAnymoreException();//没有更多
			}
	}
	/**
	 * 朋友圈评论修改
	 * @return
	 */
	@ApiOperation(value = "朋友圈评论修改", notes = "朋友圈评论修改")
	@RequestMapping(value = "/update", method = {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody StateResultList<List<CircleComment>> update(@ModelAttribute CircleComment circleComment,HttpSession session)  {
		boolean um = circleCommentService.update(circleComment);
		if(um){
			List<CircleComment> list = new ArrayList<>();
			list.add(circleComment);
			return ResultUtil.getSlefSRSuccessList(list);
		}
		return ResultUtil.getSlefSRFailList(null);
	}
	/**
	 * 朋友圈评论增加
	 * @return 
	 */
	@ApiOperation(value = "朋友圈评论增加", notes = "朋友圈评论增加")
	@RequestMapping(value = "/add", method = {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody StateResultList<List<CircleComment>> add(@ModelAttribute CircleComment circleComment, HttpSession session) {
		boolean am = circleCommentService.add(circleComment);
		if(am){
			List<CircleComment> list = new ArrayList<>();
			list.add(circleComment);
			return ResultUtil.getSlefSRSuccessList(list);
		}
		return ResultUtil.getSlefSRFailList(null);
	}
	/**
	 * 朋友圈评论删除
	 * @return
	 */
	@ApiOperation(value = "朋友圈评论删除", notes = "朋友圈评论删除")
	@ApiImplicitParams({
		  @ApiImplicitParam(name="circleCommentId",value="朋友圈评论ID",dataType="int", paramType = "query",required=true)
		  })
	@RequestMapping(value = "/delete", method = {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody StateResultList<List<CircleComment>> delete(@RequestParam("circleCommentId") Integer circleCommentId,HttpSession session)  {
		CircleComment circleComment = circleCommentService.load(circleCommentId);
		boolean dm = circleCommentService.delete(circleCommentId);
		if(dm){
			List<CircleComment> list = new ArrayList<>();
			list.add(circleComment);
			return ResultUtil.getSlefSRSuccessList(list);
		}
		return ResultUtil.getSlefSRFailList(null);
	}
	/**
	 * 朋友圈评论浏览数量
	 * @return
	 */
	@ApiOperation(value = "朋友圈评论数量", notes = "朋友圈评论数量查询")
	@ApiImplicitParams({
			@ApiImplicitParam(name="accountId",value="账户id外键",dataType="int", paramType = "query"),
	})
	@RequestMapping(value = "/count", method = {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody StateResultList<List<Integer>> count(
			@RequestParam(value="accountId",required=false)Integer accountId,
			HttpSession session)  {
		Integer count = circleCommentService.count(accountId);
			List<Integer> list = new ArrayList<Integer>();
			list.add(count);
			return ResultUtil.getSlefSRSuccessList(list);
	}
	/**
	 * 朋友圈评论单个加载
	 * @return
	 */
	@ApiOperation(value = "朋友圈评论单个加载", notes = "朋友圈评论单个加载")
	@ApiImplicitParams({
		  @ApiImplicitParam(name="circleCommentId",value="朋友圈评论ID",dataType="int", paramType = "query",required=true)
		  })
	@RequestMapping(value = "/load", method = {RequestMethod.GET,RequestMethod.POST})
	public  StateResultList<List<CircleComment>> load(@RequestParam("circleCommentId") Integer circleCommentId,HttpSession session)  {
		List<CircleComment> list = new ArrayList<CircleComment>();
		CircleComment circleComment = circleCommentService.load(circleCommentId);
			if(circleComment!=null &&!circleComment.equals("")){
				list.add(circleComment);
				return ResultUtil.getSlefSRSuccessList(list);
			}else{
				throw new NotIsNotExistException("朋友圈评论");//不存在
			}
	}
	
}
