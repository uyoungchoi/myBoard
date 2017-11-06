package com.wychoi.app.controller;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.wychoi.app.impl.oauthSvcImpl;


/**
 * Handles requests for the application home page.
 */
@Controller
public class homeCon {
	
	private static final Logger logger = LoggerFactory.getLogger(homeCon.class);
	
	//메인페이지로 이동
	@RequestMapping(value = "/home.do", method = RequestMethod.GET)
	public ModelAndView home(Locale locale, Model model) {
		ModelAndView mv = new ModelAndView("/home/home");  //홈으로 이동
		return mv;
	}
	//로그인 성공시 callback 될 함수
	@RequestMapping(value = "/Callback", method = RequestMethod.GET)
	public ModelAndView googleCallback(Model model, HttpServletRequest request) {
		String code = request.getParameter("code");
		ModelAndView mv = new ModelAndView("/oauth/loginSuccess");  //홈으로 이동
		mv.addObject(code);
		return mv;
	}
}
