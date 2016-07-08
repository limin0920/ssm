package com.icss.impl;

import com.icss.bean.Pay_code;
import com.icss.dao.Pay_codeMapper;
import com.icss.util.BasicSqlSupport;

public class Pay_codeMapperImpl extends BasicSqlSupport implements Pay_codeMapper{

	@Override
	public int deleteByPrimaryKey(Integer cid) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insert(Pay_code record) {
		// TODO Auto-generated method stub
		return this.session.insert("com.icss.dao.Pay_codeMapper.insert",record);
		
	}

	@Override
	public int insertSelective(Pay_code record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Pay_code selectByPrimaryKey(Integer cid) {
		// TODO Auto-generated method stub
		return this.session.selectOne("com.icss.dao.Pay_codeMapper.selectByPrimaryKey", cid);
	}

	@Override
	public int updateByPrimaryKeySelective(Pay_code record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateByPrimaryKey(Pay_code record) {
		// TODO Auto-generated method stub
		return 0;
	}

}
