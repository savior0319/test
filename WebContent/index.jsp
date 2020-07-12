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
<title>홈</title>
</head>
<body>
	<h1>하이</h1>
	<hr>
	<a href="/writeform.jsp">글쓰기</a>
	<a href="/boardlist.jsp">글목록</a>
</body>
</html>


<%

/*

	CREATE TABLE `TBOARD` (
		`BOARD_SEQ` BIGINT(20) NOT NULL AUTO_INCREMENT,
		`TITLE` TEXT(65535) NOT NULL DEFAULT '',
		`CONTENT` LONGTEXT NOT NULL DEFAULT '' ,
		`INSERT_ID` MEDIUMTEXT NOT NULL DEFAULT '' ,
		`MODIFY_ID` TEXT(65535) NOT NULL DEFAULT '',
		`DELETE_YN` INT(11) NOT NULL DEFAULT '0',
		`INSERT_DATE` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(),
		`MODIFY_DATE` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(),
		PRIMARY KEY (`BOARD_SEQ`) USING BTREE
	);

*/

%>