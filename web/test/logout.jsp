<%@ page import = "java.sql.*, java.util.*" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@include file="getgougou.jsp" %>
<body>	
	<%
		
	 	//銷毁session：
		 session.invalidate();
	    //清除cookie：
	try{
	Cookie getC[]=request.getCookies();
	for(int i=0;i<getC.length;i++)
	{
		if(getC[i].getName().equals("getin"))
		{
			getC[i].setMaxAge(0);
			response.addCookie(getC[i]);
						out.println("<script>");
        out.println("window.location.replace"+"("+"\"index.jsp\""+")");
		out.println("</script>");
		out.println("window.history.forward(1)");
		}
	}
}catch(Exception e)
{

}

	
	   
	%>

</body>
</html>