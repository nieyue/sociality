package com.nieyue.controller;

import com.nieyue.bean.Circle;
import com.nieyue.exception.NotAnymoreException;
import com.nieyue.exception.NotIsNotExistException;
import com.nieyue.service.CircleService;
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
 * 朋友圈控制类
 * @author yy
 *
 */
@Api(tags={"circle"},value="朋友圈",description="朋友圈管理")
@RestController
@RequestMapping("/circle")
public class CircleController {
	@Resource
	private CircleService circleService;
	
	/**
	 * 朋友圈分页浏览
	 * @param orderName 商品排序数据库字段
	 * @param orderWay 商品排序方法 asc升序 desc降序
	 * @return
	 */
	@ApiOperation(value = "朋友圈列表", notes = "朋友圈分页浏览")
	@ApiImplicitParams({
	  @ApiImplicitParam(name="accountId",value="账户id外键",dataType="int", paramType = "query"),
	  @ApiImplicitParam(name="pageNum",value="页头数位",dataType="int", paramType = "query",defaultValue="1"),
	  @ApiImplicitParam(name="pageSize",value="每页数目",dataType="int", paramType = "query",defaultValue="10"),
	  @ApiImplicitParam(name="orderName",value="排序字段",dataType="string", paramType = "query",defaultValue="update_date"),
	  @ApiImplicitParam(name="orderWay",value="排序方式",dataType="string", paramType = "query",defaultValue="desc")
	  })
	@RequestMapping(value = "/list", method = {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody StateResultList<List<Circle>> list(
			@RequestParam(value="accountId",required=false)Integer accountId,
			@RequestParam(value="pageNum",defaultValue="1",required=false)int pageNum,
			@RequestParam(value="pageSize",defaultValue="10",required=false) int pageSize,
			@RequestParam(value="orderName",required=false,defaultValue="update_date") String orderName,
			@RequestParam(value="orderWay",required=false,defaultValue="desc") String orderWay)  {
			List<Circle> list = new ArrayList<Circle>();
			list= circleService.list(accountId,pageNum, pageSize, orderName, orderWay);
			if(list.size()>0){
				return ResultUtil.getSlefSRSuccessList(list);
			}else{
				throw new NotAnymoreException();//没有更多
			}
	}
	/**
	 * 朋友圈修改
	 * @return
	 */
	@ApiOperation(value = "朋友圈修改", notes = "朋友圈修改")
	@RequestMapping(value = "/update", method = {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody StateResultList<List<Circle>> update(@ModelAttribute Circle circle,HttpSession session)  {
		boolean um = circleService.update(circle);
		if(um){
			List<Circle> list = new ArrayList<>();
			list.add(circle);
			return ResultUtil.getSlefSRSuccessList(list);
		}
		return ResultUtil.getSlefSRFailList(null);
	}
	/**
	 * 朋友圈增加
	 * @return 
	 */
	@ApiOperation(value = "朋友圈增加", notes = "朋友圈增加")
	@RequestMapping(value = "/add", method = {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody StateResultList<List<Circle>> add(@ModelAttribute Circle circle, HttpSession session) {
		if(circle.getPraisePoints()==null){
			circle.setPraisePoints(0);
		}
		boolean am = circleService.add(circle);
		if(am){
			List<Circle> list = new ArrayList<>();
			list.add(circle);
			return ResultUtil.getSlefSRSuccessList(list);
		}
		return ResultUtil.getSlefSRFailList(null);
	}
	/**
	 * 朋友圈删除
	 * @return
	 */
	@ApiOperation(value = "朋友圈删除", notes = "朋友圈删除")
	@ApiImplicitParams({
		  @ApiImplicitParam(name="circleId",value="朋友圈ID",dataType="int", paramType = "query",required=true)
		  })
	@RequestMapping(value = "/delete", method = {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody StateResultList<List<Circle>> delete(@RequestParam("circleId") Integer circleId,HttpSession session)  {
		Circle Circle = circleService.load(circleId);
		boolean dm = circleService.delete(circleId);
		if(dm){
			List<Circle> list = new ArrayList<>();
			list.add(Circle);
			return ResultUtil.getSlefSRSuccessList(list);
		}
		return ResultUtil.getSlefSRFailList(null);
	}
	/**
	 * 朋友圈浏览数量
	 * @return
	 */
	@ApiOperation(value = "朋友圈数量", notes = "朋友圈数量查询")
	@ApiImplicitParams({
			@ApiImplicitParam(name="accountId",value="账户id外键",dataType="int", paramType = "query"),
	})
	@RequestMapping(value = "/count", method = {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody StateResultList<List<Integer>> count(
			@RequestParam(value="accountId",required=false)Integer accountId,
			HttpSession session)  {
		Integer count = circleService.count(accountId);
			List<Integer> list = new ArrayList<Integer>();
			list.add(count);
			return ResultUtil.getSlefSRSuccessList(list);
	}
	/**
	 * 朋友圈单个加载
	 * @return
	 */
	@ApiOperation(value = "朋友圈单个加载", notes = "朋友圈单个加载")
	@ApiImplicitParams({
		  @ApiImplicitParam(name="circleId",value="朋友圈ID",dataType="int", paramType = "query",required=true)
		  })
	@RequestMapping(value = "/load", method = {RequestMethod.GET,RequestMethod.POST})
	public  StateResultList<List<Circle>> load(@RequestParam("circleId") Integer circleId,HttpSession session)  {
		List<Circle> list = new ArrayList<Circle>();
		Circle circle = circleService.load(circleId);
			if(circle!=null &&!circle.equals("")){
				list.add(circle);
				return ResultUtil.getSlefSRSuccessList(list);
			}else{
				throw new NotIsNotExistException("朋友圈");//不存在
			}
	}
	
}
