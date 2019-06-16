<%@ page import = "java.sql.*"%>
<%
	Class.forName("com.mysql.jdbc.Driver");
    String url="jdbc:mysql://localhost/?serverTimezone=UTC";
    String sql="use gougou;";
    Connection con=DriverManager.getConnection(url,"root","1234"); 
    con.createStatement().execute(sql);
%>