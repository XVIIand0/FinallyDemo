<%@ page import = "java.sql.*, java.util.*" %>
<%@include file="getgougou.jsp"%>
<%	
	try{
	String text = request.getParameter("text");
	String s_star = request.getParameter("star");
	String o_id = request.getParameter("o_id");
	int star = Integer.valueOf(s_star).intValue();
	sql = "update `order` set m_g_content ='"+text+"', m_g_star='"+star+"' where o_id='"+o_id+"';";
	con.createStatement().executeUpdate(sql);
}
catch (Exception e){ 
out.print(e.toString()); 
}
%>