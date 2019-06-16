<%@ page import = "java.sql.*, java.util.*" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@include file="getgougou.jsp" %>
<%
try{
	String get_code = request.getParameter("code");
	sql = "select m_stnumb from member where  m_stnumb ='"+get_code+"'";
	ResultSet tmp = con.createStatement().executeQuery(sql);
	String message = "";
	if(tmp.next()){
		sql = "select m_st from member where m_stnumb='"+get_code+"'";
		ResultSet rs2 = con.createStatement().executeQuery(sql);
		rs2.next();
		int now_state =   Integer.parseInt(rs2.getString("m_st"));
		if(now_state == 0){
		sql = "update member set m_st = 1 where m_stnumb ='"+get_code+"'";
		Statement stmt = con.createStatement();
		stmt.executeUpdate(sql);
		message = "驗證成功，歡迎馬上到MushroomHunter逛逛!";
	out.println("<SCRIPT LANGUAGE='JavaScript'>");
	out.println("<!--");
	out.println("alert('"+message+"')");
	out.println("//-->");
	out.println("</SCRIPT>");
	out.println("<SCRIPT LANGUAGE='JavaScript'>");
	out.println("function toindex()");
out.println("{");
 out.println("window.location.replace"+"("+"\"index.jsp\""+")");
out.println("}");
out.println( "setTimeout('toindex()',1000);");
out.println("</SCRIPT>");
		}
		else{
			message = "已經驗證過了 無須再驗證!";
	out.println("<SCRIPT LANGUAGE='JavaScript'>");
	out.println("<!--");
	out.println("alert('"+message+"')");
	out.println("//-->");
	out.println("</SCRIPT>");
	out.println("<SCRIPT LANGUAGE='JavaScript'>");
	out.println("function toindex()");
out.println("{");
 out.println("window.location.replace"+"("+"\"index.jsp\""+")");
out.println("}");
out.println( "setTimeout('toindex()',1000);");
out.println("</SCRIPT>");
		}
		
	}
	else{
		message = "無效的驗證碼";
	out.println("<SCRIPT LANGUAGE='JavaScript'>");
	out.println("<!--");
	out.println("alert('"+message+"')");
	out.println("//-->");
	out.println("</SCRIPT>");
	out.println("<SCRIPT LANGUAGE='JavaScript'>");
	out.println("function toindex()");
out.println("{");
 out.println("window.location.replace"+"("+"\"index.jsp\""+")");
out.println("}");
out.println( "setTimeout('toindex()',1000);");
out.println("</SCRIPT>");

	}
}
catch(SQLException sExec)
		{
			out.println("SQL錯誤"+sExec.toString());
		}	
%>