<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<%@ page import="java.sql.*"%>
<% 
       
        
		
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		try
		{
			String url="jdbc:mysql://localhost:3306/";
			String sql="use gougou;";
			Connection con=DriverManager.getConnection(url,"root","0000"); 
			if(con.isClosed())
				out.println("連線建立失敗");
			else
				con.createStatement().executeQuery(sql);
				String acc=request.getParameter("acc");
				String pw=request.getParameter("pw");
				
				if(acc==null||acc.equals("")||pw==null||pw.equals(""))
				{
						out.write("<script language=javascript>alert('帳號密碼輸入錯誤');</script>");
				}
				else
				{
						sql="select m_ac,m_pw from member where m_ac='"+request.getParameter("acc")+"'and m_pw='"+request.getParameter("pw")+"'";
						ResultSet tmp=con.createStatement().executeQuery(sql);
						if(tmp.next())
						{
							Cookie ck=new Cookie("getin",tmp.getString("m_ac")+"-"+tmp.getString("m_pw"));
							ck.setMaxAge(60*60*24*7);
							response.addCookie(ck);
							out.write("<script language=javascript>alert('成功');</script>");
							response.setHeader("refresh","0;URL=index.jsp") ;
						}
						else
						{
							out.write("<script language=javascript>alert('帳號密碼輸入錯誤');</script>");
							response.setHeader("refresh","0;URL=index.jsp") ;
						}
							out.println("sucess");
				}
				con.close();
		}
		catch(SQLException sExec)
		{
			out.println("SQL錯誤"+sExec.toString());
		}	
	}
	catch(Exception e){}
	
%>