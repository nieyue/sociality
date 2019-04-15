package com.nieyue.controller;

import com.nieyue.bean.ChatRecord;
import com.nieyue.exception.NotAnymoreException;
import com.nieyue.exception.NotIsNotExistException;
import com.nieyue.service.ChatRecordService;
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
 * 聊天记录控制类
 * @author yy
 *
 */
@Api(tags={"chatRecord"},value="聊天记录",description="聊天记录管理")
@RestController
@RequestMapping("/chatRecord")
public class ChatRecordController {
	@Resource
	private ChatRecordService chatRecordService;
	
	/**
	 * 聊天记录分页浏览
	 * @param orderName 商品排序数据库字段
	 * @param orderWay 商品排序方法 asc升序 desc降序
	 * @return
	 */
	@ApiOperation(value = "聊天记录列表", notes = "聊天记录分页浏览")
	@ApiImplicitParams({
	  @ApiImplicitParam(name="accountId",value="账户id外键",dataType="int", paramType = "query"),
	  @ApiImplicitParam(name="toAccountId",value="接收方账户id外键",dataType="int", paramType = "query"),
	  @ApiImplicitParam(name="pageNum",value="页头数位",dataType="int", paramType = "query",defaultValue="1"),
	  @ApiImplicitParam(name="pageSize",value="每页数目",dataType="int", paramType = "query",defaultValue="10"),
	  @ApiImplicitParam(name="orderName",value="排序字段",dataType="string", paramType = "query",defaultValue="update_date"),
	  @ApiImplicitParam(name="orderWay",value="排序方式",dataType="string", paramType = "query",defaultValue="desc")
	  })
	@RequestMapping(value = "/list", method = {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody StateResultList<List<ChatRecord>> list(
			@RequestParam(value="accountId",required=false)Integer accountId,
			@RequestParam(value="toAccountId",required=false)Integer toAccountId,
			@RequestParam(value="pageNum",defaultValue="1",required=false)int pageNum,
			@RequestParam(value="pageSize",defaultValue="10",required=false) int pageSize,
			@RequestParam(value="orderName",required=false,defaultValue="update_date") String orderName,
			@RequestParam(value="orderWay",required=false,defaultValue="desc") String orderWay)  {
			List<ChatRecord> list = new ArrayList<ChatRecord>();
			list= chatRecordService.list(accountId,toAccountId,pageNum, pageSize, orderName, orderWay);
			if(list.size()>0){
				return ResultUtil.getSlefSRSuccessList(list);
			}else{
				throw new NotAnymoreException();//没有更多
			}
	}
	/**
	 * 聊天记录修改
	 * @return
	 */
	@ApiOperation(value = "聊天记录修改", notes = "聊天记录修改")
	@RequestMapping(value = "/update", method = {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody StateResultList<List<ChatRecord>> update(@ModelAttribute ChatRecord chatRecord,HttpSession session)  {
		boolean um = chatRecordService.update(chatRecord);
		if(um){
			List<ChatRecord> list = new ArrayList<>();
			list.add(chatRecord);
			return ResultUtil.getSlefSRSuccessList(list);
		}
		return ResultUtil.getSlefSRFailList(null);
	}
	/**
	 * 聊天记录增加
	 * @return 
	 */
	@ApiOperation(value = "聊天记录增加", notes = "聊天记录增加")
	@RequestMapping(value = "/add", method = {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody StateResultList<List<ChatRecord>> add(@ModelAttribute ChatRecord chatRecord, HttpSession session) {
		boolean am = chatRecordService.add(chatRecord);
		if(am){
			List<ChatRecord> list = new ArrayList<>();
			list.add(chatRecord);
			return ResultUtil.getSlefSRSuccessList(list);
		}
		return ResultUtil.getSlefSRFailList(null);
	}
	/**
	 * 聊天记录删除
	 * @return
	 */
	@ApiOperation(value = "聊天记录删除", notes = "聊天记录删除")
	@ApiImplicitParams({
		  @ApiImplicitParam(name="chatRecordId",value="聊天记录ID",dataType="int", paramType = "query",required=true)
		  })
	@RequestMapping(value = "/delete", method = {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody StateResultList<List<ChatRecord>> delete(@RequestParam("chatRecordId") Integer chatRecordId,HttpSession session)  {
		ChatRecord chatRecord = chatRecordService.load(chatRecordId);
		boolean dm = chatRecordService.delete(chatRecordId);
		if(dm){
			List<ChatRecord> list = new ArrayList<>();
			list.add(chatRecord);
			return ResultUtil.getSlefSRSuccessList(list);
		}
		return ResultUtil.getSlefSRFailList(null);
	}
	/**
	 * 聊天记录浏览数量
	 * @return
	 */
	@ApiOperation(value = "聊天记录数量", notes = "聊天记录数量查询")
	@ApiImplicitParams({
			@ApiImplicitParam(name="accountId",value="账户id外键",dataType="int", paramType = "query"),
			@ApiImplicitParam(name="toAccountId",value="接收方账户id外键",dataType="int", paramType = "query"),
	})
	@RequestMapping(value = "/count", method = {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody StateResultList<List<Integer>> count(
			@RequestParam(value="accountId",required=false)Integer accountId,
			@RequestParam(value="toAccountId",required=false)Integer toAccountId,
			HttpSession session)  {
		Integer count = chatRecordService.count(accountId,toAccountId);
			List<Integer> list = new ArrayList<Integer>();
			list.add(count);
			return ResultUtil.getSlefSRSuccessList(list);
	}
	/**
	 * 聊天记录单个加载
	 * @return
	 */
	@ApiOperation(value = "聊天记录单个加载", notes = "聊天记录单个加载")
	@ApiImplicitParams({
		  @ApiImplicitParam(name="chatRecordId",value="聊天记录ID",dataType="int", paramType = "query",required=true)
		  })
	@RequestMapping(value = "/load", method = {RequestMethod.GET,RequestMethod.POST})
	public  StateResultList<List<ChatRecord>> load(@RequestParam("chatRecordId") Integer chatRecordId,HttpSession session)  {
		List<ChatRecord> list = new ArrayList<ChatRecord>();
		ChatRecord chatRecord = chatRecordService.load(chatRecordId);
			if(chatRecord!=null &&!chatRecord.equals("")){
				list.add(chatRecord);
				return ResultUtil.getSlefSRSuccessList(list);
			}else{
				throw new NotIsNotExistException("聊天记录");//不存在
			}
	}
	
}
