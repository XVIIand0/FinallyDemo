<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>注册</title>
</head>

<body>
<h2>注册页面</h2>
<hr/>
<form method="POST" action="register.jsp">
<table>
	<tr>
	<td><label for="username">用户名:</label></td>
	<td><input type="text" name="username" id="username" /></td>
	</tr>
	<tr>
	<td><label for="password">密码:</label></td>
	<td><input type="password" name="password" id="password" /></td>
	</tr>
	<tr>
	<td><label for="email">邮箱:</label></td>
	<td><input type="email" name="email" id="email"/></td>
	<tr>
	<td colspan="2"><input type="submit" value="注册" /></td>
	</tr>
</table>
</form>
</body>
</html>
