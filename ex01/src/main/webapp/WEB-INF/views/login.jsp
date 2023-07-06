<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>로그인</h1>
	<form method="post" action="./loginAction">
		아이디 : <input type="text" name="id" value="admin">
		비밀번호 : <input type="text" name="pw" value="1234">
		<input type="submit" value="로그인">
	</form>
</body>
</html>