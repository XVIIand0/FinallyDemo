<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<%@include file="getgougou.jsp" %>
<body>
 <%
  String acc="";
     String pas="";
 acc=request.getParameter("acc");
 pas=request.getParameter("psd");

 try
 {
  if(acc==null||acc.equals("")||pas==null||pas.equals(""))
  {
   out.write("<script language=javascript>alert('帳號或密碼請勿空值');</script>");
   response.setHeader("refresh","0;URL=index.jsp");
  } 
  else 
  {
   sql="select * from member where m_ac=? and m_pw=?";
   PreparedStatement midas=null;
   midas=con.prepareStatement(sql);
   midas.setString(1,request.getParameter("acc"));
   midas.setString(2,request.getParameter("psd"));

   ResultSet paperrs=midas.executeQuery();

   if(paperrs.next())
   {
    session.setAttribute("acc",request.getParameter("acc"));
    sql="SELECT * FROM member WHERE m_ac='"+acc+"' and m_pw='"+pas+"'";
   ResultSet tmp=con.createStatement().executeQuery(sql);
   tmp.next();
   if(tmp.getString("m_level").equals("0"))
   {
    Cookie ck=new Cookie("getin",tmp.getString("m_ac")+"-"+tmp.getString("m_pw"));
    ck.setMaxAge(60*60*24*7);
    response.addCookie(ck);
    session.setAttribute("in",acc);
    out.write("<script language=javascript>alert('登入成功');</script>");
    response.setHeader("refresh","0;URL=index.jsp");
    
   }
   else if(tmp.getString("m_level").equals("1"))
   {
    Cookie ck=new Cookie("getin",tmp.getString("m_ac")+"-"+tmp.getString("m_pw"));
    ck.setMaxAge(60*60*24*7);
    response.addCookie(ck);
    session.setAttribute("in",acc);
    out.write("<script language=javascript>alert('進入管理員介面');</script>");
    response.setHeader("refresh","0;URL=index.jsp");
   }
      else
   {
    out.write("<script language=javascript>alert('帳號或密碼輸入錯誤');</script>");
    response.setHeader("refresh","0;URL=index.jsp");
      }
   }
   else
   {
    out.write("<script language=javascript>alert('帳號或密碼輸入錯誤');</script>");
    response.setHeader("refresh","0;URL=index.jsp");
   }
  
  }
 }
 catch(Exception e)
 {
   out.write("<script language=javascript>alert('帳號或密碼輸入錯誤');</script>");
   response.setHeader("refresh","0;URL=index.jsp");
 }
con.close();
%>


</body>