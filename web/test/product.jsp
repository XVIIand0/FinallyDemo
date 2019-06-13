<%@ page import = "java.sql.*, java.util.*" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@page import="java.util.*,java.io.*"%>
<%@include file="getgougou.jsp"%>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>商品頁面</title>
	<link rel="stylesheet" href="css/nav_css.css">
	<link rel="stylesheet" href="css/product.css">
	 <link rel="stylesheet" href="css/bootstrap.min.css">
	 <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">
</head>
<style> 

.rating.rating-1:after { width: 44%; }
</style>
<body >


                <%
                    try{
                            sql="SELECT * FROM good;";
                            ResultSet rs=con.createStatement().executeQuery(sql);
                            rs.last();
                            int gid_num=rs.getRow();
                            if (gid_num==0)
                                gid_num=1;
                                for(int i=1;i<=gid_num;i++)
                                {
                                    out.print("<a href='product.jsp?gid="+i+"'></a>&nbsp;"); 
                                }
                            String gid_string = request.getParameter("gid");
                            if (gid_string == null)
                                gid_string = "1";   
                            Integer current_gid=Integer.valueOf(gid_string);
                            if(current_gid<1 || current_gid>gid_num)
                                current_gid=1;                    
                            int start_record=(current_gid-1);
                            
                            sql="SELECT * FROM good LIMIT ";
                            sql+=start_record+",1";
                            rs=con.createStatement().executeQuery(sql);
                            int l=current_gid;
                            int r=current_gid;
                                
                            while(rs.next())
                            {
%>
                        <div class="img_bg" >
                        <div class = "second_back">
                        <div class="tab-container">
                                <div class="row">
                                <div class="col-sm-2">
                                <a href="#">
<%
                                if(l>=2)
                                    out.println("<a href='product.jsp?gid="+(l-1)+"'><img class='arrow_B left_B_arrow' width='60%'' src='img/right_arrow.png'></a>");
                                if(l<2)
                                {
                                    l=(gid_num+1);
                                    out.println("<a href='product.jsp?gid="+(l-1)+"'><img class='arrow_B left_B_arrow' width='60%'' src='img/right_arrow.png'></a>");
                                }

%>
                                </a>
                                </div>
                                    <div class="col-sm-8">
                                        <div class="tab-menu">
                                            <ul>
                                                <li><a href="#" class="tab-a active-a" data-id="tab1">商品資訊</a></li>
                                                <li><a href="#" class="tab-a" data-id="tab2">推薦食譜</a></li>
                                                <li><a href="#" class="tab-a" data-id="tab3">饕客回饋</a></li>
                                            </ul>
                                        </div>
                                        <!--end of tab-menu-->
                    <div class="row">
                        <div class="col-xs-8 col-sm-5"  >
<%                               
                            out.println("<img class='tab tab-active' data-id='tab1' style='padding: 5%'' width='100%'' src='good/"+rs.getString("g_id")+".png'>");
                            out.println("<img class='tab' data-id='tab3' style='padding: 5%' width='100%' src='good/"+rs.getString("g_id")+".png'>");
%>
                            <img class="tab" data-id="tab2" style="padding: 5%" width="100%" src="img/商品照片_背景.png">
                            <br>
                            <div class="col-sm-12 tab"  data-id="tab2">
<%
                                out.println("<a href='#'><img class='arrow_S col-sm-2 left_S_arrow' width='20%'' src='img/right_arrow.png'></a>");
                                out.println("<a href='#'><img class='arrow_S right_arrow col-sm-2 '  width='20%' src='img/right_arrow.png'></a>");
%>
                            </div>
                        </div>
                        <div class="col-xs-6 col-sm-7 tab_right">
                            <div class="tab tab-active" data-id="tab1">
<%
                                out.println("<h2>"+rs.getString("g_type")+"</h2>");
                                out.println("<h5>星星放置區</h5><br>");
                                out.println("<h5><b>原產地:</b>"+rs.getString("g_place")+"</h5>");
                                out.println("<h5><b>養殖法:</b>"+rs.getString("g_farm")+"</h5>");
                                out.println("<h5><b>特性:</b>"+rs.getString("g_like")+"</h5>");
                                out.println("<h5><b>功效:</b>"+rs.getString("g_eff")+"</h5>");
                                out.println("<h5><b>數量:</b>"+rs.getString("g_storage")+"</h5>");
                                out.println("<h5><b>售價(包):</b>"+rs.getString("g_price")+"</h5>");
                                out.println("<h5><b>銷售數量:</b>"+rs.getString("g_sales")+"</h5>");
%>
                        <br>
                            <button type="button" class="btn btn-outline-success">加入購物車 🍄</button>
                            <button type="button" class="btn btn-outline-info">加入收藏 💚</button>
                        </div>

                        <!--end of tab one-->

                        <div class="tab receipt" data-id="tab2">
                            <h2>精氣神養身菇姑姑菇雞湯</h2>
                            <div id="scroll-me-all-night-long">

                                <table>
                                    <tr>
                                        <td>份量:<br>四人份</td>
                                        <td>所需時間:<br>60分鐘</td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">所需食材</td>
                                    </tr>
                                    <tr>
                                        <td>乾香菇(中小形）10朵</td>
                                        <td>雞腿肉 二大塊</td>
                                    </tr>
                                    <tr>
                                        <td>青蔥(支）2</td>
                                        <td>冷開水 700cc</td>
                                    </tr>
                                    <tr>
                                        <td>醬油 10cc</td>
                                        <td>白胡椒粉 適量</td>
                                    </tr>
                                    <tr>
                                        <td>香菇水 500cc</td>
                                        <td>白飯 1.5米杯</td>
                                    </tr>
                                    <tr>
                                        <td>雞粉或塩 適量</td>
                                        <td></td>
                                    </tr>
                                               <tr>
                                        <td>青蔥(支）2</td>
                                        <td>冷開水 700cc</td>
                                    </tr>
                                    <tr>
                                        <td>醬油 10cc</td>
                                        <td>白胡椒粉 適量</td>
                                    </tr>
                                    <tr>
                                        <td>香菇水 500cc</td>
                                        <td>白飯 1.5米杯</td>
                                    </tr>
                                    <tr>
                                        <td>雞粉或塩 適量</td>
                                        <td></td>
                                    </tr>           <tr>
                                        <td>青蔥(支）2</td>
                                        <td>冷開水 700cc</td>
                                    </tr>
                                    <tr>
                                        <td>醬油 10cc</td>
                                        <td>白胡椒粉 適量</td>
                                    </tr>
                                    <tr>
                                        <td>香菇水 500cc</td>
                                        <td>白飯 1.5米杯</td>
                                    </tr>
                                    <tr>
                                        <td>雞粉或塩 適量</td>
                                        <td></td>
                                    </tr>           <tr>
                                        <td>青蔥(支）2</td>
                                        <td>冷開水 700cc</td>
                                    </tr>
                                    <tr>
                                        <td>醬油 10cc</td>
                                        <td>白胡椒粉 適量</td>
                                    </tr>
                                    <tr>
                                        <td>香菇水 500cc</td>
                                        <td>白飯 1.5米杯</td>
                                    </tr>
                                    <tr>
                                        <td>雞粉或塩 適量</td>
                                        <td></td>
                                    </tr>
                                </table>
                                <br>
                                 <button type="button" class="btn btn-outline-info" style="width: 100%">查看更詳細的作法</button>
                            </div>
                        </div>
                        <!--end of tab two-->
                        <div class="tab " data-id="tab3">
                            <div id="scroll-me-all-night-long2">
                                <div>

                                    <div class="container">
                                        <div class="row">
                                            <div class="col-sm-12">
                                                <h6> 帳號:yenniscute</h6>
                                                <h6>留言內容: 非常好吃，下次會再回購</h6>
                                                <div class="row">
                                                    <div class="col-sm">
                                                        評分:🍄🍄🍄🍄🍄
                                                    </div>
                                                    <div class="col-sm">
                                                        購買數量:2(包)
                                                    </div>
                                                    <div class="col-sm">
                                                        2019/06/01 15:32
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <hr>
                                    <!---->
                                    <div class="container">
                                        <div class="row">
                                            <div class="col-sm-12">
                                                <h6> 帳號:yenniscute</h6>
                                                <h6>留言內容: 非常好吃，下次會再回購</h6>
                                                <div class="row">
                                                    <div class="col-sm">
                                                        評分:🍄🍄🍄🍄🍄
                                                    </div>
                                                    <div class="col-sm">
                                                        購買數量:2(包)
                                                    </div>
                                                    <div class="col-sm">
                                                        2019/06/01 15:32
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <hr>
                                    <div class="container">
                                        <div class="row">
                                            <div class="col-sm-12">
                                                <h6> 帳號:yenniscute</h6>
                                                <h6>留言內容: 非常好吃，下次會再回購</h6>
                                                <div class="row">
                                                    <div class="col-sm">
                                                        評分:🍄🍄🍄🍄🍄
                                                    </div>
                                                    <div class="col-sm">
                                                        購買數量:2(包)
                                                    </div>
                                                    <div class="col-sm">
                                                        2019/06/01 15:32
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <hr>
                                    <div class="container">
                                        <div class="row">
                                            <div class="col-sm-12">
                                                <h6> 帳號:yenniscute</h6>
                                                <h6>留言內容: 非常好吃，下次會再回購</h6>
                                                <div class="row">
                                                    <div class="col-sm">
                                                        評分:🍄🍄🍄🍄🍄
                                                    </div>
                                                    <div class="col-sm">
                                                        購買數量:2(包)
                                                    </div>
                                                    <div class="col-sm">
                                                        2019/06/01 15:32
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <hr>
                                    <div class="container">
                                        <div class="row">
                                            <div class="col-sm-12">
                                                <h6> 帳號:yenniscute</h6>
                                                <h6>留言內容: 非常好吃，下次會再回購</h6>
                                                <div class="row">
                                                    <div class="col-sm">
                                                        評分:🍄🍄🍄🍄🍄
                                                    </div>
                                                    <div class="col-sm">
                                                        購買數量:2(包)
                                                    </div>
                                                    <div class="col-sm">
                                                        2019/06/01 15:32
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <hr>


                                </div>

                            </div>
                        </div>
                        <!--end of tab three-->
                    </div>
                </div>
            </div>
            <div class="col-sm-2">
            <a href="#">
<%
        if(r <= (gid_num-1))
            out.println("<a href='product.jsp?gid="+(r+1)+"'><img class='arrow_B  right_arrow' width='60%'' src='img/right_arrow.png'></a>");
        if(r > (gid_num-1))
        {
            r=0;
            out.println("<a href='product.jsp?gid="+(r+1)+"'><img class='arrow_B  right_arrow' width='60%'' src='img/right_arrow.png'></a>");
        }
    }
    con.close();
    }
    catch (SQLException sExec) 
    {
        out.println("SQL錯誤"+sExec.toString());
    }

%>
        </a>
        </div>
        </div>




    </div>

<script src="js/jquery-3.2.1.min.js"></script>

<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.0/jquery.min.js'></script>






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
<script src="js/nav_script.js"></script>
<script src="js/index.js"></script>
<script src="js/jquery-ui.min.js"></script>

</body>
</html>