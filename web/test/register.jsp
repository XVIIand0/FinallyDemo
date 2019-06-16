<%@ page import = "java.sql.*, java.util.* ,com.sun.mail.util.MailSSLSocketFactory"%>
<%@ page import="javax.mail.*" %>
<%@ page import="javax.mail.internet.*" %>
<%@ page import="javax.activation.*" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@include file="getgougou.jsp" %>

<%		
	
	
		String code = UUID.randomUUID().toString().replaceAll("-", "");
	
		String email = new String(request.getParameter("email"));
	String acc = new String(request.getParameter("acc").getBytes("ISO-8859-1"),"UTF-8");
	String userName = new String(request.getParameter("name").getBytes("ISO-8859-1"),"UTF-8");
	String password = new String(request.getParameter("password"));
	String message = "";
	if(!email.matches("^\\w+@(\\w+\\.)+\\w+$")){
	message = "email格式有誤";
	out.println("<SCRIPT LANGUAGE='JavaScript'>");
	out.println("<!--");
	out.println("alert('"+message+"')");
	out.println("//-->");
	out.println("</SCRIPT>");
			;
		}
		else{
		try{
	sql = "SELECT * FROM member WHERE m_mail='"+email + "' "  ; 
	ResultSet rs = con.createStatement().executeQuery(sql);
	if(rs.next()){	
	message = "此email已有人使用過";
	out.println("<SCRIPT LANGUAGE='JavaScript'>");
	out.println("<!--");
	out.println("alert('"+message+"')");
	out.println("//-->");
	out.println("</SCRIPT>");
	out.println("<SCRIPT LANGUAGE='JavaScript'>");
	out.println("function go()");
out.println("{");
 out.println("window.history.go(-1);");
out.println("}");
out.println( "setTimeout('go()',1000);");
out.println("</SCRIPT>");
	
	}
	else{	
	sql = "SELECT * FROM member WHERE m_mail = ?" ;					
	sql = "INSERT into member(m_ac,m_pw,m_name,m_mail,m_level,m_st,m_stnumb) ";
	sql+="VALUE(?,?,?,?,?,?,?)";
	
	PreparedStatement pstmt = null;
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1,acc);
		pstmt.setString(2,password);
		pstmt.setString(3,userName);
		pstmt.setString(4,email);		
		pstmt.setInt(5,0);
		pstmt.setInt(6,0);
		pstmt.setString(7,code);
		pstmt.execute();
	
	con.close();

	String from = "w870209w@gmail.com";// 发件人电子邮箱
		String host = "smtp.gmail.com"; 
		boolean sessionDebug = true;
		Properties properties = System.getProperties();// 获取系统属性

		properties.setProperty("mail.smtp.host", host);// 设置邮件服务器
		properties.setProperty("mail.smtp.auth", "true");// 打开认证
		try {
			//QQ邮箱需要下面这段代码，163邮箱不需要
			MailSSLSocketFactory sf = new MailSSLSocketFactory();
			sf.setTrustAllHosts(true);
			properties.put("mail.smtp.ssl.enable", "true");
			properties.put("mail.smtp.ssl.socketFactory", sf);
			
			
			// 1.获取默认session对象
		Authenticator auth = new javax.mail.Authenticator() {
      String sender = "w870209w@gmail.com";         //輸入帳號
      String pd = "fliwrlklrltfnnfq";         //輸入密碼
      protected PasswordAuthentication getPasswordAuthentication(){
        return new PasswordAuthentication(sender, pd);
      }
    };
    javax.mail.Session mailSession = javax.mail.Session.getDefaultInstance(properties,auth);
    mailSession.setDebug(sessionDebug);
    Message msg = new MimeMessage(mailSession);
			// 2.1设置发件人
			msg.setFrom(new InternetAddress(from));
			// 2.2设置接收人
			msg.addRecipient(Message.RecipientType.TO, new InternetAddress(email));
			// 2.3设置邮件主题
			msg.setSubject("Mushroom Hunter 歡迎你註冊");
			// 2.4设置邮件内容
			String content = "<html><head></head><body><h1>點擊此連線啟動帳號</h1><h3><a href='http://140.135.113.168:8000/test/Active.jsp?code="
					+ code + "'>http://140.135.113.168:8000/test/Active.jsp?code=" + code
					+ "</href></h3></body></html>";
			msg.setContent(content, "text/html;charset=UTF-8");
			// 3.发送邮件
			Transport.send(msg);
			System.out.println("發送成功!");
		} catch (Exception e) {
			e.printStackTrace();
		}


	message = "註冊成功，請至信箱驗證!";
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
	catch (SQLException sExec) {
           out.println("SQL錯誤"+sExec.toString());
    }
		
	}
	
	

%>