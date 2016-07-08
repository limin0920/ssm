package com.icss.business;

import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.icss.bean.Department;
import com.icss.dao.DepartmentMapper;

public class DepartmentBusiness {
	private DepartmentMapper departmentDAO = null;

	public DepartmentMapper getDepartmentDAO() {
		return departmentDAO;
	}

	public void setDepartmentDAO(DepartmentMapper departmentDAO) {
		this.departmentDAO = departmentDAO;
	}

	public int insert(HttpServletRequest request){
		Department department = new Department();
		department.setDid(Integer.parseInt(request.getParameter("did")));
		department.setdName(request.getParameter("dName"));
		department.setdRemark(request.getParameter("dRemark"));
		
		return departmentDAO.insert(department);
	}
	
	public StringBuilder select(){
		
		List<Department> list = departmentDAO.selectDeptInfo();
//		Iterator<Department> it = list.iterator();
//		System.out.println("这里取到查询出来的集合");
//		while(it.hasNext()){
//			System.out.println(it.next().getDid()+" : "+it.next().getdName() +"-------"+it.next().getdRemark());
//		}
//		System.out.println(list.size());
//		
		
		StringBuilder sbHtml = new StringBuilder("<option value='0'>请选择</option>");
		for (Department department : list) {
			Integer did = department.getDid();
			String dname = department.getdName();
			sbHtml.append("<option value=\"");
			sbHtml.append(did);
			sbHtml.append("\">");
			sbHtml.append(dname);
			sbHtml.append("</option>");
		}
		//System.out.println(sbHtml.toString());
		return sbHtml;
	}
	
	public String checkdeptno(String did){
		
		List<Department> list = departmentDAO.selectDeptInfo();
		Iterator<Department> it  = list.iterator();
		while(it.hasNext()){
			if(it.next().getDid().toString().equals(did)){
				return "已存在该编号";
			}
		}
		return null;
		
	}
	
	public String checkdeptname(String dname){
		
		List<Department> list = departmentDAO.selectDeptInfo();
		Iterator<Department> it  = list.iterator();
		while(it.hasNext()){
			if(it.next().getdName().equals(dname)){
				System.out.println(dname);
				return "已存在该部门名称";
				
			}
			
			
		}
		return null;
	}
}
