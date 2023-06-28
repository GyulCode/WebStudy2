package com.sist.dao;

//dbcp
import java.util.*;
import java.sql.*;
import javax.sql.*;
import javax.naming.*;
public class ReplyBoardDAO {
	//연결
	private Connection conn;
	//sql 전송
	private PreparedStatement ps;
	//싱글턴
	private static ReplyBoardDAO dao;
	
	public static ReplyBoardDAO newInstance() {
		if(dao==null)
			dao=new ReplyBoardDAO();
		return dao;
	}
	//주소값 얻기
	public void getConnection() {
		try {
			Context init=new InitialContext();
			Context c=(Context)init.lookup("java://comp/env");
			DataSource ds=(DataSource)c.lookup("jdbc/oracle");
			conn=ds.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//반환
	public void disConnection() {
		try {
			if(ps!=null) ps.close();
			if(conn!= null) conn.close();
			//오라클 전송 : exit
		} catch (Exception ex) {}
	}
	
	//기능수행
	//1.목록
	public List<ReplyBoardVO> boardListData(int page){
		List<ReplyBoardVO> list = new ArrayList<ReplyBoardVO>();
		try {
			getConnection();
			String sql="SELECT no, subject, name, to_char(regdate,'YYYY-MM-DD'), hit, group_tab, num "
					+ "FROM(SELECT no, subject, name, regdate, hit, group_tab, rownum as num "
					+ "FROM(SELECT no, subject, name, regdate, hit, group_tab "
					+ "FROM replyboard ORDER BY group_id DESC, group_step ASC)) "
					+ "WHERE num BETWEEN ? AND ?";
			ps=conn.prepareStatement(sql);
			int rowsize=10;
			int start=(rowsize*page)-(rowsize-1);
			int end=rowsize*page;
			ps.setInt(1, start);
			ps.setInt(2, end);
			
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				ReplyBoardVO vo=new ReplyBoardVO();
				vo.setNo(rs.getInt(1));
				vo.setSubject(rs.getString(2));
				vo.setName(rs.getString(3));
				vo.setDbday(rs.getString(4));
				vo.setHit(rs.getInt(5));
				vo.setGroup_tab(rs.getInt(6));
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
	//1-1총페이지
	public int boardRowCount() {
		int count=0;
		try {
			getConnection();
			String sql="SELECT COUNT(*) FROM replyBoard";
			ps=conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			rs.next();
			count = rs.getInt(1);
			rs.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			disConnection();
		}
		return count;
	}
	//2.상세보기
	//3.추가
	//4.수정
	//5.삭제
	//6.답변
	//7.검색

}
