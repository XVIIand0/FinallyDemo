<%@ page import = "java.sql.*, java.util.*" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<!--基本元素複製區塊標頭-->
<html>

<head>
    <title>期末專案</title>
    <meta charset="utf-8">
   
    
    <link rel="stylesheet" type="text/css" href="css/back_index.css">

    <link rel="stylesheet" type="text/css" href="css/back.css">
    
    
</head>
<style>
    .check {
    background: url(icon/checked.png);
}</style>
<body>
    <div id="middle_back_7">
        <br>

        <!--後端葉面-->
        <div class="topic"><b>-後端介面-</b></div>

        <div id="back_t">
            <div class="back_left">
                <div> &nbsp;</div>
                <a href="back_member.jsp" style="color:#444444">
                    <div class="about_lable"> 會員管理</div>
                </a>
                <a href="back_product.jsp" style="color: #444444">
                    <div class="about_lable">商品管理</div>
                </a>
                <a href="back_order.jsp" style="color: #444444">
                    <div class="about_lable"> 訂單管理</div>
                </a>
                <a href="back_common.jsp" style="color: black">
                    <div class="about_lable_main"> 訪客回饋</div>
                </a>

            </div>


            <div class="back_right">
                <div class="inner_back">
                    <table>
                        <thead>
                            <tr>
                                <td>意見分類</td>
                                <td>訪客電話</td>
                                <td>訪客信箱</td>
                                <td>意見內容</td>
                                <td>已處理</td>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                String a=null;
                                try
                                {
                                    String tar = new String(request.getParameter("target").getBytes("ISO-8859-1"),"UTF-8");
                                    
                                    sql="SELECT * FROM member WHERE (m_ac like '%"+tar+"%') OR (m_name like '%"+tar+"%') ";
                                    
                                }
                                catch(Exception e)
                                {
                                    sql="SELECT * FROM guest;";
                                }
                                %>
                                <%
                               
                                ResultSet tmp=con.createStatement().executeQuery(sql);
                                int count=0;
                                while(tmp.next())
                                {
                                 out.println("<tr>");
                                 out.println("<td>"+tmp.getString("suggest_type")+"</td>");
                                 out.println("<td>"+tmp.getString("guest_tel")+"</td>");
                                 out.println("<td>"+tmp.getString("guest_mail")+"</td>");
                                 out.println("<td>"+tmp.getString("guest_content")+"</td>");
                                 out.println("<td>"+"<img src='icon/oval.png' id='el'>"+"</td>");
                                 out.println("</tr>");
                                 count++;
                                }
                                con.close();
                            %>
                      
                            
                        </tbody>

                    </table>


                </div>

            </div>
            <div style='clear:both;'></div>
        </div>
    </div>
</body>


</html>
<script>
    $(document).ready(function() {
        //選擇東西，套用效果

        $('img#el').click(function(e) {
            //選擇一個
            $(this).toggleClass('check');
        })
    })

</script>
