package com.icss.business;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.icss.bean.Add_pers;
import com.icss.bean.CustomerStauts;
import com.icss.bean.User_info;
import com.icss.dao.User_infoMapper;
import com.icss.util.PageBean;

public class User_infoBusiness {
	User_infoMapper user_infoDAO=null;

	public User_infoMapper getUser_infoDAO() {
		return user_infoDAO;
	}

	public void setUser_infoDAO(User_infoMapper user_infoDAO) {
		this.user_infoDAO = user_infoDAO;
	}
	
	public int insertCustomer(User_info user){
		//System.out.println("hhh");
		//user.setPid(2);
		user_infoDAO.insert(user);
		return user.getUid();
	}
	
	public PageBean<User_info> selectAllInfo(int pageNumber,HttpSession session){
		int pid = ((Add_pers)session.getAttribute("loginper")).getPid();
		String part = ((Add_pers)session.getAttribute("loginper")).getpPart();
		if("0".equals(part)||"2".equals(part)){
			return user_infoDAO.selectAllInfo(pageNumber);
		}else{
			return user_infoDAO.selectAllInfo(pageNumber,pid);
		}
	
	}
	
	public int delectOneCustomer(Integer uid ){
		return user_infoDAO.deleteByPrimaryKey(uid);
	}
	
	
	public PageBean<CustomerStauts> selectCustomerStatus(Integer pid,int pageNumber){
		return user_infoDAO.selectCustomerStatus(pid,pageNumber);
	}
	
	public User_info selectOneCustomer(String str){
		Integer uid = Integer.valueOf(str);
		return user_infoDAO.selectByPrimaryKey(uid);
	}
	
	public int updataCustomerInfo(User_info user_info){
		//System.out.println("更新数据");
		return user_infoDAO.updateByPrimaryKeySelective(user_info);
	}
	

}
