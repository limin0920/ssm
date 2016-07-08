package com.icss.dao;

import com.icss.bean.Pay_code;

public interface Pay_codeMapper {
    int deleteByPrimaryKey(Integer cid);

    int insert(Pay_code record);

    int insertSelective(Pay_code record);

    Pay_code selectByPrimaryKey(Integer cid);

    int updateByPrimaryKeySelective(Pay_code record);

    int updateByPrimaryKey(Pay_code record);
}