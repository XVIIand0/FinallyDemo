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
<div class = "second_back">
<div class="row">
<div class="col-sm-12">
	<form action="search.jsp" class="search_p" method="get">
                    <input class="search_bar" type="search" id="target" name="target" placeholder="Search">
                    <button class="search_sendout" placeholder="搜尋" type="submit"><img src="img/search.png"></button>
    </form> 
    </div> 
    </div>
<div class="container">
<div class="row">
<%
    String tar=request.getParameter("target");
    if(tar==null)
    {
        sql="SELECT * FROM good;";
        ResultSet tmp = con.createStatement().executeQuery(sql);
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
    con.close();
    }
    else
    {
        tar=request.getParameter("target");
        sql="SELECT * FROM good WHERE (g_type like '%"+tar+"%') OR (g_tag like '%"+tar+"%');";
        ResultSet tmp = con.createStatement().executeQuery(sql);
        if(tmp.next())
        {   
            tmp = con.createStatement().executeQuery(sql);
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
        con.close();
        }
        else if(!tmp.next())
        {
            out.write("<script>alert('查無此商品');</script>");
            response.setHeader("refresh","0;URL=search.jsp?target=");
        }
    }
%>
        </div>
        </div>
        </div>
        </div>

    <div id="main" class="login_wrap singUpActive">
        <div class="login_question_wrap">
            <div class="question_singUp ">
                <h2 class="title">沒有帳號嗎?</h2>
                <p>立即加入我們以享受最高級的折扣以及網站設計的簽名一份
                </p>
                <a href="javascript:void(0)" id="signUpBtn" class="btn_l btn_rounded">註冊</a>
            </div>
            <div class="question_login ">
                <h2 class="title">已經擁有帳號了?</h2>
                <p>
                趕快登入進來看看我們有那些最新最炫的菇菇吧!!!
                </p>
                <a href="javascript:void(0)" id="loginBtn" class="btn_l btn_rounded">登入</a>
            </div>
            <div class="action_singUp">
                <form action="#">
                    <fieldset>
                        <legend class="title">註冊</legend>
                        <div class="input_block">
                            <div class="input_wrap">
                                <input type="text" id="sing_account" class="input" placeholder="帳號">
                                <label for="sing_account" class="label_name fa fa-user"></label>
                            </div>                            
                            <div class="input_wrap">
                                <input type="password" class="input sing_pass" placeholder="密碼">
                                <label for="sing_pass" class="label_pass far fa-eye-slash"></label>
                            </div>
                            <div class="input_wrap">
                                <input type="text" id="sing_email" class="input" placeholder="信箱">
                                <label for="sing_email" class="label_mail fas fa-envelope"></label>
                            </div>
                        </div>
                        <input type="submit" value="註冊" class="btn_l btn_red">
                    </fieldset>
                </form>
            </div>
            <div class="action_login">
                <form action="#">
                    <fieldset>
                        <legend class="title">登入</legend>
                        <div class="input_block">
                            <div class="input_wrap">
                                <input type="text" id="sing_account" class="input" placeholder="帳號">
                                <label for="sing_pass" class="label_mail fa fa-user"></label>
                            </div>
                            <div class="input_wrap">
                                <input type="password"  class="input sing_pass" placeholder="密碼">
                                <label for="sing_pass" class="label_pass far fa-eye-slash"></label>
                            </div>
                        </div>
                        <a href="#" class="forgotPass">忘記密碼了嗎??</a>
                        <input type="submit" value="登入" class="btn_l btn_red">
                    </fieldset>
                </form>
            </div>
        </div>
        <div class="login_action_wrap ">
        </div>
    </div>

<script src="js/index.js"></script>
<script  src="js/search.js"></script>
<script src="js/jquery-ui.min.js"></script>

</body>
</html>