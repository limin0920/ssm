package com.icss.dao;

import java.util.List;

import com.icss.bean.Department;

public interface DepartmentMapper {
    int deleteByPrimaryKey(Integer did);

    int insert(Department record);

    int insertSelective(Department record);

    Department selectByPrimaryKey(Integer did);

    int updateByPrimaryKeySelective(Department record);

    int updateByPrimaryKey(Department record);
    
    List<Department> selectDeptInfo();
}