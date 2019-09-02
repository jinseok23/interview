package com.kh.ticketsky.payment.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class PaymentDaoImpl implements PaymentDao 
{

	@Override
	public List<Map<String, String>> performSelectOne(SqlSessionTemplate sqlSession, int performNo) 
	{
		return sqlSession.selectList("payment.paymentSelectOne",performNo);
	}

}
