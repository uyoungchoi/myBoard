package com.wychoi.app.impl;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.json.JSONObject;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

import com.wychoi.app.service.scheduleSvc;

public class scheduleSvcImpl implements scheduleSvc{
	
	@Autowired
    private SqlSessionTemplate sqlSession;
	
	@Override
	public void addSchedule(HashMap<String, String> jsonObject) {
		AbstractApplicationContext ctx = new GenericXmlApplicationContext("classpath:/config/spring-context.xml");
		sqlSession = ctx.getBean("sqlSession", SqlSessionTemplate.class);
		
		System.out.println(jsonObject);
		System.out.println(jsonObject.toString());
		sqlSession.selectList("com.wychoi.query.addSchedule", jsonObject);
	}
}
