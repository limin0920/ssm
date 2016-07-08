package com.icss.impl;

import java.util.List;

import com.icss.bean.Add_pers;
import com.icss.dao.Add_persMapper;
import com.icss.util.BasicSqlSupport;

public class Add_persMapperImpl extends BasicSqlSupport implements Add_persMapper{

	@Override
	public int deleteByPrimaryKey(Integer pid) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insert(Add_pers record) {
		// TODO Auto-generated method stub
		int count=this.session.insert("com.icss.dao.Add_persMapper.insert",record);
		return count;
	}

	@Override
	public int insertSelective(Add_pers record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Add_pers selectByPrimaryKey(Integer pid) {
		// TODO Auto-generated method stub
		return this.session.selectOne("com.icss.dao.Add_persMapper.selectByPrimaryKey", pid);
	}

	@Override
	public int updateByPrimaryKeySelective(Add_pers record) {
		// TODO Auto-generated method stub
		return this.session.update("com.icss.dao.Add_persMapper.updateByPrimaryKeySelective", record);
	}

	@Override
	public int updateByPrimaryKey(Add_pers record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Add_pers> selectPerInfo() {
		// TODO Auto-generated method stub
		
		return this.session.selectList("com.icss.dao.Add_persMapper.selectPerInfo");
	}

	@Override
	public int addUser(Add_pers record) {
		// TODO Auto-generated method stub
		return this.session.update("com.icss.dao.Add_persMapper.addUser",record);
	}

	@Override
	public Add_pers getByloginid(Add_pers record) {
		// TODO Auto-generated method stub
		//System.out.println("插叙语句执行");
		Add_pers pers = this.session.selectOne("com.icss.dao.Add_persMapper.getByloginid", record);
//		System.out.println("登录名："+pers.getpLoginid());
//		System.out.println("mima"+pers.getpPassword());
		return pers;
	}

	@Override
	public String selectPwdById(Integer pid) {
		// TODO Auto-generated method stub
		System.out.println("查找密码");
		return this.session.selectOne("com.icss.dao.Add_persMapper.selectPwdById",pid);
	}

	@Override
	public int updatePwdById(Add_pers pers) {
		// TODO Auto-generated method stub
		return this.session.update("com.icss.dao.Add_persMapper.updatePwdById", pers);
	}
 
}
