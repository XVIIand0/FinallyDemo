<%@ page import = "java.sql.*, java.util.*" %>
<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@include file="getgougou.jsp"%>
<%	
	String gd=request.getParameter("g_id");
	sql="delete from gougou.good where g_id='"+gd+"';";
	con.createStatement().executeUpdate(sql);
	out.write("<script>alert('刪除商品成功');</script>");
    response.setHeader("refresh","0;URL=b_product.jsp");
%> 