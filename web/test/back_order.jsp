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
    <div id="middle_back">
        <br>

        <!--後端葉面-->
        <div class="topic"><b>-後端介面-</b></div>
        <div style="float: left; margin-top:-4%;margin-left: 5%;">
       <form action="#" method="post">
            <img src="icon/search.png" style="width: 5%;">
            <input type="search"  name="target" placeholder="請輸入訂單編號或收件人">
            <input type="submit" value="搜尋">
       </form>
        </div>
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
                                <td>訂單編號</td>
                                <td>收件人</td>
                                <td>收件人手機</td>
                                <td>配送地點</td>
                                <!--宅配國家+地址-->
                                <td>備註</td>
                                <!--限字數-->
                                <td>訂單明細</td>
                                <!--另啟視窗-->
                                <td>接單日期</td>
                                <td>貨品應到達日期</td>
                                <td>移除</td>
                                <td>已送件</td>
                                <!--顧客填完評論後打勾-->

                            </tr>
                        </thead>
                        <tbody>
                             <%
                  String a=null;
                            try
                                    {
                                        String tar = new String(request.getParameter("target").getBytes("ISO-8859-1"),"UTF-8");       
                                        sql="SELECT * FROM gougou.order WHERE (o_id like '%"+tar+"%') OR (m_name like '%"+tar+"%')";
                                    }
                                    catch(Exception e)
                                    {
                                        sql="SELECT * FROM gougou.order;";

                                    }         
                                    %>                  
                            <%
                            ResultSet tmp=con.createStatement().executeQuery(sql);
                             int count=0;
                            while(tmp.next())
                            {
                               
                               
                               
                                out.println("<tr>");
                                out.println("<td>"+tmp.getString("o_id")+"</td>");
                                out.println("<td>"+tmp.getString("m_name")+"</td>");
                                out.println("<td>"+tmp.getString("m_phone")+"</td>");
                                 out.println("<td style='text-align:left'>"+tmp.getString("m_ad")+"</td>");      //地址
                                 out.println("<td style='text-align:left;font-size:14px;'>"+tmp.getString("o_content")+"</td>");  //備註
                                 out.println("<td class='read_detail' onclick=\"window.open('window_order_detail.html','PHP.NET',config='height=450,width=450,toolbar=no,left=550,top=200');\">"+"查看"+"</td>"); //訂單明細
                                    out.println("<td>"+tmp.getString("sent")+"</td>");  //接單日期
                                    out.println("<td>"+tmp.getString("rdate")+"</td>");  //送貨日期
                                    out.println("<td>"+"<a href='delete_order.jsp?o_id="+tmp.getString("o_id")+"'>"+"<img src='icon/cancel.png' class='confirmation'>"+"</a>"+"</td>");   //移除
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
<script type="text/javascript">
    var elems = document.getElementsByClassName('confirmation');
    var confirmIt = function (e) {
        if (!confirm('確定刪除此商品?')) e.preventDefault();
    };
    for (var i = 0, l = elems.length; i < l; i++) {
        elems[i].addEventListener('click', confirmIt, false);
    }
</script>
<script>
    $(document).ready(function() {
        //選擇東西，套用效果

        $('img#el').click(function(e) {
            //選擇一個
            $(this).toggleClass('check');
        })
    })

</script>

