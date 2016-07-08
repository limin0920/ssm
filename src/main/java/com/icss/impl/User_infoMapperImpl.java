package com.icss.impl;

import java.util.List;

import org.apache.ibatis.session.RowBounds;

import com.github.pagehelper.ISelect;
import com.github.pagehelper.PageHelper;
import com.icss.bean.CustomerStauts;
import com.icss.bean.User_info;
import com.icss.dao.User_infoMapper;
import com.icss.util.BasicSqlSupport;
import com.icss.util.PageBean;

public class User_infoMapperImpl extends BasicSqlSupport implements User_infoMapper{
	
	public static final int PAGESIZE=10;

	@Override
	public int deleteByPrimaryKey(Integer uid) {
		// TODO Auto-generated method stub
		return this.session.delete("com.icss.dao.User_infoMapper.deleteByPrimaryKey",uid);
	}

	@Override
	public int insert(User_info record) {
		// TODO Auto-generated method stub
		System.out.println("来了");
		return this.session.insert("com.icss.dao.User_infoMapper.insert",record);
	}

	@Override
	public int insertSelective(User_info record) {
		// TODO Auto-generated method stub
		return this.session.insert("com.icss.dao.User_infoMapper.insertSelective",record);
	}

	@Override
	public User_info selectByPrimaryKey(Integer uid) {
		// TODO Auto-generated method stub
		return this.session.selectOne("com.icss.dao.User_infoMapper.selectByPrimaryKey", uid);
	}

	@Override
	public int updateByPrimaryKeySelective(User_info record) {
		// TODO Auto-generated method stub
		return this.session.update("com.icss.dao.User_infoMapper.updateByPrimaryKeySelective", record);
	}

	@Override
	public int updateByPrimaryKey(User_info record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public PageBean<User_info> selectAllInfo(int pagenum) {
		// TODO Auto-generated method stub
		PageHelper.startPage(pagenum, PAGESIZE);
		//System.out.println("******************************");
		List<User_info> list = this.session.selectList("com.icss.dao.User_infoMapper.selectAllInfo");
		return new PageBean<User_info>(list);
	}

	@Override
	public PageBean<CustomerStauts> selectCustomerStatus(Integer pid,int pagenum) {
		// TODO Auto-generated method stub
		PageHelper.startPage(pagenum,PAGESIZE);
		if(pid!=0){
			List<CustomerStauts> list = this.session.selectList("com.icss.dao.User_infoMapper.selectCustomerStatus", pid);
			return new PageBean<CustomerStauts>(list);
		}else{
			List<CustomerStauts> list = this.session.selectList("com.icss.dao.User_infoMapper.selectCustomerStatus1");
			return new PageBean<CustomerStauts>(list);
		}
	}

	@Override
	public PageBean<User_info> selectAllInfo(int pagenum, int pid) {
		PageHelper.startPage(pagenum, 10);
		List<User_info> list = this.session.selectList("com.icss.dao.User_infoMapper.selectinfoBySale",pid);
		return new PageBean<User_info>(list);
	}

}
