<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>
</head>
<body>
	<h1>글쓰기</h1>
	<hr>
	<form action="/write.jsp" method="post">
	<pre>
<input type="text" name="user_id" placeholder="작성자" maxlength="20" style="width: 100px;">&nbsp;<input type="text" name="title" placeholder="제목입력" maxlength="80" style="width: 740px;">

<textarea name="content" rows="40" cols="120" placeholder="내용입력" maxlength="4000"></textarea>
<button type="submit">완료</button> <button type="button" onclick="back();">뒤로가기</button>
	</pre>
	</form>
</body>
<script type="text/javascript">
	function back(){
		window.history.go(-1);
	}
</script>
</html>