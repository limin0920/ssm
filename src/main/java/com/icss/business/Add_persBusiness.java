package com.icss.business;

import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.icss.bean.Add_pers;
import com.icss.bean.Department;
import com.icss.dao.Add_persMapper;

public class Add_persBusiness {
	private Add_persMapper persDAO = null;

	public Add_persMapper getPersDAO() {
		return persDAO;
	}

	public void setPersDAO(Add_persMapper persDAO) {
		this.persDAO = persDAO;
	}
	
	

	public int insert(HttpServletRequest request){
		
		Add_pers add_pers = new Add_pers();
		add_pers.setpName(request.getParameter("pName"));
		add_pers.setpSex(request.getParameter("pSex"));
		add_pers.setDid(Integer.parseInt(request.getParameter("pDepartment")));
		add_pers.setpLoginid(request.getParameter("pName"));
		//add_pers.setpPassword("123456");
		add_pers.setpCardid(request.getParameter("pCardid"));
		add_pers.setpTel(request.getParameter("pTel"));
		add_pers.setpPos(request.getParameter("pPos"));

		
		return persDAO.insert(add_pers);
		
	}
	
	public String checkPerName(String name){
	
		List<Add_pers> list = persDAO.selectPerInfo();
		Iterator<Add_pers> it  = list.iterator();
		while(it.hasNext()){
			
			String s = it.next().getpName();
			if(s.equals(name)){
				return "yes";
			}
		}
		return "没有该员工或已经添加了角色信息";
		
	}
	
//	public List<Add_pers> selectPerInfo(){
//		List<Add_pers> pers = persDAO.selectPerInfo();
//		return pers;
//	}

	public String addUser(Add_pers pers){
		System.out.println(persDAO.addUser(pers));;
		return null;
	}
	
	public Add_pers login(Add_pers pers) {
		
//		System.out.println(pers.getpLoginid());
	
		return persDAO.getByloginid(pers);
	}
	
	public int updatePerInfo(Add_pers pers){
		return persDAO.updateByPrimaryKeySelective(pers);
	}
	
	public Add_pers selectoneper(String str){
		Integer pid = Integer.valueOf(str);
		return persDAO.selectByPrimaryKey(pid);
	}
	
	public String selectPwdById(HttpServletRequest request){
		String oldpwd = request.getParameter("oldPwd");
		Integer pid = Integer.valueOf(request.getParameter("pid"));
		System.out.println(oldpwd);
		System.out.println(pid);
		String pwd = persDAO.selectPwdById(pid);
		System.out.println(pwd);
		if(!oldpwd.equals(pwd)){
			System.out.println("密码不正确");
			return "原密码不正确";
		}else{
			System.out.println("mima ");
			return "yes";
		}
		
	}
	
	public int updatePwdById(Add_pers pers){
		
		return persDAO.updatePwdById(pers);
	}
	
}
