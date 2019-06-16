<%@ page import = "java.sql.*, java.util.*" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@page import="java.util.*,java.io.*"%>

<html>
<head><title>最高銷售廣告</title></head>
<body>
<style>
img{
	width:10%;
}
.salesss{
	margin-top:10%;
}
</style>
<div class="salesss">
<center>銷售最高<p>

<%
	try
	{
		sql="SELECT * FROM good ORDER BY g_sales DESC LIMIT 3";
		ResultSet rs=con.createStatement().executeQuery(sql);
		while(rs.next())
		{
			out.println("<img src='good/"+rs.getString("g_id")+".png'>");
			%>
			<a href='product.jsp?gid=<%=rs.getString("g_id")%>'><%=rs.getString("g_type")%></a>
			<%
		}
	}
	catch (SQLException sExec)
	{
        out.println("SQL錯誤"+sExec.toString());
    }
%>
<div>
</body>
</html>
