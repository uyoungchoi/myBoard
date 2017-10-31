package com.wychoi.app.impl;

import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.google.api.client.auth.oauth2.AuthorizationCodeRequestUrl;
import com.google.api.client.auth.oauth2.AuthorizationCodeTokenRequest;
//gmail연동
import com.google.api.client.auth.oauth2.Credential;
import com.google.api.client.auth.oauth2.Credential.Builder;
import com.google.api.client.auth.oauth2.TokenResponse;
import com.google.api.client.auth.oauth2.TokenResponseException;
import com.google.api.client.extensions.java6.auth.oauth2.AuthorizationCodeInstalledApp;
import com.google.api.client.extensions.java6.auth.oauth2.VerificationCodeReceiver;
import com.google.api.client.extensions.jetty.auth.oauth2.LocalServerReceiver;
import com.google.api.client.googleapis.auth.oauth2.GoogleAuthorizationCodeFlow;
import com.google.api.client.googleapis.auth.oauth2.GoogleAuthorizationCodeRequestUrl;
import com.google.api.client.googleapis.auth.oauth2.GoogleClientSecrets;
import com.google.api.client.googleapis.javanet.GoogleNetHttpTransport;
import com.google.api.client.http.GenericUrl;
import com.google.api.client.http.HttpTransport;
import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.api.client.json.jackson2.JacksonFactory;
import com.google.api.client.json.JsonFactory;
import com.google.api.client.util.store.FileDataStoreFactory;
import com.google.api.client.util.store.MemoryDataStoreFactory;
import com.google.api.services.gmail.GmailScopes;
import com.google.api.services.gmail.model.*;
import com.wychoi.app.service.oauthSvc;
import com.google.api.services.calendar.CalendarScopes;
import com.google.api.services.gmail.Gmail;

import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.security.GeneralSecurityException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

@Component
public class oauthSvcImpl implements oauthSvc{
	String ClientId;
	String ClientSecret;
	final String APPLICATION_NAME;
	HttpTransport HTTP_TRANSPORT;
	FileDataStoreFactory DATA_STORE_FACTORY;
	JacksonFactory JSON_FACTORY;
	final List<String> SCOPES;

	//@Autowired
    private SqlSession query;
	
	public oauthSvcImpl(){

		//set함수로 세팅하는 것으로 변경
		ClientId = "null";  //자신이 생성한 client Id, client Secret
		ClientSecret = "null";
		
		 APPLICATION_NAME =
		        "Gmail API Java Quickstart";

	    JSON_FACTORY =
	            JacksonFactory.getDefaultInstance();
	    
	    try {
			HTTP_TRANSPORT = GoogleNetHttpTransport.newTrustedTransport();
		} catch (GeneralSecurityException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	    //https://developers.google.com/gmail/api/auth/scopes 범위에 관한 구글 문서
	    SCOPES = Arrays.asList(CalendarScopes.CALENDAR);  //모든 권한 허용
	}
	@Override
    public  void setClientId() {
		//현재 세션을 이용하여 사용자 id 가져오기
		//clientId로 db 접근
		try{ 
			System.out.println("SqlSession ===> " + query);
			List<String> result = query.selectList("oauth.getToken");
		} catch(Exception e) {
			e.printStackTrace();
		}
		List<String> result = query.selectList("oauth.getToken");
		String clientId = result.get(0);
		this.ClientId = clientId;
	}
    @Override
	public  void setClientSecret() {
		//ClientSecret = clientSecret;
	}
	@Override
    public  Gmail getGmailService() throws IOException {
        Credential credential = authorize();
        return new Gmail.Builder(HTTP_TRANSPORT, JSON_FACTORY, credential)
                .setApplicationName("wychoi gmail")
                .build();
    }
    @Override
    public Credential authorize() throws IOException {
       GoogleAuthorizationCodeFlow flow =
                new GoogleAuthorizationCodeFlow.Builder(
                        HTTP_TRANSPORT, JSON_FACTORY, ClientId, ClientSecret, SCOPES)
                .setAccessType("offline")
                .build();
    	
       LocalServerReceiver lsr = new LocalServerReceiver.Builder().setPort(8081).setHost("localhost").build();
        Credential credential = new AuthorizationCodeInstalledApp(
                flow,lsr).authorize("user");

        /*setClientId(credential.getAccessToken());
        setClientSecret(credential.getRefreshToken());*/
        
        //db추가
        System.out.println("access : "+credential.getAccessToken());
        System.out.println("access : "+credential.getRefreshToken());
        return credential;
        
    }
    @Override
	public  void googleLogin() throws IOException{
		setClientId();
		setClientSecret();
		// TODO Auto-generated method stub
		Gmail service = getGmailService();

	}
    
}
