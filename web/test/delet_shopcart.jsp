<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@page contentType="text/html;charset=utf-8" language="java"%>
<%@page import="java.util.*,java.io.*"%>
<%@include file="getgougou.jsp"%>
<%
ResultSet man=null;
String sql2;
String acc=null;
String pas=null;
String de_all = request.getParameter("de_all");
String sid = request.getParameter("sid");

	try{
		if(de_all!= null){			
			String[] split_it = de_all.split(","); 
			
			for(int i = 1; i<=split_it.length ; i++){
			sql = "DELETE FROM shopping WHERE s_id = "+split_it[i]+" ;";
			con.createStatement().executeUpdate(sql);
			out.print(split_it[i]);
			}
			}
			
		else if(sid!=null){
			sql = "DELETE FROM shopping WHERE s_id = "+sid+" ;";
			con.createStatement().executeUpdate(sql);
	}
	}
catch (Exception e){ 
out.print(e.toString()); 
}
%>