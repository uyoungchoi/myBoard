package com.wychoi.app;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.wychoi.app.impl.oauthSvcImpl;

@Controller
public class scheduleCon {
	private static final Logger logger = LoggerFactory.getLogger(homeCon.class);
	
	//access, refresh token�� �������� �ڵ�?
	@RequestMapping(value = "schedule/addSchedule.do", method = RequestMethod.GET)
	public ModelAndView getToken(Locale locale, Model model) {
		//���������ͷ� db ���� ����
		ModelAndView mv = new ModelAndView("/home/home");  //Ȩ���� �̵�
		return mv;
	}
}
