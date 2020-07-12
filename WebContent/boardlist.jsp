<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
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
	ResultSet rs = null;
	
	try {
		request.setCharacterEncoding("UTF-8");
	    response.setContentType("application/json;charset=UTF-8");
	    response.setCharacterEncoding("UTF-8");
		
	
		con = DriverManager.getConnection("jdbc:mariadb://localhost:3306/test", "test", "test");
		
		StringBuffer sb = new StringBuffer();
		sb.append("   SELECT A.BOARD_SEQ   AS boardSeq,    					           ");
		sb.append("          A.TITLE   AS title,    					                   ");
		sb.append("          A.CONTENT     AS content,     						   ");
		sb.append("          A.INSERT_ID   AS insertId,   				 		   ");
		sb.append("          DATE_FORMAT(A.INSERT_DATE, '%Y/%m/%d %H:%i') AS insertDate,   ");
		sb.append("          A.DELETE_YN   AS deleteYn     						   ");
		sb.append("    FROM  TBOARD A;                     						   ");
		
		pstmt = con.prepareStatement(sb.toString());
		rs  = pstmt.executeQuery();
		
		ArrayList<HashMap<String, String>> aList = new ArrayList<HashMap<String, String>>();
		
		while (rs.next()) {
			HashMap<String, String> hMap =  new HashMap<String, String>();
			hMap.put("boardSeq", rs.getString("boardSeq"));
			hMap.put("title", rs.getString("title"));
			hMap.put("content", rs.getString("content"));
			hMap.put("insertId", rs.getString("insertId"));
			hMap.put("insertDate", rs.getString("insertDate"));
			hMap.put("deleteYn", String.valueOf(rs.getInt("deleteYn")));
			
			aList.add(hMap);
		}
		
		request.setAttribute("boardList", aList);
	    ServletContext context =getServletContext();
	    RequestDispatcher dispatcher = context.getRequestDispatcher("/boardlistview.jsp");
	    dispatcher.forward(request, response);
					
	} catch (Exception e) {
		System.out.println(e.getMessage());
	} finally {
		rs.close();
		pstmt.close();
		con.close();
	}
%>
