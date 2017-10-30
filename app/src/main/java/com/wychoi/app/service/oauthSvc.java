package com.wychoi.app.service;

import java.io.IOException;

import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;

import com.google.api.client.auth.oauth2.Credential;
import com.google.api.services.gmail.Gmail;

public interface oauthSvc {
	public  void setClientId();
	public  void setClientSecret();
	public  Gmail getGmailService() throws IOException;
	public Credential authorize() throws IOException;
	public  void googleLogin() throws IOException;
}
