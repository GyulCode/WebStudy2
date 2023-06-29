package com.sist.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.model.BoardModel;


@WebServlet("*.do")
public class DispatcherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
	}

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String cmd=request.getRequestURI();
		cmd=cmd.substring(cmd.lastIndexOf("/")+1);
		BoardModel model=new BoardModel();
		String jsp="";
		if(cmd.equals("list")) {
			jsp=model.boardList(request);
			
		}else if(cmd.equals("insert.do")) {
			jsp=model.boardInsert(request);
			
		}else if(cmd.equals("update.do")) {
			jsp=model.boardUpdate(request);
			
		}else if(cmd.equals("delete.do")) {
			jsp=model.boardDelete(request);
		}
		
		RequestDispatcher rs=request.getRequestDispatcher(jsp);
		rs.forward(request, response);
		
	}

}
