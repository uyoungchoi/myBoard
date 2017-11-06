package com.wychoi.app.controller;

import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonParser;
import com.wychoi.app.impl.scheduleSvcImpl;

@Controller
public class scheduleCon {
	
	private static final Logger logger = LoggerFactory.getLogger(homeCon.class);
	
	private static scheduleSvcImpl scheduleSvc;
	
	//스케줄추가
	@RequestMapping(value = "schedule/addSchedule.do", method = RequestMethod.GET)
	public @ResponseBody JSONObject addSchedule(HttpServletRequest request) {
	
		scheduleSvc = new scheduleSvcImpl();
		
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		HashMap<String, String> jsonObject = new HashMap<String, String>();
		jsonObject.put("title", title);
		jsonObject.put("content", content);
		
		//받은데이터로 db 쿼리 생성
		scheduleSvc.addSchedule(jsonObject);
		JSONObject returnData = new JSONObject();
		returnData.put("status", "success");
		
		return returnData;
	}
}
