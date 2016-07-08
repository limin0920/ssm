package com.icss.business;

import com.icss.bean.Pay_code;
import com.icss.dao.Pay_codeMapper;


public class Pay_codeBusiness {
	
	private Pay_codeMapper pay_codeDAO;

	public Pay_codeMapper getPay_codeDAO() {
		return pay_codeDAO;
	}

	public void setPay_codeDAO(Pay_codeMapper pay_codeDAO) {
		this.pay_codeDAO = pay_codeDAO;
	}
	
	public int inserCode(Pay_code pcode){
		System.out.println("加入签单");
		pay_codeDAO.insert(pcode);
		return 0;
	}

	public Pay_code selectOne(Integer cid){
		return pay_codeDAO.selectByPrimaryKey(cid);
	}
}
