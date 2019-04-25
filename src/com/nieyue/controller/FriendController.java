package com.nieyue.controller;

import com.nieyue.bean.Friend;
import com.nieyue.exception.NotAnymoreException;
import com.nieyue.exception.NotIsNotExistException;
import com.nieyue.service.FriendService;
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
 * 好友控制类
 * @author yy
 *
 */
@Api(tags={"friend"},value="好友",description="好友管理")
@RestController
@RequestMapping("/friend")
public class FriendController {
	@Resource
	private FriendService friendService;
	
	/**
	 * 好友分页浏览
	 * @param orderName 商品排序数据库字段
	 * @param orderWay 商品排序方法 asc升序 desc降序
	 * @return
	 */
	@ApiOperation(value = "好友列表", notes = "好友分页浏览")
	@ApiImplicitParams({
	  @ApiImplicitParam(name="accountId",value="账户id外键",dataType="int", paramType = "query"),
	  @ApiImplicitParam(name="friendAccountId",value="好友id外键",dataType="int", paramType = "query"),
	  @ApiImplicitParam(name="pageNum",value="页头数位",dataType="int", paramType = "query",defaultValue="1"),
	  @ApiImplicitParam(name="pageSize",value="每页数目",dataType="int", paramType = "query",defaultValue="10"),
	  @ApiImplicitParam(name="orderName",value="排序字段",dataType="string", paramType = "query",defaultValue="update_date"),
	  @ApiImplicitParam(name="orderWay",value="排序方式",dataType="string", paramType = "query",defaultValue="desc")
	  })
	@RequestMapping(value = "/list", method = {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody StateResultList<List<Friend>> list(
			@RequestParam(value="accountId",required=false)Integer accountId,
			@RequestParam(value="friendAccountId",required=false)Integer friendAccountId,
			@RequestParam(value="pageNum",defaultValue="1",required=false)int pageNum,
			@RequestParam(value="pageSize",defaultValue="10",required=false) int pageSize,
			@RequestParam(value="orderName",required=false,defaultValue="update_date") String orderName,
			@RequestParam(value="orderWay",required=false,defaultValue="desc") String orderWay)  {
			List<Friend> list = new ArrayList<Friend>();
			list= friendService.list(accountId,friendAccountId,pageNum, pageSize, orderName, orderWay);
			if(list.size()>0){
				return ResultUtil.getSlefSRSuccessList(list);
			}else{
				throw new NotAnymoreException();//没有更多
			}
	}
	/**
	 * 好友修改
	 * @return
	 */
	@ApiOperation(value = "好友修改", notes = "好友修改")
	@RequestMapping(value = "/update", method = {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody StateResultList<List<Friend>> update(@ModelAttribute Friend friend,HttpSession session)  {
		boolean um = friendService.update(friend);
		if(um){
			List<Friend> list = new ArrayList<>();
			list.add(friend);
			return ResultUtil.getSlefSRSuccessList(list);
		}
		return ResultUtil.getSlefSRFailList(null);
	}
	/**
	 * 好友增加
	 * @return 
	 */
	@ApiOperation(value = "好友增加", notes = "好友增加")
	@RequestMapping(value = "/add", method = {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody StateResultList<List<Friend>> add(@ModelAttribute Friend friend, HttpSession session) {
		boolean am = friendService.add(friend);
		if(am){
			List<Friend> list = new ArrayList<>();
			list.add(friend);
			return ResultUtil.getSlefSRSuccessList(list);
		}
		return ResultUtil.getSlefSRFailList(null);
	}
	/**
	 * 好友删除
	 * @return
	 */
	@ApiOperation(value = "好友删除", notes = "好友删除")
	@ApiImplicitParams({
		  @ApiImplicitParam(name="accountId",value="账户id",dataType="int", paramType = "query",required=true),
		  @ApiImplicitParam(name="friendAccountId",value="好友ID",dataType="int", paramType = "query",required=true)
		  })
	@RequestMapping(value = "/delete", method = {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody StateResultList<List<Friend>> delete(
			@RequestParam("accountId") Integer accountId,
			@RequestParam("friendAccountId") Integer friendAccountId,
			HttpSession session)  {
		List<Friend> friendList = friendService.list(accountId, friendAccountId, 1,Integer.MAX_VALUE,"friend_id","desc");
		friendList .addAll( friendService.list(friendAccountId, accountId, 1,Integer.MAX_VALUE,"friend_id","desc"));
		boolean dm=false;
		for (int i = 0; i < friendList.size(); i++) {
			dm = friendService.delete(friendList.get(i).getFriendId());
		}
		if(dm){
			return ResultUtil.getSlefSRSuccessList(friendList);
		}
		return ResultUtil.getSlefSRFailList(null);
	}
	/**
	 * 好友浏览数量
	 * @return
	 */
	@ApiOperation(value = "好友数量", notes = "好友数量查询")
	@ApiImplicitParams({
			@ApiImplicitParam(name="accountId",value="账户id外键",dataType="int", paramType = "query"),
			@ApiImplicitParam(name="friendAccountId",value="好友id外键",dataType="int", paramType = "query"),
	})
	@RequestMapping(value = "/count", method = {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody StateResultList<List<Integer>> count(
			@RequestParam(value="accountId",required=false)Integer accountId,
			@RequestParam(value="friendAccountId",required=false)Integer friendAccountId,
			HttpSession session)  {
		Integer count = friendService.count(accountId,friendAccountId);
			List<Integer> list = new ArrayList<Integer>();
			list.add(count);
			return ResultUtil.getSlefSRSuccessList(list);
	}
	/**
	 * 好友单个加载
	 * @return
	 */
	@ApiOperation(value = "好友单个加载", notes = "好友单个加载")
	@ApiImplicitParams({
		  @ApiImplicitParam(name="friendId",value="好友ID",dataType="int", paramType = "query",required=true)
		  })
	@RequestMapping(value = "/load", method = {RequestMethod.GET,RequestMethod.POST})
	public  StateResultList<List<Friend>> load(@RequestParam("friendId") Integer friendId,HttpSession session)  {
		List<Friend> list = new ArrayList<Friend>();
		Friend friend = friendService.load(friendId);
			if(friend!=null &&!friend.equals("")){
				list.add(friend);
				return ResultUtil.getSlefSRSuccessList(list);
			}else{
				throw new NotIsNotExistException("好友");//不存在
			}
	}
	
}
