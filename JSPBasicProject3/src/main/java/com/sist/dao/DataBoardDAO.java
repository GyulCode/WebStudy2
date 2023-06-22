package com.sist.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.sist.vo.DataBoardVO;

public class DataBoardDAO {
	    // 연결 객체 socket
		private Connection conn;
		
		//송수신 SQL -> SQL 결과값(데이터값)
		private PreparedStatement ps;
		
		//URL
		private final String URL="jdbc:oracle:thin:@localhost:1521:XE";
		
		//singleton
		private static DataBoardDAO dao;
		
		//static -> 저장공간이 한개
		//드라이버 등록
		public DataBoardDAO() {
			try {
				Class.forName("oracle.jdbc.driver.OracleDriver");
			} catch (Exception ex) {
				ex.printStackTrace();
			}
			
		}
		
		//오라클 연결
		public void getConnection() {
			try {
				conn=DriverManager.getConnection(URL,"hr","happy");
			} catch (Exception ex) {
				ex.printStackTrace();
			}
		}
		
		//오라클 해제
		public void disConnection() {
			try {
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			} catch (Exception ex) {
				ex.printStackTrace();
				
			}
		}
		
		//싱글턴 처리
		public static DataBoardDAO newInstance() {
			if(dao==null)
				dao = new DataBoardDAO();
			return dao;
		}
	
	// 기능
	// 1. 목록별
	// 2. 블록별 -> 1,234,
	public List<DataBoardVO> databoardListData(int page){
		List<DataBoardVO> list = new ArrayList<DataBoardVO>();
		try {
			getConnection();
			String sql="SELECT no,subject,name,TO_CHAR(regdate,'YYYY-MM-DD'),hit,num "
					+ "FROM(SELECT no,subject,name,regdate,hit,rownum as num "
					+ "FROM(SELECT /*+ INDEX_DESC(jspDataBoard jd_no_pk)*/ no,subject,name,regdate,hit "
					+ "FROM jspDataBoard)) "
					+ "Where num BETWEEN ? AND ?";
			// TOP-N중간에 잘라올 수 없다. rownum
			
			ps=conn.prepareStatement(sql); //sql 문장 전송
			// ?에 값을 채운다
			int rowSize=10;
			int start=(rowSize*page)-(rowSize-1);
			int end=rowSize*page;
			/*
			 * rownum의 번호 에 따른 페이지 구분
			 * 1page 1~10
			 * 2page 11~20
			 */
			ps.setInt(1, start);
			ps.setInt(2, end);

			//실행
			ResultSet rs=ps.executeQuery();
			while(rs.next()){
				DataBoardVO vo= new DataBoardVO();
				vo.setNo(rs.getInt(1));
				vo.setSubject(rs.getString(2));
				vo.setName(rs.getString(3));
				vo.setDbday(rs.getString(4));
				vo.setHit(rs.getInt(5));
				list.add(vo);
			}
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			disConnection();
		}
		return list;
	}
	
	//총페이지
	public int databoardRowCount() {
		int count=0;
		try {
			getConnection();
			String sql="SELECT COUNT(*) FROM jspDataBoard";
			ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			rs.next();
			count=rs.getInt(1);
			rs.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			disConnection(); 
		}
		
		return count;
	}
	
	//데이터 추가
	public void databoardInsert(DataBoardVO vo){
		try {
			getConnection();
			String sql="INSERT INTO jspDataBoard VALUES("
					+ "jd_no_seq.nextval,?,?,?,?,SYSDATE,0,?,?)";
			ps=conn.prepareStatement(sql);
			
			//?값채우기
			ps.setString(1, vo.getName());
			ps.setString(2, vo.getSubject());
			ps.setString(3, vo.getContent());
			ps.setString(4, vo.getPwd());
			ps.setString(5, vo.getFilename());
			ps.setInt(6, vo.getFilesize());
			
			// 실행요청
			ps.executeUpdate();
			
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			disConnection();
		}
	}
	//내용보기
	public DataBoardVO databoardDetailData(int no) {
		DataBoardVO vo=new DataBoardVO();
		try {
			getConnection();
			String sql="UPDATE jspDataBoard SET "
					+ "hit=hit+1 "
					+ "WHERE no=?";
			
			ps=conn.prepareStatement(sql);
			ps.setInt(1, no);
			ps.executeQuery();
			
			sql = "SELECT no, name, subject, content,TO_CHAR(regdate,'YYYY-MM-DD'),hit, filename, filesize "
					+ "FROM jspDataBoard "
					+ "WHERE no=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, no);
			ResultSet rs=ps.executeQuery();
			rs.next();
			
			vo.setNo(rs.getInt(1));
			vo.setName(rs.getString(2));
			vo.setSubject(rs.getString(3));
			vo.setContent(rs.getString(4));
			vo.setDbday(rs.getString(5));
			vo.setHit(rs.getInt(6));
			vo.setFilename(rs.getString(7));
			vo.setFilesize(rs.getInt(8));
			
			rs.close();
					
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			disConnection();
		}
		return vo;
	}
}
