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
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글목록</title>
</head>
<body>
	<h1>글목록</h1>
	<hr>
	<%
	@SuppressWarnings("all")
	ArrayList<HashMap<String, String>> aList = (ArrayList<HashMap<String, String>>) request.getAttribute("boardList");
	%>
	<table border="1">
		<tr>
			<th>글번호</th>
			<th>제목</th>
			<th>내용</th>
			<th>작성자</th>
			<th>작성시간</th>
		</tr>
	<%
	int i;
	for (i = 0; i < aList.size(); i++) {
	%>
		<tr>
			<td><%=aList.get(i).get("boardSeq")%></td>
			<td><%=aList.get(i).get("title")%></td>
			<td><%=aList.get(i).get("content")%></td>
			<td><%=aList.get(i).get("insertId")%></td>
			<td><%=aList.get(i).get("insertDate")%></td>
		</tr>
	<%
	}
	%>
	</table>
	<br>
	<button type="button" onclick="back();">뒤로가기</button>
</body>
<script type="text/javascript">
	function back(){
		window.history.go(-1);
	}
</script>
</html>



