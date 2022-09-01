<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="email.EmaillistDao"%>
<%@ page import="email.EmaillistVo"%>

<%
/* 	request.setCharacterEncoding("UTF-8");
	String email = request.getParameter("email");
	EmaillistDao dao = new EmaillistDao();
	
	EmaillistVo vo = new EmaillistVo(email);
	
	if (dao.delete(vo)) {
		response.sendRedirect("list.jsp");
	} else { */
		
		
	request.setCharacterEncoding("UTF-8");
	String emailNo = request.getParameter("emailNo");
	EmaillistDao dao = new EmaillistDao();
	
	if (dao.delete(emailNo)) {
		response.sendRedirect("list.jsp");
	} else {
%>
	<script type="text/javascript">
		alert("데이터 삭제 실패");
		history.go(-1);
	</script>
<%
}
%>
