<%@ page import = "java.sql.*, java.util.*" %>
<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@include file="getgougou.jsp"%>
<%	
	String gd=request.getParameter("m_id");
	sql="delete from gougou.member where m_id='"+gd+"';";
	con.createStatement().executeUpdate(sql);
	out.write("<script>alert('刪除會員成功');</script>");
    response.setHeader("refresh","0;URL=b_member.jsp");
%> 