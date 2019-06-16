<%@ page import = "java.sql.*, java.util.*" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>菇菇收藏館</title>
	<link rel="stylesheet" href="css/nav_css.css">
	<link rel="stylesheet" href="css/search.css">
	 <link rel="stylesheet" href="css/bootstrap.min.css">
	 
</head>
<style> 

.rating.rating-1:after { width: 44%; }
</style>
<body >

<div class="img_bg" >
<div class = "second_back">
<div class="container" style="padding: 3%;">
<div style="text-align: center;margin-bottom: 2%; font-size: 28px;">菇菇收藏館</div>
<div class="row">
<%
	sql="select * from love,good where love.m_ac='"+acc+"' and love.g_id=good.g_id;";//找love和goods的使用者，以相同欄位g_id做連結
	ResultSet tmp = con.createStatement().executeQuery(sql);
	while(tmp.next())
	{
%>
<div class="col-sm-3"> 
<figure class="snip1392">
  <div class="image">
  <%
      out.println("<img src='"+tmp.getString("g_photo")+"'"+" alt='sample95' />");
  %>
  </div>
  <figcaption>
    <h5>價格:<%=tmp.getString("g_price")%></h5>
        <% out.println("<a href='delete_love.jsp?g_id="+tmp.getString("g_id")+"'><i class='fas fa-trash-alt'></i></a>");
            out.println("<a href='add_shopping.jsp?g_id="+tmp.getString("g_id")+"&act=shopping&amount=1'><i class='fas fa-cart-plus'></i></a>");
       %> 
  </figcaption>
</figure>
<br>
<div class="name"><a href="#"><%=tmp.getString("g_type")%></a></div>
    </div>
<%
    }
%>

</div>
</div>





</div>
</div>



</body>
</html>