package com.icss.dao;


import com.icss.bean.CustomerStauts;
import com.icss.bean.User_info;
import com.icss.util.PageBean;

public interface User_infoMapper {
    int deleteByPrimaryKey(Integer uid);

    int insert(User_info record);

    int insertSelective(User_info record);

    User_info selectByPrimaryKey(Integer uid);

    int updateByPrimaryKeySelective(User_info record);

    int updateByPrimaryKey(User_info record);
    
    PageBean<User_info> selectAllInfo(int pagenum);
    
    PageBean<User_info> selectAllInfo(int pagenum,int pid);
    
    PageBean<CustomerStauts> selectCustomerStatus(Integer pid,int pagenum);
    
}