package com.wychoi.app.controller;

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
public class oauthCon {
	private static final Logger logger = LoggerFactory.getLogger(homeCon.class);
	
	//access, refresh token을 가져오는 코드?
	@RequestMapping(value = "oauth/getToken.do", method = RequestMethod.GET)
	public ModelAndView getToken(Locale locale, Model model) {
		ModelAndView mv = new ModelAndView("/home/home");  //홈으로 이동
		return mv;
	}

	//login으로 들어왔을 경우, google Login함수를 호출하여 구글 로그인을 함
	@RequestMapping(value = "oauth/login.do", method = RequestMethod.GET)
	public void oauthLogin(Locale locale, Model model) throws Exception {
		//clientId, clientSecret세팅해주기
		oauthSvcImpl oauthSvc = new oauthSvcImpl();
		try {
			oauthSvc.googleLogin();
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}
}
