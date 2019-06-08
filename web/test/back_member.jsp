<%@ page import = "java.sql.*, java.util.*" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!--基本元素複製區塊標頭-->
<html>

<head>
    <title>期末專案</title>
    <meta charset="utf-8">

    <link rel="stylesheet" type="text/css" href="css/back_index.css">

    <link rel="stylesheet" type="text/css" href="css/back.css">
</head>

<body>
    <div id="middle_back">
        <br>

        <!--後端葉面-->
        <div class="topic"><b>-後端介面-</b></div>
        <div style="float: left; margin-top:-4%;margin-left: 5%;"><img src="icon/search.png" style="width: 5%;"><input type="search" placeholder="請輸入會員編號"><input type="button" value="搜尋"></div>
        <div id="back_t">
            <div class="back_left">
                <div> &nbsp;</div>
                <a href="back_member.jsp" style="color: black">
                    <div class="about_lable_main"> 會員管理</div>
                </a>
                <a href="back_product.jsp" style="color: #444444">
                    <div class="about_lable">商品管理</div>
                </a>
                <a href="back_order.jsp" style="color: #444444">
                    <div class="about_lable"> 訂單管理</div>
                </a>
                <a href="back_common.jsp" style="color: #444444">
                    <div class="about_lable"> 訪客回饋</div>
                </a>

            </div>


            <div class="back_right">
                <div class="inner_back">
                    <table>
                        <thead>
                            <tr>
                                <td>會員編號</td>
                                <td style="width: 10%;">會員照片</td>
                                <td>會員姓名</td>
                                <td>會員帳號</td>
                                <td>會員密碼</td>
                                <td>會員地址</td>
                                <td>會員電話</td>
                                <td>會員信箱</td>
                                <td>購物紀錄</td>
                                <td>個人食譜</td>
                                <td>刪除會員</td>
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
                                    sql="SELECT * FROM member;";
                                }
                                %>
                            <%
                               
                                ResultSet tmp=con.createStatement().executeQuery(sql);
                                int count=0;
                                while(tmp.next())
                                {
                                    out.println("<tr>");
                                    out.println("<td>"+tmp.getString("m_id")+"</td>");
                                    out.println("<td >"+"<img src='goods/"+tmp.getString("m_id")+".png'>"+"</td>");
                                    out.println("<td>"+tmp.getString("m_name")+"</td>");
                                    out.println("<td>"+tmp.getString("m_ac")+"</td>");
                                    out.println("<td>"+tmp.getString("m_pw")+"</td>");
                                    out.println("<td>"+tmp.getString("m_ad")+"</td>");
                                    out.println("<td>"+tmp.getString("m_phone")+"</td>");
                                    out.println("<td>"+tmp.getString("m_mail")+"</td>");
                                    out.println("<td class='read_detail' onclick=\"window.open('window_shopping_detail.html','PHP.NET',config='height=450,width=800,toolbar=no,left=550,top=200');\">"+"查看"+"</td>"); 
                                    out.println("<td class='read_detail' onclick=\"window.open('window_member_ recipe.html','PHP.NET',config='height=450,width=1850,toolbar=no,left=15,top=200');\">"+"查看"+"</td>"); 
                                    out.println("<td>"+"<a href='delete.jsp?m_ac="+tmp.getString("m_ac")+"'"+"class='confirmation'"+">"+"<span class='hint--right' data-hint='刪除'>"+"<img src='icon/x-button.png' class='back_delete_icon'"+"</span>"+"</a>"+"</td>");
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
<script type="text/javascript">
    var elems = document.getElementsByClassName('confirmation');
    var confirmIt = function(e) {
        if (!confirm('確定刪除此會員？')) e.preventDefault();
    };
    for (var i = 0, l = elems.length; i < l; i++) {
        elems[i].addEventListener('click', confirmIt, false);
    }

</script>

</html>
<script type="text/javascript">
    var elems = document.getElementsByClassName('confirmation');
    var confirmIt = function(e) {
        if (!confirm('確定刪除此會員？')) e.preventDefault();
    };
    for (var i = 0, l = elems.length; i < l; i++) {
        elems[i].addEventListener('click', confirmIt, false);
    }

</script>