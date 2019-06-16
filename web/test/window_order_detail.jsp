<%@ page import = "java.sql.*, java.util.*" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@include file="getgougou.jsp"%>

<!DOCTYPE html>
<html>

<head>
    <title>訂單明細</title>
    <meta charset="utf-8">
    <link rel="stylesheet" type="text/css" href="css/window.css">
    
</head>

<body>
    <div class="window_back">

        <p><b>
                <center>訂單明細</center>
            </b></p>

        <table>
            <thead>
                <tr>
                    <td>商品編號</td>
                    <td>商品圖片</td>
                    <td>商品名稱</td>
                    <td>商品數量</td>
                    <td>小計</td>
                </tr>
            </thead>
            <tbody>
			 <%
			 try{
					String o_id = request.getParameter("each_o_id");
                  String a=null;
				  String sql2 ;
				  String src;
				  Integer p_total;
				  Integer a_total=0;
                            
                                       
                                        sql="SELECT * FROM gougou.order WHERE each_o_id like '%"+o_id+"%'";                                                                
                            ResultSet tmp=con.createStatement().executeQuery(sql);

                             int count=0;
                            while(tmp.next())
                            {
                               sql2="select g_photo,g_price , g_type from gougou.good where g_id ="+tmp.getString("product")+";";
                               ResultSet rs2 = con.createStatement().executeQuery(sql2);						   
							   rs2.next();						  
							    src= rs2.getString("g_photo");
								p_total = Integer.valueOf(tmp.getString("quantity")).intValue()*Integer.valueOf(rs2.getString("g_price")).intValue();
                                out.println("<tr>");
                                out.println("<td>"+tmp.getString("product")+"</td>");
                                out.println("<td><img src="+src+"></td>");
								out.println("<td>"+rs2.getString("g_type")+"</td>");
                                out.println("<td>"+tmp.getString("quantity")+"</td>");
								 out.println("<td>"+p_total+"</td>");
                                    out.println("</tr>");
                                   count++;
								   a_total+=p_total;
                                    }
                        con.close();
			
                    %>
                
                
                
            </tbody>

        </table>
        <div class="win_total">
        <div>總金額: &emsp;<%out.println("NT."+a_total);%></div>
        <div>運費: &emsp;NT.60</div><!--不用更改運費為60元-->
        <hr>
        <div>應付金額: &emsp;<%out.println("NT."+(a_total+60));%></div></div>
    </div>
</body>
<%
 }
			 catch(SQLException sExec)
		{
			
		}	
%>
</html>
