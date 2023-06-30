package com.sist.model;

import java.lang.reflect.Method;
import java.util.Scanner;

import com.sist.controller.RequestMapping;

class Board{
	@RequestMapping("list.do")
	public void boardList() {
		System.out.println("목록 출력");
	}
	
	@RequestMapping("insert.do")
	public void boardInsert() {
		System.out.println("목록 삽입");
	}
	
	@RequestMapping("update.do")
	public void boardUpdate() {
		System.out.println("목록 수정");
	}
	
	@RequestMapping("delete.do")
	public void boardDelete() {
		System.out.println("삭제");
	}
	
	@RequestMapping("find.do")
	public void boardFind() {
		System.out.println("목록 찾기");
	}
}


public class MainClass {
	public static void main(String[] args) {
		Scanner scan=new Scanner(System.in);
		System.out.println("입력:");
		String url=scan.next();
		
		/*
		//찾기
		Board board=new Board();
		if(url.equals("list.do")) {
			board.boardList();
		}
		if(url.equals("insert.do")) {
			board.boardInsert();
		}
		*/
		
		try {
			Class clsName=Class.forName("com.sist.model.Board");
			Object obj=clsName.getDeclaredConstructor().newInstance();
			//Board board=new board();
			
			Method[] methods=clsName.getDeclaredMethods();//클래스 내부에 정의된 모든 메소드를 읽어온다.
			for(Method m:methods) {

				//메소드위에 어노테이션 확인
				RequestMapping rm=m.getAnnotation(RequestMapping.class);
				if(rm.value().equals(url)) {
					m.invoke(obj, null);
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		
	}


}
