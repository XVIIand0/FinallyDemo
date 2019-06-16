<%@page contentType="text/html"%>
<%@page pageEncoding="utf-8"%>
<%@ page import = "java.sql.*" %> 
<%@include file="getgougou.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<html>
<head>
  <title></title>
</head>
<body>

<%
  
  request.setCharacterEncoding("utf-8");
  String email=request.getParameter("email"); 
  String phone=request.getParameter("phone");  
  String resp=request.getParameter("response");
  String type=request.getParameter("type");


 
if(email==null||email.equals("")||phone==null||phone.equals("")||resp==null||resp.equals("")||type==null||type.equals(""))
{
        
        out.println("<script language=javascript>alert('請填寫完整呦~');</script>");
        response.setHeader("refresh","0;URL=index2.jsp");
    }
    else{
         sql="INSERT INTO  guest (guest_mail,guest_tel,guest_content,suggest_type)  VALUES ('"+email+"','"+phone+"','"+resp+"','"+type+"');";
         con.createStatement().executeUpdate(sql);
         out.write("<script language=javascript>alert('感謝您的回饋~');</script>");
        response.setHeader("refresh","0;URL=index2.jsp");
    }
    
            
  %>



</body>
</html>