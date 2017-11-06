package com.wychoi.app.data;

import java.util.Date;

public class scheduleData {
	private String writer;
	private int shareAcl;
	private String title;
	private String loofQuery;
	private int number;
	private String content;
	private Date writeDate;
	private Date startDate;
	private Date endDate;
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public void setShareAcl(int shareAcl) {
		this.shareAcl = shareAcl;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public void setLoofQuery(String loofQuery) {
		this.loofQuery = loofQuery;
	}
	public void setNumber(int number) {
		this.number = number;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	public String getWriter() {
		return writer;
	}
	public int getShareAcl() {
		return shareAcl;
	}
	public String getTitle() {
		return title;
	}
	public String getLoofQuery() {
		return loofQuery;
	}
	public int getNumber() {
		return number;
	}
	public String getContent() {
		return content;
	}
	public Date getWriteDate() {
		return writeDate;
	}
	public Date getStartDate() {
		return startDate;
	}
	public Date getEndDate() {
		return endDate;
	}
	
}
