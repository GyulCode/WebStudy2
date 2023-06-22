package com.sist.temp;
// 관련됨 데이터를 모아서관리 / 전송
/*
 * 변수 : private -> 은닉화 ->보안
 * 접근시 처리 : set, get, is -> boolean
 * 그래서 여기서는 캡슐화 방식을 사용함
 * bean(빈즈)는 자바클래스를 jsp연동이 되게 만드는 기능 
 * 
 */
public class SawonBean {
	private String name,sex,dept,job;
	private int pay;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getDept() {
		return dept;
	}
	public void setDept(String dept) {
		this.dept = dept;
	}
	public String getJob() {
		return job;
	}
	public void setJob(String job) {
		this.job = job;
	}
	public int getPay() {
		return pay;
	}
	public void setPay(int pay) {
		this.pay = pay;
	}
	

}
