<%@ page import = "java.sql.*, java.util.*" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>搜尋結果</title>
	<link rel="stylesheet" href="css/nav_css.css">
	<link rel="stylesheet" href="css/search.css">
	 <link rel="stylesheet" href="css/bootstrap.min.css">
	    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">
</head>
<style> 

.rating.rating-1:after { width: 44%; }
</style>
<body >

<div class="img_bg" >
<div class="second_back">
<div class="container">
<div class="row">
<%
    sql="select * from good;";
    ResultSet tmp = con.createStatement().executeQuery(sql);

    tmp.last();
    int total_content=tmp.getRow();
    int page_num=(int)Math.ceil((double)total_content/12.0);
    if (page_num==0)
        page_num=1;
    for(int i=1;i<=page_num;i++)
    {
      out.print("<a href='a_product.jsp?page="+i+"'></a>");
    }
    String page_string = request.getParameter("page");
    if (page_string == null) 
        page_string = "1";
    Integer current_page=Integer.valueOf(page_string);
    int start_record=(current_page-1)*12;
    sql="SELECT * FROM good LIMIT ";
    sql+=start_record+",12";
    tmp=con.createStatement().executeQuery(sql);
    int l=current_page;
    int r=current_page;

    while(tmp.next())
    {
      Integer i=Integer.valueOf(tmp.getString("g_id"));
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
<% 
      out.println("<a href='add_shopping.jsp?g_id="+tmp.getString("g_id")+"&act=love&amount=1'><i class='fas fa-heart'></i></a>");
      out.println("<a href='add_shopping.jsp?g_id="+tmp.getString("g_id")+"&act=shopping&amount=1'><i class='fas fa-cart-plus'></i></a>");
%> 
          </figcaption>
        </figure>
        <br>
        <div class="name"><a href='product.jsp?gid=<%=tmp.getString("g_id")%>'><%=tmp.getString("g_type")%></a></div>
            </div>
<%
      if(i%4==0)
      {
%>
        </div>
        </div>
        <div class="container">
        <div class="row">
<%
      }
    }
%>
<div class="col-sm-12 page"> 
<div class="col-sm-1 page left_S_arrow">
<%
  if(l<2)
  {
    l=(page_num+1);
    out.println("<a href='a_product.jsp?="+(l-1)+"'>");
  }
  if(l>=2)
    out.println("<a href='a_product.jsp?page="+(l-1)+"'>");
%>
  <img class="" width="60%" src="img/right_arrow.png"></a></div>
<%
  for(int i=1; i<=page_num; i++)
  {
    out.print("<div class='page page_number");
    if(i==current_page)
      out.print(" active");
    out.print("'>");
    out.println("<a href='a_product.jsp?page="+i+"'>"+i+"</a></div>"); 
  }
%>
  <div class="col-sm-1 page">
<%
  if(r > (page_num-1) )
  {
    r=0;
    out.println("<a href='a_product.jsp?page="+(r+1)+"'>");
  }
  if(r <= (page_num-1))
    out.println("<a href='a_product.jsp?page="+(r+1)+"'>");
%>
<img class="" width="60%" src="img/right_arrow.png"></a></div>
</div>
</div>
</div>
</div>
</div>
</body>
</html>