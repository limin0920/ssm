package com.icss.conroller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.icss.bean.Add_pers;
import com.icss.business.Add_persBusiness;
@Controller
@RequestMapping("/sale")
public class Add_persConroller {
	
	@Resource(name="add_persBusiness")
	private Add_persBusiness add_persBusiness = null;

	public void setAdd_persBusiness(Add_persBusiness add_persBusiness) {
		this.add_persBusiness = add_persBusiness;
	}
	
	
	/**
	 * 新增员工
	 */
	@RequestMapping("add.do")
	public ModelAndView sale(HttpServletRequest request){
		/*System.out.println("你想要检查etcmain");
		System.out.println("准备插入员工信息");
		System.out.println(request.getParameter("pName"));*/
		add_persBusiness.insert(request);
		String msg = "新增员工成功";
		return new ModelAndView("admin/admin_manager","msg",msg);
		
	}
	
	/**
	 * 
	 *	用户登录验证
	 */
	@RequestMapping("login.do")
	public String loginCheck(HttpSession session,@ModelAttribute("add_pers") Add_pers add_pers  ){
		/*System.out.println(add_pers.getpPassword());
		System.out.println(add_pers.getpLoginid());
		System.out.println(add_pers.getpPart());*/
		
		Add_pers pers = add_persBusiness.login(add_pers);
		
		if( pers == null ||  pers.getpPassword()==""){
			session.setAttribute("loginError", "密码错误");
			return "redirect:/login.jsp";
		}else if(pers.getpPassword().equals(add_pers.getpPassword())){
			System.out.println("登录成功！");
			pers.setpPassword("");
			session.setAttribute("loginper", pers);
			return "etcmain";
		}else{
			session.setAttribute("loginError", "请核对好相关信息再登录");
			return "redirect:/login.jsp";  
			
		}
	}
	
	/**
	 * 注销
	 */
	@RequestMapping("cancellation.do")
	public String  cancellation(HttpSession session){
		session.removeAttribute("loginper");
		return "redirect:/login.jsp";  
	}
	

	/**
	 * 检查是否存在该员工信息
	 */
	@RequestMapping(value="checkPerName.do", produces = "text/plain;charset=UTF-8")
	public @ResponseBody String checkPerName(HttpServletRequest request){
	
		String name = request.getParameter("name");
/*		System.out.println(name);
		System.out.println(add_persBusiness.checkPerName(name));*/
		
		return add_persBusiness.checkPerName(name);
			
	}

	/**
	 * 新增用户角色
	 */
	@RequestMapping("user.do")
	public String addUser(HttpServletRequest request){
		//System.out.println("adduser");
		String name = request.getParameter("name");
		String part = request.getParameter("role");
		String pwd = request.getParameter("pwd");
		System.out.println(part);
		System.out.println(name);
		if("".equals(pwd)||pwd==null){
			pwd = "123456";
		}
		Add_pers pers = new Add_pers();
		pers.setpName(name);
		pers.setpPart(part);
		pers.setpPassword(pwd);
		add_persBusiness.addUser(pers);
		return "admin/admin_manager";
	}
	
	/**
	 * 修改个人信息
	 */
	@RequestMapping("updataMyInfo.do")
	public String updataMyInfo(@ModelAttribute("pers") Add_pers pers){
		//System.out.println(pers.getpTel());
		//System.out.println("id为"+pers.getPid());
		add_persBusiness.updatePerInfo(pers);
		return "redirect:/frame/showMe.do?uid="+pers.getPid();
	}
	
	/**
	 * 检查原始密码
	 */
	@RequestMapping(value="checkPwd.do", produces = "text/plain;charset=UTF-8")
	public @ResponseBody String checkPwd(HttpServletRequest request){
		String pwd = add_persBusiness.selectPwdById(request);
		return pwd;
	}
	
	/**
	 * 更改密码
	 */
	@RequestMapping("updatePwd.do")
	public String updatePwd(@ModelAttribute("pers") Add_pers pers,HttpSession session){
//		System.out.println("更改密码");
//		System.out.println(pers.getPid());
//		System.out.println(pers.getpPassword());
		if(add_persBusiness.updatePwdById(pers)==1){
			session.removeAttribute("loginper");
			return "redirect:/login.jsp";
		}else{
			return "mine";
		}
		
	}
	
	
}
