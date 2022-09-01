<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String user = "webdb";
	String pass = "1234";
	
	
	String sql = "insert into emaillist values (seq_emaillist_no.nextval,?,?,?)";
	request.setCharacterEncoding("utf-8");
	
	String last_name =   request.getParameter("last_name");
	String first_name = request.getParameter("first_name");
	String email = request.getParameter("email");
	
	try{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection(url, user, pass);
		
		//미리 미완성의 sql을 등록시켜 놓겠다.
		pstmt = conn.prepareStatement(sql); 
		
		//바인딩 시키기
		pstmt.setString(1, last_name);
		pstmt.setString(2, first_name);
		pstmt.setString(3, email);
		
		pstmt.executeUpdate(); // insert update delete (반영 건수 리턴)
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		try{
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
  
  response.sendRedirect("viewAuthorTable.jsp");
%>
