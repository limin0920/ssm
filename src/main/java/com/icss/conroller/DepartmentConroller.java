package com.icss.conroller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.icss.business.DepartmentBusiness;

@Controller
@RequestMapping("/dept")
public class DepartmentConroller {
	
	@Resource(name="departmentBusiness")
	private DepartmentBusiness departmentBusiness = null;
	
	public void setDepartmentBusiness(DepartmentBusiness departmentBusiness) {
		this.departmentBusiness = departmentBusiness;
	}
	
	
	/**
	 * 
	 * 新增部门信息
	 */
	@RequestMapping("add.do")
	public ModelAndView dept(HttpServletRequest request){
//		System.out.println("部门名称："+request.getParameter("dName"));
//		System.out.println("编号"+request.getParameter("did"));
//		System.out.println("描述"+request.getParameter("dRemark"));
		departmentBusiness.insert(request);
		String msg = "新增部门成功";
		return new ModelAndView("admin/admin_manager","msg",msg);
	}
	
	/**
	 * 
	 *查看部门信息
	 */
	@RequestMapping(value="selectDeptInfo.do", produces = "text/plain;charset=UTF-8")
	public @ResponseBody  String selectDeptInfo(HttpServletRequest request){
//		System.out.println("从ajax中传来的参数  表名："+request.getParameter("tablename"));
//		System.out.println("这里是查看部门信息下拉框");
		StringBuilder sb = departmentBusiness.select();
		String selectHtml = sb.toString();
		//return new ModelAndView("admin/admin_manager","selectHtml",selectHtml);
		//System.out.println(selectHtml);
		return selectHtml;
	}
	
	/**
	 * 查找所有部门编号
	 */
	@RequestMapping(value="selectAllDeptno.do", produces = "text/plain;charset=UTF-8")
	public @ResponseBody  String selectAllDeptno(HttpServletRequest request){
//		System.out.println("查找部门编号的代码");
		System.out.println("传过来的部门编号是："+request.getParameter("did"));
		String did = request.getParameter("did");
		
		return departmentBusiness.checkdeptno(did);
	}
	
	/**
	 * 查找所有部门名称
	 */
	@RequestMapping(value="selectAllDeptname.do", produces = "text/plain;charset=UTF-8")
	public @ResponseBody String selectAllDeptname(HttpServletRequest request){
		System.out.println("传过来的部门编号是："+request.getParameter("dname"));
		String dname = request.getParameter("dname");
		
		return departmentBusiness.checkdeptname(dname);
	}

}
