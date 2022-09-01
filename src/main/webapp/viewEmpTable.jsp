<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%! //변수 선언
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String user = "hr";
	String pass = "hr";
	
	String sql = "SELECT e.EMPLOYEE_ID, e.FIRST_NAME, e.HIRE_DATE, d.DEPARTMENT_NAME , e.SALARY , e.MANAGER_ID, mgr.first_NAME mgrName	\n"
				+"FROM 	EMPLOYEES e, DEPARTMENTS d , EMPLOYEES mgr	\n"
				+"WHERE  e.DEPARTMENT_ID = d.DEPARTMENT_ID	\n"
				+"AND mgr.EMPLOYEE_ID = e.MANAGER_ID	\n"
				+"ORDER BY e.EMPLOYEE_ID";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>사원정보</title>
</head>
<body>
  <hr>
	<table width="800" border="1">
		<tr>
			<th>사번</th>
			<th>이름</th>
			<th>입사일</th>
			<th>근무부서</th>
			<th>매니저</th>
			<th>급여</th>
		</tr>
		<%
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url, user, pass);
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
        out.print("<tr>\n");
				out.print("<td>"+rs.getInt("EMPLOYEE_ID")+"</td>\n");
				out.print("<td>"+rs.getString("FIRST_NAME")+"</td>\n");
				out.print("<td>"+rs.getString("HIRE_DATE")+"</td>\n");
				out.print("<td>"+rs.getString("DEPARTMENT_NAME")+"</td>\n");
				out.print("<td>"+rs.getString("mgrName")+"</td>\n");
				out.print("<td>"+rs.getInt("SALARY")+"</td>\n");
				out.print("</tr>\n");
      }
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				if(rs != null) 	 rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		
	%>
	</table>
  
</body>
</html>







