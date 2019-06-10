<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<%@include file="getgougou.jsp"%>
<html>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		String [] gid=null;
		String [] gtype=null;
		String [] gprice=null;
		String [] gstorage=null;
		String [] gplace=null;
		String [] gfarm=null;
		String [] glike=null;
		String [] geff=null;

		try
		{                                                          
			gid=request.getParameterValues("g_id");
			gtype=request.getParameterValues("g_type");
			gprice=request.getParameterValues("g_price");
			gstorage=request.getParameterValues("g_storage");
			gplace=request.getParameterValues("g_place");
			gfarm=request.getParameterValues("g_farm");
			glike=request.getParameterValues("g_like");
			geff=request.getParameterValues("g_eff");
			
			for(int i=0;i<gid.length;i++)
			{	
			
			sql="UPDATE goods SET g_type='"+gtype[i]+"',g_price='"+gprice[i]+"',g_storage='"+gstorage[i]+"',g_place='"+gplace[i]+"',g_farm='"+gfarm[i]+"',g_like='"+glike[i]+"',g_eff='"+geff[i]+"' WHERE g_id='"+gid[i]+"'";
			con.createStatement().executeUpdate(sql); 
			}
			out.write("<script language=javascript>alert('修改完成');</script>");
			response.setHeader("refresh","0;URL=b_product.jsp");
		
		}
		catch(Exception e)
		{
			out.write("<script language=javascript>alert('修改錯誤');</script>");
			response.setHeader("refresh","0;URL=b_product.jsp");
		}		
	

	con.close();
	%>
</body>
</html>
