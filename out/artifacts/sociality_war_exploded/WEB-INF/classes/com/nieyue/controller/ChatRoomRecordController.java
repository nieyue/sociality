package com.nieyue.controller;

import com.nieyue.bean.ChatRoomRecord;
import com.nieyue.exception.NotAnymoreException;
import com.nieyue.exception.NotIsNotExistException;
import com.nieyue.service.ChatRoomRecordService;
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
 * 聊天房聊天记录控制类
 * @author yy
 *
 */
@Api(tags={"chatRoomRecord"},value="聊天房聊天记录",description="聊天房聊天记录管理")
@RestController
@RequestMapping("/chatRoomRecord")
public class ChatRoomRecordController {
	@Resource
	private ChatRoomRecordService chatRoomRecordService;
	
	/**
	 * 聊天房聊天记录分页浏览
	 * @param orderName 商品排序数据库字段
	 * @param orderWay 商品排序方法 asc升序 desc降序
	 * @return
	 */
	@ApiOperation(value = "聊天房聊天记录列表", notes = "聊天房聊天记录分页浏览")
	@ApiImplicitParams({
	  @ApiImplicitParam(name="chatRoomId",value="聊天房id外键",dataType="int", paramType = "query"),
	  @ApiImplicitParam(name="accountId",value="账户id外键",dataType="int", paramType = "query"),
	  @ApiImplicitParam(name="pageNum",value="页头数位",dataType="int", paramType = "query",defaultValue="1"),
	  @ApiImplicitParam(name="pageSize",value="每页数目",dataType="int", paramType = "query",defaultValue="10"),
	  @ApiImplicitParam(name="orderName",value="排序字段",dataType="string", paramType = "query",defaultValue="update_date"),
	  @ApiImplicitParam(name="orderWay",value="排序方式",dataType="string", paramType = "query",defaultValue="desc")
	  })
	@RequestMapping(value = "/list", method = {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody StateResultList<List<ChatRoomRecord>> list(
			@RequestParam(value="accountId",required=false)Integer chatRoomId,
			@RequestParam(value="accountId",required=false)Integer accountId,
			@RequestParam(value="pageNum",defaultValue="1",required=false)int pageNum,
			@RequestParam(value="pageSize",defaultValue="10",required=false) int pageSize,
			@RequestParam(value="orderName",required=false,defaultValue="update_date") String orderName,
			@RequestParam(value="orderWay",required=false,defaultValue="desc") String orderWay)  {
			List<ChatRoomRecord> list = new ArrayList<ChatRoomRecord>();
			list= chatRoomRecordService.list(chatRoomId,accountId,pageNum, pageSize, orderName, orderWay);
			if(list.size()>0){
				return ResultUtil.getSlefSRSuccessList(list);
			}else{
				throw new NotAnymoreException();//没有更多
			}
	}
	/**
	 * 聊天房聊天记录修改
	 * @return
	 */
	@ApiOperation(value = "聊天房聊天记录修改", notes = "聊天房聊天记录修改")
	@RequestMapping(value = "/update", method = {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody StateResultList<List<ChatRoomRecord>> update(@ModelAttribute ChatRoomRecord chatRoomRecord,HttpSession session)  {
		boolean um = chatRoomRecordService.update(chatRoomRecord);
		if(um){
			List<ChatRoomRecord> list = new ArrayList<>();
			list.add(chatRoomRecord);
			return ResultUtil.getSlefSRSuccessList(list);
		}
		return ResultUtil.getSlefSRFailList(null);
	}
	/**
	 * 聊天房聊天记录增加
	 * @return 
	 */
	@ApiOperation(value = "聊天房聊天记录增加", notes = "聊天房聊天记录增加")
	@RequestMapping(value = "/add", method = {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody StateResultList<List<ChatRoomRecord>> add(@ModelAttribute ChatRoomRecord chatRoomRecord, HttpSession session) {
		boolean am = chatRoomRecordService.add(chatRoomRecord);
		if(am){
			List<ChatRoomRecord> list = new ArrayList<>();
			list.add(chatRoomRecord);
			return ResultUtil.getSlefSRSuccessList(list);
		}
		return ResultUtil.getSlefSRFailList(null);
	}
	/**
	 * 聊天房聊天记录删除
	 * @return
	 */
	@ApiOperation(value = "聊天房聊天记录删除", notes = "聊天房聊天记录删除")
	@ApiImplicitParams({
		  @ApiImplicitParam(name="chatRoomRecordId",value="聊天房聊天记录ID",dataType="int", paramType = "query",required=true)
		  })
	@RequestMapping(value = "/delete", method = {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody StateResultList<List<ChatRoomRecord>> delete(@RequestParam("chatRoomRecordId") Integer chatRoomRecordId,HttpSession session)  {
		ChatRoomRecord chatRoomRecord = chatRoomRecordService.load(chatRoomRecordId);
		boolean dm = chatRoomRecordService.delete(chatRoomRecordId);
		if(dm){
			List<ChatRoomRecord> list = new ArrayList<>();
			list.add(chatRoomRecord);
			return ResultUtil.getSlefSRSuccessList(list);
		}
		return ResultUtil.getSlefSRFailList(null);
	}
	/**
	 * 聊天房聊天记录浏览数量
	 * @return
	 */
	@ApiOperation(value = "聊天房聊天记录数量", notes = "聊天房聊天记录数量查询")
	@ApiImplicitParams({
			@ApiImplicitParam(name="chatRoomId",value="聊天房id外键",dataType="int", paramType = "query"),
			@ApiImplicitParam(name="accountId",value="账户id外键",dataType="int", paramType = "query"),
	})
	@RequestMapping(value = "/count", method = {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody StateResultList<List<Integer>> count(
			@RequestParam(value="chatRoomId",required=false)Integer chatRoomId,
			@RequestParam(value="accountId",required=false)Integer accountId,
			HttpSession session)  {
		Integer count = chatRoomRecordService.count(chatRoomId,accountId);
			List<Integer> list = new ArrayList<Integer>();
			list.add(count);
			return ResultUtil.getSlefSRSuccessList(list);
	}
	/**
	 * 聊天房聊天记录单个加载
	 * @return
	 */
	@ApiOperation(value = "聊天房聊天记录单个加载", notes = "聊天房聊天记录单个加载")
	@ApiImplicitParams({
		  @ApiImplicitParam(name="chatRoomRecordId",value="聊天房聊天记录ID",dataType="int", paramType = "query",required=true)
		  })
	@RequestMapping(value = "/load", method = {RequestMethod.GET,RequestMethod.POST})
	public  StateResultList<List<ChatRoomRecord>> load(@RequestParam("chatRoomRecordId") Integer chatRoomRecordId,HttpSession session)  {
		List<ChatRoomRecord> list = new ArrayList<ChatRoomRecord>();
		ChatRoomRecord chatRoomRecord = chatRoomRecordService.load(chatRoomRecordId);
			if(chatRoomRecord!=null &&!chatRoomRecord.equals("")){
				list.add(chatRoomRecord);
				return ResultUtil.getSlefSRSuccessList(list);
			}else{
				throw new NotIsNotExistException("聊天房聊天记录");//不存在
			}
	}
	
}
