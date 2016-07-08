package com.icss.conroller;

import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.icss.bean.Add_pers;
import com.icss.bean.User_info;
import com.icss.business.Add_persBusiness;
import com.icss.business.User_infoBusiness;
import com.icss.util.PageBean;

@Controller
@RequestMapping("/frame")
public class Frame_left {
	@Resource(name="user_infoBusiness")
	private User_infoBusiness user_infoBusiness = null;
	
	@Resource(name="add_persBusiness")
	private Add_persBusiness add_persBusiness = null;

	public void setAdd_persBusiness(Add_persBusiness add_persBusiness) {
		this.add_persBusiness = add_persBusiness;
	}

	public void setUser_infoBusiness(User_infoBusiness user_infoBusiness) {
		this.user_infoBusiness = user_infoBusiness;
	}
	
	@RequestMapping("/admin_manager.do")
	public String admin_manager(){
		//System.out.println("管理员");
		return "admin/admin_manager";
	}
	
	
	@RequestMapping("/customer_manager.do")
	public String customer_manager(HttpSession session){
		
		PageBean<User_info> page = user_infoBusiness.selectAllInfo(1,session);
		List<User_info> costomer = page.getList();
		
//		Iterator<User_info> it = costomer.iterator();
//		while(it.hasNext()){
//			User_info user = new User_info();
//			user = it.next();
//			System.out.println(user.getUid()+"%%%"+user.getUname());
//		}
		System.out.println("=============总页数为"+page.getPages());
		
		session.setAttribute("allCostomerInfo", costomer);
		session.setAttribute("pages", page.getPages());
		
		return "customer/customer_management";
	}
	
	@RequestMapping("business_code.do")
	public String business_code(){
		return "business/business_code";
	}
	
	@RequestMapping("employee_manager.do")
	public String employee_manager(){
		return "employee/Employee_manager";
		
	}
	
	@RequestMapping("showMe.do")
	public String showMe(HttpServletRequest request,HttpSession session){
		String uid =request.getParameter("uid");
		if(!"".equals(uid) && uid!=null){
			Add_pers pers = add_persBusiness.selectoneper(uid);
			session.setAttribute("loginper", pers);
		}
		return "mine";
	}
	
	@RequestMapping("editMyInfo.do")
	public String editMyInfo(){
		return "admin/edit_mineInfo";
	}
	
	@RequestMapping("editPwd.do")
	public String editPwd(){
		return "admin/edit_pwd";
	}
}
