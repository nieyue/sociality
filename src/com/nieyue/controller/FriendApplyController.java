package com.nieyue.controller;

import com.nieyue.bean.Friend;
import com.nieyue.bean.FriendApply;
import com.nieyue.exception.NotAnymoreException;
import com.nieyue.exception.NotIsNotExistException;
import com.nieyue.service.FriendApplyService;
import com.nieyue.service.FriendService;
import com.nieyue.util.ResultUtil;
import com.nieyue.util.StateResultList;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;


/**
 * 好友申请控制类
 * @author yy
 *
 */
@Api(tags={"friendApply"},value="好友申请",description="好友申请管理")
@RestController
@RequestMapping("/friendApply")
public class FriendApplyController {
	@Autowired
	private FriendApplyService friendApplyService;
	@Autowired
	private FriendService friendService;

	/**
	 * 好友申请分页浏览
	 * @param orderName 商品排序数据库字段
	 * @param orderWay 商品排序方法 asc升序 desc降序
	 * @return
	 */
	@ApiOperation(value = "好友申请列表", notes = "好友申请分页浏览")
	@ApiImplicitParams({
	  @ApiImplicitParam(name="accountId",value="申请人id外键",dataType="int", paramType = "query"),
	  @ApiImplicitParam(name="friendAccountId",value="被申请人id外键",dataType="int", paramType = "query"),
	  @ApiImplicitParam(name="status",value="状态，默认1申请中，2已同意，3已拒绝",dataType="int", paramType = "query"),
	  @ApiImplicitParam(name="pageNum",value="页头数位",dataType="int", paramType = "query",defaultValue="1"),
	  @ApiImplicitParam(name="pageSize",value="每页数目",dataType="int", paramType = "query",defaultValue="10"),
	  @ApiImplicitParam(name="orderName",value="排序字段",dataType="string", paramType = "query",defaultValue="update_date"),
	  @ApiImplicitParam(name="orderWay",value="排序方式",dataType="string", paramType = "query",defaultValue="desc")
	  })
	@RequestMapping(value = "/list", method = {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody StateResultList<List<FriendApply>> list(
			@RequestParam(value="accountId",required=false)Integer accountId,
			@RequestParam(value="friendAccountId",required=false)Integer friendAccountId,
			@RequestParam(value="status",required=false)Integer status,
			@RequestParam(value="pageNum",defaultValue="1",required=false)int pageNum,
			@RequestParam(value="pageSize",defaultValue="10",required=false) int pageSize,
			@RequestParam(value="orderName",required=false,defaultValue="update_date") String orderName,
			@RequestParam(value="orderWay",required=false,defaultValue="desc") String orderWay)  {
			List<FriendApply> list = new ArrayList<FriendApply>();
			list= friendApplyService.list(accountId,friendAccountId,status,pageNum, pageSize, orderName, orderWay);
			if(list.size()>0){
				return ResultUtil.getSlefSRSuccessList(list);
			}else{
				throw new NotAnymoreException();//没有更多
			}
	}
	/**
	 * 好友申请修改
	 * @return
	 */
	@ApiOperation(value = "好友申请修改", notes = "好友申请修改")
	@RequestMapping(value = "/update", method = {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody StateResultList<List<FriendApply>> update(@ModelAttribute FriendApply friendApply,HttpSession session)  {
		boolean um = friendApplyService.update(friendApply);
		if(um){
			List<FriendApply> list = new ArrayList<>();
			list.add(friendApply);
			return ResultUtil.getSlefSRSuccessList(list);
		}
		return ResultUtil.getSlefSRFailList(null);
	}
	/**
	 * 好友申请增加
	 * @return 
	 */
	@ApiOperation(value = "好友申请增加", notes = "好友申请增加")
	@RequestMapping(value = "/add", method = {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody StateResultList<List<FriendApply>> add(@ModelAttribute FriendApply friendApply, HttpSession session) {
		boolean am = friendApplyService.add(friendApply);
		if(am){
			List<FriendApply> list = new ArrayList<>();
			list.add(friendApply);
			return ResultUtil.getSlefSRSuccessList(list);
		}
		return ResultUtil.getSlefSRFailList(null);
	}
	/**
	 * 好友申请
	 * @return
	 */
	@ApiOperation(value = "好友申请", notes = "好友申请")
	@RequestMapping(value = "/apply", method = {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody StateResultList<List<FriendApply>> apply(@ModelAttribute FriendApply friendApply, HttpSession session) {
		if(friendApply.getAccountId().equals(friendApply.getFriendAccountId())){
			return ResultUtil.getSlefSRList(40004,"自己不能加自己",null);
		}
		List<FriendApply> friendApplyList = friendApplyService.list(friendApply.getAccountId(), friendApply.getFriendAccountId(), 1, 1, Integer.MAX_VALUE, "friend_apply_id", "desc");
		if(friendApplyList.size()>0){
			return ResultUtil.getSlefSRList(40005,"已经申请过了",null);
		}else {
			//判断是否好友
			List<Friend> friendList = friendService.list(friendApply.getAccountId(), friendApply.getFriendAccountId(),  1, Integer.MAX_VALUE, "friend_id", "desc");
			if(friendList.size()>0){
				return ResultUtil.getSlefSRList(40006,"已经是好友了",null);
			}
		}
		//如果对方已经申请过了，直接添加成功
		List<FriendApply> fal = friendApplyService.list(friendApply.getFriendAccountId(), friendApply.getAccountId(), 1, 1, Integer.MAX_VALUE, "friend_apply_id", "desc");
			if(fal.size()>0){
				FriendApply fa = fal.get(0);
				fa.setStatus(2);
				boolean b = friendApplyService.update(fa);
				if(b){
					//相互好友添加
					Friend friend=new Friend();
					friend.setCreateDate(new Date());
					friend.setUpdateDate(new Date());
					friend.setAccountId(fa.getAccountId());
					friend.setFriendAccountId(fa.getFriendAccountId());
					friendService.add(friend);

					Friend friend2=new Friend();
					friend2.setCreateDate(new Date());
					friend2.setUpdateDate(new Date());
					friend2.setFriendAccountId(fa.getAccountId());
					friend2.setAccountId(fa.getFriendAccountId());
					friendService.add(friend2);
					List<FriendApply> list = new ArrayList<>();
					list.add(fa);
					return ResultUtil.getSlefSRSuccessList(list);
				}
			}
		//首次申请的
		friendApply.setStatus(1);//状态，默认1申请中，2已同意，3已拒绝
		boolean am = friendApplyService.add(friendApply);
		if(am){
			List<FriendApply> list = new ArrayList<>();
			list.add(friendApply);
			return ResultUtil.getSlefSRSuccessList(list);
		}
		return ResultUtil.getSlefSRFailList(null);
	}
	/**
	 * 同意/拒绝添加好友
	 * @return
	 */
	@ApiOperation(value = "同意/拒绝添加好友", notes = "同意/拒绝添加好友")
	@ApiImplicitParams({
			@ApiImplicitParam(name="friendApplyId",value="好友申请ID",dataType="int", paramType = "query",required=true),
			@ApiImplicitParam(name="status",value="状态，默认1申请中，2已同意，3已拒绝",dataType="int", paramType = "query",required=true)
	})
	@RequestMapping(value = "/agreeOrRefuse", method = {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody StateResultList<List<FriendApply>> agreeOrRefuse(
			@RequestParam(value="friendApplyId",required=false)Integer friendApplyId,
			@RequestParam(value="status",required=false)Integer status,
			HttpSession session) {
		FriendApply friendApply=friendApplyService.load(friendApplyId);
		if(friendApply==null){
			return ResultUtil.getSlefSRList(4,"没有好友申请",null);
		}
		if(friendApply.getStatus()==2){
			return ResultUtil.getSlefSRList(40006,"已经是好友了",null);
		}
		if(friendApply.getStatus()==3){
			return ResultUtil.getSlefSRList(40007,"已经拒绝了",null);
		}
		if(status==null||(status!=2&&status!=3)){
			return ResultUtil.getSlefSRList(4,"操作错误",null);
		}
		friendApply.setStatus(status);//状态，默认1申请中，2已同意，3已拒绝
		boolean am = friendApplyService.update(friendApply);
		if(am){
			if(status==2){
				//相互好友添加
				Friend friend=new Friend();
				friend.setCreateDate(new Date());
				friend.setUpdateDate(new Date());
				friend.setAccountId(friendApply.getAccountId());
				friend.setFriendAccountId(friendApply.getFriendAccountId());
				friendService.add(friend);

				Friend friend2=new Friend();
				friend2.setCreateDate(new Date());
				friend2.setUpdateDate(new Date());
				friend2.setFriendAccountId(friendApply.getAccountId());
				friend2.setAccountId(friendApply.getFriendAccountId());
				friendService.add(friend2);

			}
			List<FriendApply> list = new ArrayList<>();
			list.add(friendApply);
			return ResultUtil.getSlefSRSuccessList(list);
		}
		return ResultUtil.getSlefSRFailList(null);
	}
	/**
	 * 好友申请删除
	 * @return
	 */
	@ApiOperation(value = "好友申请删除", notes = "好友申请删除")
	@ApiImplicitParams({
		  @ApiImplicitParam(name="friendApplyId",value="好友申请ID",dataType="int", paramType = "query",required=true)
		  })
	@RequestMapping(value = "/delete", method = {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody StateResultList<List<FriendApply>> delete(@RequestParam("friendApplyId") Integer friendApplyId,HttpSession session)  {
		FriendApply friendApply = friendApplyService.load(friendApplyId);
		boolean dm = friendApplyService.delete(friendApplyId);
		if(dm){
			List<FriendApply> list = new ArrayList<>();
			list.add(friendApply);
			return ResultUtil.getSlefSRSuccessList(list);
		}
		return ResultUtil.getSlefSRFailList(null);
	}
	/**
	 * 好友申请浏览数量
	 * @return
	 */
	@ApiOperation(value = "好友申请数量", notes = "好友申请数量查询")
	@ApiImplicitParams({
			@ApiImplicitParam(name="accountId",value="申请人id外键",dataType="int", paramType = "query"),
			@ApiImplicitParam(name="friendAccountId",value="被申请人id外键",dataType="int", paramType = "query"),
			@ApiImplicitParam(name="status",value="状态，默认1申请中，2已同意，3已拒绝",dataType="int", paramType = "query"),
	})
	@RequestMapping(value = "/count", method = {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody StateResultList<List<Integer>> count(
			@RequestParam(value="accountId",required=false)Integer accountId,
			@RequestParam(value="friendAccountId",required=false)Integer friendAccountId,
			@RequestParam(value="status",required=false)Integer status,
			HttpSession session)  {
		Integer count = friendApplyService.count(accountId,friendAccountId,status);
			List<Integer> list = new ArrayList<Integer>();
			list.add(count);
			return ResultUtil.getSlefSRSuccessList(list);
	}
	/**
	 * 好友申请单个加载
	 * @return
	 */
	@ApiOperation(value = "好友申请单个加载", notes = "好友申请单个加载")
	@ApiImplicitParams({
		  @ApiImplicitParam(name="friendApplyId",value="好友申请ID",dataType="int", paramType = "query",required=true)
		  })
	@RequestMapping(value = "/load", method = {RequestMethod.GET,RequestMethod.POST})
	public  StateResultList<List<FriendApply>> load(@RequestParam("friendApplyId") Integer friendApplyId,HttpSession session)  {
		List<FriendApply> list = new ArrayList<FriendApply>();
		FriendApply friendApply =friendApplyService.load(friendApplyId);
			if(friendApply!=null &&!friendApply.equals("")){
				list.add(friendApply);
				return ResultUtil.getSlefSRSuccessList(list);
			}else{
				throw new NotIsNotExistException("好友申请");//不存在
			}
	}
	
}
