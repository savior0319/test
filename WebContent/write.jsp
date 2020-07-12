<%@page import="java.sql.Timestamp"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	Class.forName("org.mariadb.jdbc.Driver");

	Connection con = null;
	PreparedStatement pstmt = null;
	
	try {
	    request.setCharacterEncoding("UTF-8");
	    response.setContentType("application/json;charset=UTF-8");
	    response.setCharacterEncoding("UTF-8");
		
	    String userId = request.getParameter("user_id");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
	
		con = DriverManager.getConnection("jdbc:mariadb://localhost:3306/test", "test", "test");
		pstmt = con.prepareStatement("INSERT INTO tboard(TITLE, CONTENT, INSERT_ID, MODIFY_ID) VALUES(?, ?, ?, ?)");
	
		pstmt.setString(1, title);
		pstmt.setString(2, content);
		pstmt.setString(3, userId);
		pstmt.setString(4, userId);
	
		int result = pstmt.executeUpdate();
		System.out.print(result);
	
		if (result > 0) {
			con.commit();
			RequestDispatcher dispatcher = request.getRequestDispatcher("/success.jsp");
			dispatcher.forward(request, response);
		}
	
	} catch (Exception e) {
		System.out.println(e.getMessage());
	} finally {
		pstmt.close();
		con.close();
	}
%>
