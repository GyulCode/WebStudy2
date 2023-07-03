package com.sist.controller;

import java.io.File;
import java.io.IOException;
import java.lang.reflect.Method;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;



/*
 * 1. 요청(JSP)[list.do insert.do] -> DispatcherServlet을 찾는다.
 *                                 -> 서버에서 받을 수 있는 부분 URI URL
 *                                    URI -> MODEL부분을 찾는다.
 * 2. DispatcherServlet(controller) 
 *    FrontController : 요청 -> Model로 연결해줌 -> request를 전송
 *                             요청을 처리하는 기능
 *                             
 * 3. MVC의 목적 : 보안(JSP -> 배포 : 소스를 통으로..)
 *               역할분담(Front(jsp)), Back(java,dao)
 *               자바와 html을 분리하는 이유
 *               확장, 재사용, 변경이 쉽다(jsp는 한번 사용하고버림)
 * 4.동작순서
 * JSP(링크,버튼)  ---.do --- DispatcherServlet ---request ---- Model(Dao <=>오
 *                                                           결과값을 request에 
 *                                                           request.setAttribute
 *                                                           
 * JSP       ---request----  DispatcherServlet  --- request로 넘겨준다
 * 
 * 5.DispatcherServlet은 최대한 고정
 * 
 * 6.등록(model클래스) -> xml로 세팅 (메뉴판)
 * 7. 메소드 찾기 -> 어노테이션 (메소드 자동호출이 가능)
 * -> 어려움 : 맥 / 윈도우
 * 
 * 
 */


import java.net.*;
import java.util.*;
@WebServlet("*.do")
public class DispatcherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private List<String> clsLsit=new ArrayList<String>();
	// 초기화 -> XML
	
	//초기화 ->xml에 등록된 클래스 읽기(메뉴)
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		try {
			URL url=this.getClass().getClassLoader().getResource(".");
			File file=new File(url.toURI());
			//System.out.println(file.getPath());
			//C:\WebDev\webStudy\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\JSPMVCFinalProject\WEB-INF\classes
			
			String path=file.getPath();
			path=path.replace("\\", File.separator);
			// window -> \\ , Mac -> /임
			path=path.substring(0,path.lastIndexOf(File.separator));
			System.out.println(path);
			path=path+File.separator+"application.xml";
			
			//XML 파싱
			DocumentBuilderFactory dbf=DocumentBuilderFactory.newInstance(); //싱글턴
			//파서기 (XML -> DocumentBuilder, HTML -> Jsoup)
			DocumentBuilder db=dbf.newDocumentBuilder();
			//파서
			Document doc=db.parse(new File(path));
			Element beans=doc.getDocumentElement();
			System.out.println(beans.getTagName());
			
			//같은 태그를 묶어서 사용
			NodeList list=beans.getElementsByTagName("bean");
			for(int i=0; i<list.getLength();i++) {
				//bean 태그를 1개씩 가지고 온다.
				Element bean=(Element)list.item(i);
				String id=bean.getAttribute("id");
				String cls=bean.getAttribute("class");
				System.out.println(id+":"+cls);
				clsLsit.add(cls);
				
				
			}
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		//웹에서 사용자 요청 -> servlet/jsp
		//servlet은 화면 출력은 하지 않는다(연결)
		//화면 : jsp(View)
		//필요한 데이터 읽기
		//root태그 -> beans
		
	}

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			
		
		String path=request.getRequestURI();
		path=path.substring(request.getContextPath().length()+1);
		//  http://localhost/JSPMVCFinalProject/food/category.do  <--URL
		//  /JSPMVCFinalProject/food/category.do  <--URI
		//  food/category.do 폴더명부터 제어 
		
		for(String cls:clsLsit) {
			// class 정보 읽기
			Class clsName=Class.forName(cls);
			//메모리 할당
			Object obj=clsName.getDeclaredConstructor().newInstance();
			//메소드를 읽어온다.
			Method[] methods=clsName.getDeclaredMethods();
			for(Method m:methods) {
				RequestMapping rm=m.getAnnotation(RequestMapping.class);
				if(rm.value().equals(path)) {
					String jsp=(String)m.invoke(obj, request,response);
					if(jsp==null) { //void (ajax)
						return;
					}
					else if(jsp.startsWith("redirect:")) {
						//sendredirect
						response.sendRedirect(jsp.substring(jsp.indexOf(":")+1));
						
					}else {
						RequestDispatcher rd=request.getRequestDispatcher(jsp);
						rd.forward(request, response);
					}
					return;
				}
			}
			
			
		}
		
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		
	}

}
