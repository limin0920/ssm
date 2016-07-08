package com.icss.dao;

import java.util.List;

import com.icss.bean.Add_pers;

public interface Add_persMapper {
    int deleteByPrimaryKey(Integer pid);

    int insert(Add_pers record);

    int insertSelective(Add_pers record);

    Add_pers selectByPrimaryKey(Integer pid);

    int updateByPrimaryKeySelective(Add_pers record);

    int updateByPrimaryKey(Add_pers record);
    
    List<Add_pers> selectPerInfo();
    
    int addUser(Add_pers record);
    
    Add_pers getByloginid(Add_pers record);
    
    String selectPwdById(Integer pid);
    
    int updatePwdById(Add_pers pers);
}