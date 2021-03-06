<%@page pageEncoding="utf-8"%>
<%@ page import = "java.sql.*, java.util.*" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>商品頁面</title>
    <link rel="stylesheet" href="css/nav_css.css">
	 <link rel="stylesheet" href="css/bootstrap.min.css">
	 <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">
</head>

<style>
html,body{
	font-family: Microsoft JhengHei;
}
   
</style>

<body>
    <div class="page-main" role="main">
        <aside>
            <div class="bar_title">
                <img class="mark_nv" src="img/mushrooms.png">
                <a href="index.jsp">Mushroom Hunter</a>
            </div>
            <ul>
               <%
                         String acc=null;
                         String pas=null;
                        
                        try{
                                Cookie getC[]=request.getCookies();
                                for(int i=0;i<getC.length;i++)
                                {
                                    if(getC[i].getName().equals("getin"))
                                    {
                                        String[] sp=getC[i].getValue().split("-");
                                        acc=sp[0];
                                        pas=sp[1];
                                    }
                                }

                            }
                        catch(Exception e)
                        {

                        }
                          try{    
                                if(acc==null||acc.equals("")||pas==null||pas.equals(""))
                                {        
                                        
                                        	out.println("<li>");
											out.println("<div class='person'>");
											out.println("<i class='fas fa-3x fa-user'></i>");
											out.println(" <span class='member_name'>"+"請先登入或註冊!"+"</span>");
											out.println("<br>");
											out.println("<span class='m_control'>");
											out.println("<span class='member logout'>"+"<a href='#' class='open_log'>"+"會員中心"+"</a>"+"</span>");
											out.println("<span class='logout'>"+"<a href='#' class='open_log'>"+"登入/註冊"+"</a>"+"</span>");
											out.println("</span>");
											out.println("</div>");
											out.println("</li>");
	
                                }
						else
							{	    
							session.setAttribute("in",acc);//the memory of the logged in account
							sql="SELECT * FROM member WHERE m_ac='"+acc+"' and m_pw='"+pas+"'";
							ResultSet tmp=con.createStatement().executeQuery(sql);
							tmp.next();
							if(tmp.getString("m_level").equals("1"))
						   
									{      
													out.println("<li>");
													out.println("<div class='person'>");
													out.println("<i class='fas fa-3x fa-user'></i>");
													out.println(" <span class='member_name'>"+"歡迎管理員，"+tmp.getString("m_name")+"</span>");
													out.println("<br>");
													out.println("<span class='m_control'>");
													out.println("<span class='member'>"+"<a href='b_product.jsp'>"+"管理中心"+"</a>"+"</span>"); /*接後端介面*/
													out.println("<span class='logout'>"+"<a href='logout.jsp'>"+"登出"+"</a>"+"</span>");
													out.println("</span>");
													out.println("</div>");
													out.println("</li>");         
							} 	
							else 
							{
								out.println("<li>");
								out.println("<div class='person'>");
								out.println("<img src='"+tmp.getString("m_photo")+"'>");
								out.println(" <span class='member_name'>"+"歡迎，"+tmp.getString("m_name")+"</span>");
								out.println("<br>");
								out.println("<span class='m_control'>");
								out.println("<span class='member'>"+"<a href='member_center.jsp'>"+"會員中心"+"</a>"+"</span>");
								out.println("<span class='logout'>"+"<a href='logout.jsp'>"+"登出"+"</a>"+"</span>");
								out.println("</span>");
								out.println("</div>");
								out.println("</li>");
							}	
					} 
    %>
           
                         
   
						
     
		 <li>
                    <div class="search_area">
                        <form class="search" action="search.jsp?target=" method="get">
                            <input class="search_bar" name="target" type="search" id="target"  placeholder="Search">
                            <button class="search_sendout" placeholder="搜尋" type="submit"><img src="img/search.png" width="100%"></button>
                        </form>
                        
                    </div>
                </li>
                <li>
                   <form action="search.jsp" method="get">
                    <button type="submit" name="target" value="魔力" class="btn_b btn-default_b">魔力</button>

                    <!-- Provides extra visual weight and identifies the primary action in a set of buttons -->

                    <!-- Indicates a successful or positive action -->
                    <button type="submit" name="target" value="養生" class="btn_b btn-success_b">養生</button>

                    <!-- Contextual button for informational alert messages -->
                    <button type="submit" name="target" value="務實" class="btn_b btn-info_b">務實</button>

                    <!-- Indicates caution should be taken with this action -->
                    <button type="submit" name="target" value="超能力" class="btn_b btn-warning_b">超能力</button>

                    <!-- Indicates a dangerous or potentially negative action -->
                    <button type="submit" name="target" value="邪惡" class="btn_b btn-danger_b">邪惡</button></form>
					
                <li>
                    <div class="menu_content">
                        <div class="icon_space">
                            <img class="icon" src="img/mushrooms.png"><a href="shopcart.jsp">購物車</a>
                        </div>
                        <div class="icon_space">
                            <img class="icon" src="img/mushrooms.png"><a href="love.jsp">我的最愛</a>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="menu_content">
                        <div class="icon_space">
                            <img class="icon" src="img/mushrooms.png"><a href="a_product.jsp">商品總覽</a>
                        </div>
                        <div class="icon_space">
                            <img class="icon" src="img/mushrooms.png"><a href="#">推薦菜譜</a>
                        </div>
                    </div>
                </li>


                <li style="margin-top:40% !important;" class="about_us">about us</li>
                <li>
                    <div class="row">
                        <div class="col-sm-4 change_co">
                            <a href="process.jsp">
                                <img class="about_p" width="100%" src="img/file.png">
                                <br>
                                <span class="about_us">
                                    購物流程</span></a>
                        </div>
                        <div class="col-sm-4 change_co">
                            <a href="index2.jsp">
                                <img class="about_p" width="100%" src="img/speech-bubble.png">
                                <br>
                                <span class="about_us">
                                    聯絡我們</span></a>
                        </div>
                        <div class="col-sm-4 change_co">
                            <a href="#">
                                <img class="about_p" width="100%" src="img/file.png">
                                <br>
                                <span class="about_us">最新消息</span></a>
                        </div>
                    </div>
                </li>
                <li class="about_us">2019 Mushroom Hunter<br>Allright Reserved</li>
                
            
            </ul>
            <button class="qq"><img class="close_img" src="img/menu.png"></button>
        </aside>
    </div>
	<%
    }
	
    catch(Exception e)
    {
        
        //銷毁session：
     
        //清除cookie：
        try{
                Cookie getC[]=request.getCookies();
                for(int i=0;i<getC.length;i++)
                {
                    if(getC[i].getName().equals("getin"))
                    {
                        getC[i].setMaxAge(0);
                        response.addCookie(getC[i]);
                        response.sendRedirect("index.jsp");
                    }
                }
            }
        catch(Exception err)
        {
						response.sendRedirect("index.jsp");
        }
    }
    %>

    <script src="js/jquery-3.2.1.min.js"></script>
    <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.0/jquery.min.js'></script>

    <div class="img_bg">
        <div class="second_back">

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
                <form method="post" action="register.jsp">
                    <fieldset>
                        <legend class="title">註冊</legend>
                        <div class="input_block">
                            <div class="input_wrap">
                                <input name="acc" type="text" id="sing_account" class="input" placeholder="帳號">
                                <label for="sing_account" class="label_name fa fa-user"></label>
                            </div>
							<div class="input_wrap">
                                <input name="name" type="text" id="sing_account" class="input" placeholder="暱稱">
                                <label for="sing_account" class="label_name fa fa-user"></label>
                            </div>
                            <div class="input_wrap">
                                <input name="password" type="password" class="input sing_pass" placeholder="密碼">
                                <label for="sing_pass" class="label_pass far fa-eye-slash"></label>
                            </div>
                            <div class="input_wrap">
                                <input name="email" type="text" id="sing_email" class="input" placeholder="信箱">
                                <label for="sing_email" class="label_mail fas fa-envelope"></label>
                            </div>
                        </div>
                        <input type="submit" value="註冊" class="btn_l btn_red">
                    </fieldset>
                </form>
            </div>
            <div class="action_login">
               <form action="login.jsp" method="post">
                    <fieldset>
                        <legend class="title">登入</legend>
                        <div class="input_block">
                            <div class="input_wrap">
                                <input type="text" id="sing_account" class="input" placeholder="帳號" name="acc">
                                <label for="sing_pass" class="label_mail fa fa-user"></label>
                            </div>
                            <div class="input_wrap">
                                <input type="password" class="input sing_pass" placeholder="密碼" name="psd">
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
<script src="js/nav_script.js"></script>
<script src="js/index.js"></script>
<script src="js/jquery-ui.min.js"></script>


</body>

</html>
