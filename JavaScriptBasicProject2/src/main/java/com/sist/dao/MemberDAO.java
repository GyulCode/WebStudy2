package com.sist.dao;

import java.security.DrbgParameters.NextBytes;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class MemberDAO {
	private Connection conn; // 오라클 연결 객체( DB 연결)
	private PreparedStatement ps; // SQL문장 전송/ 결과값 읽기
	private final String URL = "jdbc:oracle:thin:@localhost:1521:XE";
	//                         ---- ------  ---    ----    ---   --
	//                          db         서버연결   서버명   서버주소  db이름
	// My SQL -> jdbc:mysql ://localhost/mydb
	
	private static MemberDAO dao; // 싱글턴 패턴 , DAO객체를 한개만 사용이 가능하게 만든다
	
	// 드라이버 설치 -> 소프트웨어 (메모리 할당 요청) Class.forName()
	// 클래스의 정보를 전송
	// 드라이버 설치는 1번만 수행
	public MemberDAO() {
		try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver"); // 뭔가 연결 , 드라이버인가..?
		}catch (Exception ex) {}
	}
		
	// 오라클 연결
	public void getConnection() {
		try
		{
			// 오라클 접속(connection) 전송값 : conn hr/happy
			conn=DriverManager.getConnection(URL,"hr","happy");
		}catch(Exception ex) {}
	}
	
	// 연결종료
	public void disConnection() {
		try {
			if(ps!=null) ps.close();
			if(conn!= null) conn.close();
			//오라클 전송 : exit
		} catch (Exception ex) {}
	}
	
	// DAO객체를 1개만 생성해서 사용 -> 메모리 누수현상을 방지(싱글턴 패턴)
	// 싱글턴 / 팩토리 패턴은 단골 면접(스프링:패턴 8개)
	
	public static MemberDAO newInstance() {
		// newInstance(), getInstance() -> 싱글턴
		if(dao == null)
			dao=new MemberDAO();
		return dao;
	}
	
		
	//5. 우편번호 검색 기능
	public List<ZipcodeVO> postfind(String dong){
		List<ZipcodeVO> list = new ArrayList<ZipcodeVO>();
		
		try {
			getConnection();
			String sql="SELECT zipcode,sido,gugun,dong,NVL(bunji,' ') "
					+ "FROM zipcode "
					+ "WHERE dong LIKE '%'||?||'%'";
			ps=conn.prepareStatement(sql);
			ps.setString(1, dong);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				ZipcodeVO vo=new ZipcodeVO();
				vo.setZipcode(rs.getString(1));
				vo.setSido(rs.getString(2));
				vo.setGugun(rs.getString(3));
				vo.setDong(rs.getString(4));
				vo.setBunji(rs.getString(5));
				list.add(vo);
				
			}
					
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			disConnection();
		}
		return list;
				
	}
	
	// 동 갯수 
	public int postfindCount(String dong){
		int count=0;
		
		try {
			getConnection();
			String sql="SELECT count(*) "
					+ "FROM zipcode "
					+ "WHERE dong LIKE '%'||?||'%'";
			ps=conn.prepareStatement(sql);
			ps.setString(1, dong);
			ResultSet rs = ps.executeQuery();
			rs.next();
			count=rs.getInt(1);
			rs.close();
			
			
					
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			disConnection();
		}
		return count;
				
	}

}
