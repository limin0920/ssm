package com.icss.conroller;

import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.icss.bean.Add_pers;
import com.icss.bean.CustomerStauts;
import com.icss.bean.Pay_code;
import com.icss.bean.User_info;
import com.icss.business.Pay_codeBusiness;
import com.icss.business.User_infoBusiness;
import com.icss.util.PageBean;

@Controller
@RequestMapping("/customer")
public class User_infoConroller {
	
	@Resource(name="user_infoBusiness")
	private User_infoBusiness user_infoBusiness = null;
	
	@Resource(name="pay_codeBusiness")
	private Pay_codeBusiness pay_codeBusiness  = null;

	public void setPay_codeBusiness(Pay_codeBusiness pay_codeBusiness) {
		this.pay_codeBusiness = pay_codeBusiness;
	}


	public void setUser_infoBusiness(User_infoBusiness user_infoBusiness) {
		this.user_infoBusiness = user_infoBusiness;
	}

	
	/**
	 * 
	 * 增加客户信息，[加签单信息]
	 * @param request
	 * @param session
	 * @param user
	 * @return
	 */
	
	@RequestMapping("/addCustomer.do")
	public String addCustomer(HttpServletRequest request,HttpSession session, @ModelAttribute("user") User_info user ){
		Add_pers pers = (Add_pers) session.getAttribute("loginper");
		user.setPid(pers.getPid());
		
		int uid =user_infoBusiness.insertCustomer(user);
		if("1".equals(request.getParameter("whether_pay"))){
			
			System.out.println(request.getParameter("cstime"));
			Pay_code pcode = new Pay_code();
			pcode.setCarea(request.getParameter("carea"));
			pcode.setCtype(request.getParameter("ctype"));
			pcode.setCstime(new Date());//签单时间
			pcode.setCdepartment(pers.getDid().toString());
			pcode.setCif("");
			pcode.setConesale(pers.getpName());
			pcode.setCtwosale(pers.getpName());
			pcode.setCpay(Integer.parseInt(request.getParameter("cpay")));
			pcode.setChostel(Integer.parseInt(request.getParameter("chostel")));
			pcode.setUid(uid);
			pcode.setCremark(request.getParameter("cremark"));
			
			pay_codeBusiness.inserCode(pcode);
		}

		return "redirect:/frame/customer_manager.do"; 
	}
	
	/**
	 * 删除客户信息（保证没有签单）
	 * @return
	 */
	@RequestMapping("deleteOneCustomer.do")
	public String deleteOneCustomer(HttpServletRequest request){
		Integer uid =Integer.valueOf(request.getParameter("cuid"));
		System.out.println(uid);
		user_infoBusiness.delectOneCustomer(uid);
		return "customer/customer_management";
	}
	
	/**
	 * 查看客户状态（已签单，为签单，已收款）
	 */
	@RequestMapping(value="selectCustomerStatus.do", produces = "text/plain;charset=UTF-8")
	public  @ResponseBody String selectCustomerStatus(HttpSession session){
		System.out.println("查询客户状态");
		String part = ((Add_pers)session.getAttribute("loginper")).getpPart();
		Integer pid;
		if("0".equals(part)||"2".equals(part)){
			pid = 0;
		}else{
			pid = ((Add_pers)session.getAttribute("loginper")).getPid();
		}
		PageBean<CustomerStauts> page = user_infoBusiness.selectCustomerStatus(pid,1);
		List<CustomerStauts> list = page.getList();
		session.setAttribute("pages", page.getPages());
		JSONArray jsonArray = JSONArray.fromObject(list);
		return jsonArray.toString();
	}
	
	/**
	 * 
	 *编辑客户信息
	 */
	@RequestMapping("edit_customer.do")
	public String editCustomer(@ModelAttribute("user_info") User_info user_info){
		System.out.println("更新编辑客户信息");
		System.out.println("客户编号为"+user_info.getUid());
		user_infoBusiness.updataCustomerInfo(user_info);
		return "redirect:/frame/customer_manager.do";
	}

	/**
	 * 查看某个客户信息
	 */
	@RequestMapping("selectOnecustomer.do")
	public ModelAndView selectOnecustomer(HttpServletRequest request){
		String str = request.getParameter("uid");
		User_info user = user_infoBusiness.selectOneCustomer(str);
		return new ModelAndView("customer/edit_customer","user",user);
	}
	
	/**
	 * 分页
	 */
	
	@RequestMapping(value="pageselect.do", produces = "text/plain;charset=UTF-8")
	public @ResponseBody String pageselect(HttpServletRequest request,HttpSession session){
		String pageNum = request.getParameter("pageNum");
		System.out.println(pageNum);
		int num;
		if(pageNum==null||"NaN".equals(pageNum)){
			num=0;
		}else{
			num=Integer.parseInt(pageNum);
		}
		System.out.println("获得的页码"+num);
		PageBean<User_info> page = user_infoBusiness.selectAllInfo(num,session);
		List<User_info> costomer = page.getList();
		Iterator<User_info> it=costomer.iterator();
		while(it.hasNext()){
			User_info user = it.next();
			System.out.println(user.getUname()+"**"+user.getUschool());
		}
		session.setAttribute("pages", page.getPages());
		System.out.println("页数为"+page.getPages());
		JSONArray jsonArray = JSONArray.fromObject(costomer);
		return jsonArray.toString();
	}
	
	/**
	 * 新增签单(页面跳转)
	 */
	@RequestMapping(value="addcode.do", produces = "text/plain;charset=UTF-8")
	public String addcode(HttpServletRequest request){
		String cuid = request.getParameter("cuid");
		String cname = request.getParameter("cuname");
		System.out.println("***************"+cuid);
		String name;
		try {
			name = new String(cname.getBytes("iso-8859-1"),"utf-8");
			request.setAttribute("customername", name);
			request.setAttribute("customerid", cuid);
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  
		return "customer/add_code";
	}
	/**
	 * 新增签单(增加数据)
	 */
	@RequestMapping("addonecode.do")
	public String addonecode(@ModelAttribute("paycode") Pay_code paycode,HttpServletRequest request){
		
		paycode.setCstime(new Date());
		System.out.println(paycode.getUid());
		pay_codeBusiness.inserCode(paycode);
		return "customer/customer_management";
	}
	
	/**
	 * 核对收款
	 */
	@RequestMapping("cheques.do")
	public String cheques(HttpServletRequest request){
		Integer cid = Integer.valueOf(request.getParameter("cid")); 
		String str = request.getParameter("uname");
		String uname;
		try {
			uname = new String(str.getBytes("iso-8859-1"),"utf-8");
			request.setAttribute("uname", uname);
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Pay_code code = pay_codeBusiness.selectOne(cid);
		request.setAttribute("codeInfo", code);
		return "customer/cheques";
	}
}
