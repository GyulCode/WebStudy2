package com.sist.moel;

import javax.servlet.http.HttpServletRequest;

import com.sist.controller.RequestMapping;

public class BoardModel {
	@RequestMapping("board/list.do")
	public String boardList(HttpServletRequest request) {
		request.setAttribute("msg", "게시판 목록");
		return "../board/list.jsp";
	}
	@RequestMapping("board/insert.do")
	public String boardInsert(HttpServletRequest request) {
		request.setAttribute("msg", "게시판 데이터 추가");
		return "../board/insert.jsp";
	}
	
	@RequestMapping("board/update.do")
	public String boardUpdate(HttpServletRequest request) {
		request.setAttribute("msg", "게시판 데이터 수정");
		return "../board/update.jsp";
	}
	
	@RequestMapping("board/delete.do")
	public String boardDelete(HttpServletRequest request) {
		request.setAttribute("msg", "게시판 데이터 삭제");
		return "../board/delete.jsp";
	}

}
