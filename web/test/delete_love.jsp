<%@ page import = "java.sql.*, java.util.*" %>
<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@include file="getgougou.jsp"%>
<%	
	String gd=request.getParameter("g_id");
	sql="delete from gougou.love where g_id='"+gd+"';";
	con.createStatement().executeUpdate(sql);
	out.write("<script>alert('已從菇菇收藏館移出');</script>");
    response.setHeader("refresh","0;URL=love.jsp");
%> 