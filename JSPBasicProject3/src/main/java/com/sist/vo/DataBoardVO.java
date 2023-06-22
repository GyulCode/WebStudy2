package com.sist.vo;

//beans -> 데이터를 모아서 관리(전송)
//private 변수, getter/setter -> 캡슐화 방식(데이터 보호)
/*
* 빈즈 연결
* jsp 액션 태그
* <jsp:useBean>
* <jsp:setProperty>
* <jsp:getProperty>
* <jsp:param>
* <jsp:include>
* <jsp:forward>
* 
NO NUMBER,
name varchar2(51) CONSTRAINT jd_name_nn NOT null,
subject varchar2(1000)CONSTRAINT jd_sub_nn NOT null,
content clob CONSTRAINT jd_cont_nn NOT null,
pwd varchar2(10) CONSTRAINT jd_pwd_nn NOT null,
regdate DATE DEFAULT sysdate,
hit NUMBER DEFAULT 0,
filename varchar2(260),
filesize NUMBER DEFAULT 0,

bean -> model1 (jsp)
~vo -> spring
~dto -> mybatis

*/
import java.util.*;
public class DataBoardVO {
	private int no, hit, filesize;
	private String name, subject, content, pwd, filename, dbday;
	private Date regdate;
	
	
	public String getDbday() {
		return dbday;
	}
	public void setDbday(String dbday) {
		this.dbday = dbday;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public int getFilesize() {
		return filesize;
	}
	public void setFilesize(int filesize) {
		this.filesize = filesize;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
	
	
	
	
	
	
	
}
