package com.sist.dao;
import java.util.*;
import java.sql.*;
import javax.sql.*;// 데이터베이스의 정보 = DataSource
import javax.naming.*;//jdbc/oracle이란 이름의 객체주소 찾기 Context 
public class FoodDAO {
	//코드 필요
   // 연결 객체 
   private Connection conn;
   // SQL 송수신 
   private PreparedStatement ps;
   // 싱글턴 객체
   private static FoodDAO dao;
   
   //미리 생선된 객체 읽기 ->Connection(DBCP) -> 연결에 소모되는 시간을 절약
   //DBCP는 웹에서만 사용이 가능 -> 자바 에플리케이션에서는 사용이불가능
  
   public void getConnection()
   {
	   try
	   {
		   // JNDI연결 => 저장 공간 (가상 디렉토리) Java Naming Directory Interface
		   Context init=new InitialContext();
		   // POOL => java://comp/env 
		   Context c=(Context)init.lookup("java://comp/env");
		   // 저장된 Connection => jdbc/oracle 
		   DataSource ds=(DataSource)c.lookup("jdbc/oracle");
		   // Coonection 주소 저장 
		   conn=ds.getConnection();
	   }catch(Exception ex)
	   {
		   ex.printStackTrace();
	   }
   }
   
   // 사용이 종료 => 반환 => 재사용이 가능 
   public void disConnection()
   {
	   // connection을 close하면 반환 => commons-dbcp.jar
	   try
	   {
		   if(ps!=null) ps.close();
		   if(conn!=null) conn.close();
	   }catch(Exception ex) {}
   }
   // 싱글턴 (한개의 객체만 사용) => Spring(기본)
   // 클래스 관리자 => 클래스(Component) => 관리(Container)
   public static FoodDAO newInstance()
   {
	   if(dao==null)
		   dao=new FoodDAO();
	   return dao; 
   }
   // 기능 (맛집 찾기) 
   public List<FoodBean> foodAllData()
   {
	   List<FoodBean> list=
			   new ArrayList<FoodBean>();
	   try
	   {
		   // Connection주소 얻기
		   getConnection();
		   String sql="SELECT poster, name, phone, FROM food_house";
		   ps=conn.prepareStatement(sql);
		   ResultSet rs =ps.executeQuery();
		   
		   while(rs.next()) {
			   FoodBean vo = new FoodBean();
			   vo.setName(rs.getString(2));
			   vo.setTel(rs.getString(3));
			   String poster;
			   
		   }
				   
		   
	  
			 
		   rs.close();
	   }catch(Exception ex)
	   {
		   ex.printStackTrace();
	   }
	   finally
	   {
		   disConnection();// 반환 
	   }
	   return list;
   }
   
  
   
}