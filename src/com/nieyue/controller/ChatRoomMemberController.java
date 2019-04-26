package com.nieyue.controller;

import com.nieyue.bean.ChatRoomMember;
import com.nieyue.exception.NotAnymoreException;
import com.nieyue.exception.NotIsNotExistException;
import com.nieyue.service.ChatRoomMemberService;
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
import java.util.List;


/**
 * 聊天房成员控制类
 * @author yy
 *
 */
@Api(tags={"chatRoomMember"},value="聊天房成员",description="聊天房成员管理")
@RestController
@RequestMapping("/chatRoomMember")
public class ChatRoomMemberController {
	@Autowired
	private ChatRoomMemberService chatRoomMemberService;

	/**
	 * 聊天房成员分页浏览
	 * @param orderName 排序数据库字段
	 * @param orderWay 排序方法 asc升序 desc降序
	 * @return
	 */
	@ApiOperation(value = "聊天房成员列表", notes = "聊天房成员分页浏览")
	@ApiImplicitParams({
			@ApiImplicitParam(name="chatRoomId",value="聊天房id外键",dataType="int", paramType = "query"),
			@ApiImplicitParam(name="accountId",value="账户id外键",dataType="int", paramType = "query"),
	  		@ApiImplicitParam(name="pageNum",value="页头数位",dataType="int", paramType = "query",defaultValue="1"),
	  		@ApiImplicitParam(name="pageSize",value="每页数目",dataType="int", paramType = "query",defaultValue="10"),
	  		@ApiImplicitParam(name="orderName",value="排序字段",dataType="string", paramType = "query",defaultValue="update_date"),
	  		@ApiImplicitParam(name="orderWay",value="排序方式",dataType="string", paramType = "query",defaultValue="desc")
	  })
	@RequestMapping(value = "/list", method = {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody StateResultList<List<ChatRoomMember>> list(
			@RequestParam(value="chatRoomId",required=false)Integer chatRoomId,
			@RequestParam(value="accountId",required=false)Integer accountId,
			@RequestParam(value="pageNum",defaultValue="1",required=false)int pageNum,
			@RequestParam(value="pageSize",defaultValue="10",required=false) int pageSize,
			@RequestParam(value="orderName",required=false,defaultValue="update_date") String orderName,
			@RequestParam(value="orderWay",required=false,defaultValue="desc") String orderWay)  {
			List<ChatRoomMember> list = new ArrayList<ChatRoomMember>();
			list= chatRoomMemberService.list(chatRoomId,accountId,pageNum, pageSize, orderName, orderWay);
			if(list.size()>0){
				return ResultUtil.getSlefSRSuccessList(list);
			}else{
				throw new NotAnymoreException();//没有更多
			}
	}

	/**
	 * 聊天房成员修改
	 * @return
	 */
	@ApiOperation(value = "聊天房成员修改", notes = "聊天房成员修改")
	@RequestMapping(value = "/update", method = {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody StateResultList<List<ChatRoomMember>> update(@ModelAttribute ChatRoomMember chatRoomMember,HttpSession session)  {
		boolean um = chatRoomMemberService.update(chatRoomMember);
		if(um){
			List<ChatRoomMember> list = new ArrayList<>();
			list.add(chatRoomMember);
			return ResultUtil.getSlefSRSuccessList(list);
		}
		return ResultUtil.getSlefSRFailList(null);
	}
	/**
	 * 聊天房成员增加
	 * @return 
	 */
	@ApiOperation(value = "聊天房成员增加", notes = "聊天房成员增加")
	@RequestMapping(value = "/add", method = {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody StateResultList<List<ChatRoomMember>> add(@ModelAttribute ChatRoomMember chatRoomMember, HttpSession session) {
		boolean am = chatRoomMemberService.add(chatRoomMember);
		if(am){
			List<ChatRoomMember> list = new ArrayList<>();
			list.add(chatRoomMember);
			return ResultUtil.getSlefSRSuccessList(list);
		}
		return ResultUtil.getSlefSRFailList(null);
	}
	/**
	 * 聊天房成员删除
	 * @return
	 */
	@ApiOperation(value = "聊天房成员删除", notes = "聊天房成员删除")
	@ApiImplicitParams({
		  @ApiImplicitParam(name="chatRoomMemberId",value="聊天房成员ID",dataType="int", paramType = "query",required=true)
		  })
	@RequestMapping(value = "/delete", method = {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody StateResultList<List<ChatRoomMember>> delete(@RequestParam("chatRoomMemberId") Integer chatRoomMemberId,HttpSession session)  {
		ChatRoomMember chatRoomMember = chatRoomMemberService.load(chatRoomMemberId);
		boolean dm = chatRoomMemberService.delete(chatRoomMemberId);
		if(dm){
			List<ChatRoomMember> list = new ArrayList<>();
			list.add(chatRoomMember);
			return ResultUtil.getSlefSRSuccessList(list);
		}
		return ResultUtil.getSlefSRFailList(null);
	}
	/**
	 * 聊天房成员浏览数量
	 * @return
	 */
	@ApiOperation(value = "聊天房成员数量", notes = "聊天房成员数量查询")
	@ApiImplicitParams({
			@ApiImplicitParam(name="chatRoomId",value="聊天房id外键",dataType="int", paramType = "query"),
			@ApiImplicitParam(name="accountId",value="账户id外键",dataType="int", paramType = "query"),
	})
	@RequestMapping(value = "/count", method = {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody StateResultList<List<Integer>> count(
			@RequestParam(value="chatRoomId",required=false)Integer chatRoomId,
			@RequestParam(value="accountId",required=false)Integer accountId,
			HttpSession session)  {
		Integer count = chatRoomMemberService.count(chatRoomId,accountId);
			List<Integer> list = new ArrayList<Integer>();
			list.add(count);
			return ResultUtil.getSlefSRSuccessList(list);
	}
	/**
	 * 聊天房成员单个加载
	 * @return
	 */
	@ApiOperation(value = "聊天房成员单个加载", notes = "聊天房成员单个加载")
	@ApiImplicitParams({
		  @ApiImplicitParam(name="chatRoomMemberId",value="聊天房成员ID",dataType="int", paramType = "query",required=true)
		  })
	@RequestMapping(value = "/load", method = {RequestMethod.GET,RequestMethod.POST})
	public  StateResultList<List<ChatRoomMember>> load(@RequestParam("chatRoomMemberId") Integer chatRoomMemberId,HttpSession session)  {
		List<ChatRoomMember> list = new ArrayList<ChatRoomMember>();
		ChatRoomMember chatRoomMember = chatRoomMemberService.load(chatRoomMemberId);
			if(chatRoomMember!=null &&!chatRoomMember.equals("")){
				list.add(chatRoomMember);
				return ResultUtil.getSlefSRSuccessList(list);
			}else{
				throw new NotIsNotExistException("聊天房成员");//不存在
			}
	}
	
}
