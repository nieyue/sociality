package com.nieyue.controller;

import com.nieyue.bean.Role;
import com.nieyue.exception.NotAnymoreException;
import com.nieyue.exception.NotIsNotExistException;
import com.nieyue.service.RoleService;
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
 * 角色控制类
 * @author yy
 *
 */
@Api(tags={"role"},value="角色",description="角色管理")
@RestController
@RequestMapping("/role")
public class RoleController {
	@Resource
	private RoleService roleService;
	
	/**
	 * 角色分页浏览
	 * @param orderName 商品排序数据库字段
	 * @param orderWay 商品排序方法 asc升序 desc降序
	 * @return
	 */
	@ApiOperation(value = "角色列表", notes = "角色分页浏览")
	@ApiImplicitParams({
	  @ApiImplicitParam(name="pageNum",value="页头数位",dataType="int", paramType = "query",defaultValue="1"),
	  @ApiImplicitParam(name="pageSize",value="每页数目",dataType="int", paramType = "query",defaultValue="10"),
	  @ApiImplicitParam(name="orderName",value="排序字段",dataType="string", paramType = "query",defaultValue="update_date"),
	  @ApiImplicitParam(name="orderWay",value="排序方式",dataType="string", paramType = "query",defaultValue="desc")
	  })
	@RequestMapping(value = "/list", method = {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody StateResultList<List<Role>> list(
			@RequestParam(value="pageNum",defaultValue="1",required=false)int pageNum,
			@RequestParam(value="pageSize",defaultValue="10",required=false) int pageSize,
			@RequestParam(value="orderName",required=false,defaultValue="update_date") String orderName,
			@RequestParam(value="orderWay",required=false,defaultValue="desc") String orderWay)  {
			List<Role> list = new ArrayList<Role>();
			list= roleService.list(pageNum, pageSize, orderName, orderWay);
			if(list.size()>0){
				return ResultUtil.getSlefSRSuccessList(list);
			}else{
				throw new NotAnymoreException();//没有更多
			}
	}
	/**
	 * 角色修改
	 * @return
	 */
	@ApiOperation(value = "角色修改", notes = "角色修改")
	@RequestMapping(value = "/update", method = {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody StateResultList<List<Role>> update(@ModelAttribute Role role,HttpSession session)  {
		boolean um = roleService.update(role);
		if(um){
			List<Role> list = new ArrayList<>();
			list.add(role);
			return ResultUtil.getSlefSRSuccessList(list);
		}
		return ResultUtil.getSlefSRFailList(null);
	}
	/**
	 * 角色增加
	 * @return 
	 */
	@ApiOperation(value = "角色增加", notes = "角色增加")
	@RequestMapping(value = "/add", method = {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody StateResultList<List<Role>> add(@ModelAttribute Role role, HttpSession session) {
		boolean am = roleService.add(role);
		if(am){
			List<Role> list = new ArrayList<>();
			list.add(role);
			return ResultUtil.getSlefSRSuccessList(list);
		}
		return ResultUtil.getSlefSRFailList(null);
	}
	/**
	 * 角色删除
	 * @return
	 */
	@ApiOperation(value = "角色删除", notes = "角色删除")
	@ApiImplicitParams({
		  @ApiImplicitParam(name="roleId",value="角色ID",dataType="int", paramType = "query",required=true)
		  })
	@RequestMapping(value = "/delete", method = {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody StateResultList<List<Role>> delete(@RequestParam("roleId") Integer roleId,HttpSession session)  {
		Role role = roleService.load(roleId);
		boolean dm = roleService.delete(roleId);
		if(dm){
			List<Role> list = new ArrayList<>();
			list.add(role);
			return ResultUtil.getSlefSRSuccessList(list);
		}
		return ResultUtil.getSlefSRFailList(null);
	}
	/**
	 * 角色浏览数量
	 * @return
	 */
	@ApiOperation(value = "角色数量", notes = "角色数量查询")
	@RequestMapping(value = "/count", method = {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody StateResultList<List<Integer>> count(HttpSession session)  {
		Integer count = roleService.count();
			List<Integer> list = new ArrayList<Integer>();
			list.add(count);
			return ResultUtil.getSlefSRSuccessList(list);
	}
	/**
	 * 角色单个加载
	 * @return
	 */
	@ApiOperation(value = "角色单个加载", notes = "角色单个加载")
	@ApiImplicitParams({
		  @ApiImplicitParam(name="roleId",value="角色ID",dataType="int", paramType = "query",required=true)
		  })
	@RequestMapping(value = "/load", method = {RequestMethod.GET,RequestMethod.POST})
	public  StateResultList<List<Role>> load(@RequestParam("roleId") Integer roleId,HttpSession session)  {
		List<Role> list = new ArrayList<Role>();
		Role role = roleService.load(roleId);
			if(role!=null &&!role.equals("")){
				list.add(role);
				return ResultUtil.getSlefSRSuccessList(list);
			}else{
				throw new NotIsNotExistException("角色");//不存在
			}
	}
	
}
