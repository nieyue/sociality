package com.nieyue.controller;

import com.nieyue.bean.ChatRoom;
import com.nieyue.bean.ChatRoomMember;
import com.nieyue.exception.CommonRollbackException;
import com.nieyue.exception.NotAnymoreException;
import com.nieyue.exception.NotIsNotExistException;
import com.nieyue.service.ChatRoomMemberService;
import com.nieyue.service.ChatRoomService;
import com.nieyue.util.ResultUtil;
import com.nieyue.util.StateResultList;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;


/**
 * 聊天房控制类
 * @author yy
 *
 */
@Api(tags={"chatRoom"},value="聊天房",description="聊天房管理")
@RestController
@RequestMapping("/chatRoom")
public class ChatRoomController {
	@Autowired
	private ChatRoomService chatRoomService;
	@Autowired
	private ChatRoomMemberService chatRoomMemberService;

	/**
	 * 聊天房分页浏览
	 * @param orderName 商品排序数据库字段
	 * @param orderWay 商品排序方法 asc升序 desc降序
	 * @return
	 */
	@ApiOperation(value = "聊天房列表", notes = "聊天房分页浏览")
	@ApiImplicitParams({
	  @ApiImplicitParam(name="accountId",value="账户id外键",dataType="int", paramType = "query"),
	  @ApiImplicitParam(name="pageNum",value="页头数位",dataType="int", paramType = "query",defaultValue="1"),
	  @ApiImplicitParam(name="pageSize",value="每页数目",dataType="int", paramType = "query",defaultValue="10"),
	  @ApiImplicitParam(name="orderName",value="排序字段",dataType="string", paramType = "query",defaultValue="update_date"),
	  @ApiImplicitParam(name="orderWay",value="排序方式",dataType="string", paramType = "query",defaultValue="desc")
	  })
	@RequestMapping(value = "/list", method = {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody StateResultList<List<ChatRoom>> list(
			@RequestParam(value="accountId",required=false)Integer accountId,
			@RequestParam(value="pageNum",defaultValue="1",required=false)int pageNum,
			@RequestParam(value="pageSize",defaultValue="10",required=false) int pageSize,
			@RequestParam(value="orderName",required=false,defaultValue="update_date") String orderName,
			@RequestParam(value="orderWay",required=false,defaultValue="desc") String orderWay)  {
			List<ChatRoom> list = new ArrayList<ChatRoom>();
			list= chatRoomService.list(accountId,pageNum, pageSize, orderName, orderWay);
			if(list.size()>0){
				return ResultUtil.getSlefSRSuccessList(list);
			}else{
				throw new NotAnymoreException();//没有更多
			}
	}
	/**
	 * 根据聊天房成员查询所有聊天房列表
	 * @return
	 */
	@ApiOperation(value = "根据聊天房成员查询所有聊天房列表", notes = "根据聊天房成员查询所有聊天房列表")
	@ApiImplicitParams({
			@ApiImplicitParam(name="accountId",value="成员账户id外键",dataType="int", paramType = "query"),
			@ApiImplicitParam(name="pageNum",value="页头数位",dataType="int", paramType = "query",defaultValue="1"),
			@ApiImplicitParam(name="pageSize",value="每页数目",dataType="int", paramType = "query",defaultValue="10"),
			@ApiImplicitParam(name="orderName",value="排序字段",dataType="string", paramType = "query",defaultValue="update_date"),
			@ApiImplicitParam(name="orderWay",value="排序方式",dataType="string", paramType = "query",defaultValue="desc")
	})
	@RequestMapping(value = "/chatRoomList", method = {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody StateResultList<List<ChatRoom>> chatRoomList(
			@RequestParam(value="accountId",required=false)Integer accountId,
			@RequestParam(value="pageNum",defaultValue="1",required=false)int pageNum,
			@RequestParam(value="pageSize",defaultValue="10",required=false) int pageSize,
			@RequestParam(value="orderName",required=false,defaultValue="update_date") String orderName,
			@RequestParam(value="orderWay",required=false,defaultValue="desc") String orderWay)  {
		List<ChatRoom> chatRoomList = new ArrayList<ChatRoom>();
		List<ChatRoomMember> list = chatRoomMemberService.list(null, accountId, pageNum, pageSize, orderName, orderWay);
		list.forEach(e->{
			if(e!=null){
				ChatRoom chatRoom = chatRoomService.load(e.getChatRoomId());
				chatRoomList.add(chatRoom);
			}
		});
		if(chatRoomList.size()>0){
			return ResultUtil.getSlefSRSuccessList(chatRoomList);
		}else{
			throw new NotAnymoreException();//没有更多
		}
	}
	/**
	 * 聊天房修改
	 * @return
	 */
	@ApiOperation(value = "聊天房修改", notes = "聊天房修改")
	@RequestMapping(value = "/update", method = {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody StateResultList<List<ChatRoom>> update(@ModelAttribute ChatRoom chatRoom,HttpSession session)  {
		boolean um = chatRoomService.update(chatRoom);
		if(um){
			List<ChatRoom> list = new ArrayList<>();
			list.add(chatRoom);
			return ResultUtil.getSlefSRSuccessList(list);
		}
		return ResultUtil.getSlefSRFailList(null);
	}
	/**
	 * 聊天房增加
	 * @return 
	 */
	@ApiOperation(value = "聊天房增加", notes = "聊天房增加")
	@RequestMapping(value = "/add", method = {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody StateResultList<List<ChatRoom>> add(@ModelAttribute ChatRoom chatRoom, HttpSession session) {
		boolean am = chatRoomService.add(chatRoom);
		if(am){
			List<ChatRoom> list = new ArrayList<>();
			list.add(chatRoom);
			return ResultUtil.getSlefSRSuccessList(list);
		}
		return ResultUtil.getSlefSRFailList(null);
	}
	/**
	 * 创建聊天房
	 * @return
	 */
	@ApiOperation(value = "创建聊天房", notes = "创建聊天房")
	@ApiImplicitParams({
			@ApiImplicitParam(name="type",value="类型，1私聊，2普通房，3语音房，4电影房",dataType="int", paramType = "query",required = true),
			@ApiImplicitParam(name="name",value="名称",dataType="string", paramType = "query"),
			@ApiImplicitParam(name="url",value="语音或电影url",dataType="string", paramType = "query"),
			@ApiImplicitParam(name="accountId",value="创建账户id",dataType="int", paramType = "query",required = true),
			@ApiImplicitParam(name="accountIds",value="所有成员",dataType="string", paramType = "query",required = true),
	})
	@RequestMapping(value = "/create", method = {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody StateResultList<List<ChatRoom>> create(
			@RequestParam("type") Integer type,
			@RequestParam(value="name",required = false) String name,
			@RequestParam(value="url",required = false) String url,
			@RequestParam("accountId") Integer accountId,
			@RequestParam("accountIds") String accountIds,
			HttpSession session) {
		if(StringUtils.isEmpty(accountIds)){
			throw new CommonRollbackException("缺少成员");
		}
		List<ChatRoom> list = new ArrayList<>();
		String[] aids = accountIds.split(",");
		ChatRoom chatRoom=new ChatRoom();
		chatRoom.setType(type);
		chatRoom.setName(name);
		chatRoom.setUrl(url);
		chatRoom.setAccountId(accountId);
		//判断是否已经存在,只有两人聊天才判断
		if(type==1){
			//获取非发起人的账户id
			Integer accountId2 = null;
			for (int i = 0; i <aids.length ; i++) {
				Integer aid = Integer.valueOf(aids[i]);
				if(!aid.equals(accountId)){
					accountId2=aid;
					break;
				}
			}
			//先查询发起人所有聊天房成员
			List<ChatRoomMember> chatRoomMemberList = chatRoomMemberService.list(null, accountId, 1, Integer.MAX_VALUE, "chat_room_member_id", "desc");
			int number=0;
			for (int i = 0; i < chatRoomMemberList.size(); i++) {
				ChatRoomMember chatRoomMember = chatRoomMemberList.get(i);
				number = chatRoomMemberService.count(chatRoomMember.getChatRoomId(), accountId2);
				if(number>0){
					ChatRoom cr = chatRoomService.load(chatRoomMember.getChatRoomId());
					list.add(cr);
					break;
				}
			}
			//已经存在
			if(number>0){
				return ResultUtil.getSlefSRSuccessList(list);
			}

		}
		boolean am = chatRoomService.add(chatRoom);


		ChatRoomMember chatRoomMember;
		for (int i = 0; i <aids.length ; i++) {
			Integer aid = Integer.valueOf(aids[i]);
			chatRoomMember=new ChatRoomMember();
			chatRoomMember.setAccountId(aid);
			chatRoomMember.setChatRoomId(chatRoom.getChatRoomId());
			chatRoomMemberService.add(chatRoomMember);
		}
		if(am){

			list.add(chatRoom);
			return ResultUtil.getSlefSRSuccessList(list);
		}
		return ResultUtil.getSlefSRFailList(null);
	}
	/**
	 * 聊天房删除
	 * @return
	 */
	@ApiOperation(value = "聊天房删除", notes = "聊天房删除")
	@ApiImplicitParams({
		  @ApiImplicitParam(name="chatRoomId",value="聊天房ID",dataType="int", paramType = "query",required=true)
		  })
	@RequestMapping(value = "/delete", method = {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody StateResultList<List<ChatRoom>> delete(@RequestParam("chatRoomId") Integer chatRoomId,HttpSession session)  {
		ChatRoom chatRoom = chatRoomService.load(chatRoomId);
		boolean dm = chatRoomService.delete(chatRoomId);
		if(dm){
			List<ChatRoom> list = new ArrayList<>();
			list.add(chatRoom);
			return ResultUtil.getSlefSRSuccessList(list);
		}
		return ResultUtil.getSlefSRFailList(null);
	}
	/**
	 * 聊天房浏览数量
	 * @return
	 */
	@ApiOperation(value = "聊天房数量", notes = "聊天房数量查询")
	@ApiImplicitParams({
			@ApiImplicitParam(name="accountId",value="账户id外键",dataType="int", paramType = "query"),
	})
	@RequestMapping(value = "/count", method = {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody StateResultList<List<Integer>> count(
			@RequestParam(value="accountId",required=false)Integer accountId,
			HttpSession session)  {
		Integer count = chatRoomService.count(accountId);
			List<Integer> list = new ArrayList<Integer>();
			list.add(count);
			return ResultUtil.getSlefSRSuccessList(list);
	}
	/**
	 * 聊天房单个加载
	 * @return
	 */
	@ApiOperation(value = "聊天房单个加载", notes = "聊天房单个加载")
	@ApiImplicitParams({
		  @ApiImplicitParam(name="chatRoomId",value="聊天房ID",dataType="int", paramType = "query",required=true)
		  })
	@RequestMapping(value = "/load", method = {RequestMethod.GET,RequestMethod.POST})
	public  StateResultList<List<ChatRoom>> load(@RequestParam("chatRoomId") Integer chatRoomId,HttpSession session)  {
		List<ChatRoom> list = new ArrayList<ChatRoom>();
		ChatRoom chatRoom = chatRoomService.load(chatRoomId);
			if(chatRoom!=null &&!chatRoom.equals("")){
				list.add(chatRoom);
				return ResultUtil.getSlefSRSuccessList(list);
			}else{
				throw new NotIsNotExistException("聊天房");//不存在
			}
	}
	
}
