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
   <%
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
                                        sql="SELECT * FROM member WHERE m_ac='"+acc+"' and m_pw='"+pas+"'";
                                        ResultSet man=con.createStatement().executeQuery(sql);
                                        man.next();
                                        if(man.getString("m_level").equals("1"))
                                        {

                                        }
                                        else
                                        {
                                            out.write("<script language=javascript>alert('非管理者，無法進入');</script>");
                                            response.setHeader("refresh","0;URL=index.jsp");
                                        }
                                    }
                                catch(Exception e)
                                    {
                                        out.write("<script language=javascript>alert('非管理者，無法進入');</script>");
                                        response.setHeader("refresh","0;URL=index.jsp");
                                    }
                               
                            %>
    <div id="middle_back">
        <br>
        <div class="topic"><b>-後端介面-</b></div>
        <!--後端葉面-->
        <div>



            <div style="float: left; margin-top:-4%;margin-left: 5%;">
                <form action="#" method="POST">
                    <img src="icon/search.png" style="width: 5%;">
                    <input type="search" id="target" name="target" placeholder="搜尋商品名稱">
                    <input type="submit" value="搜尋">
                </form>
            </div>
        </div>
        <div style='clear:both;'></div>




        <div> &nbsp;</div>
        <div>
            <a href="b_member.jsp" style="color:#444444; ">
                <div class="about_lable"> 會員管理</div>
            </a>
            <a href="b_product.jsp" style="color: black">
                <div class="about_lable_main">商品管理</div>
            </a>
            <a href="b_order.jsp" style="color: #444444">
                <div class="about_lable"> 訂單管理</div>
            </a>
            <a href="b_common.jsp" style="color: #444444">
                <div class="about_lable"> 訪客回饋</div>
            </a>
        </div>
        <div style='clear:both;'></div>


        <div class="inner_back">
            <table>
                <thead>
                    <tr>
                        <td>庫存</td>
                        <td>編號</td>
                        <td>圖片</td>
                        <td>品種</td>
                        <td>功效屬性</td>
                        <td>價錢(包)</td>
                        <td >銷售數量</td>
                        <td>庫存數量</td>
                        <td>生長環境</td>
                        <td style="width:10%;">養殖方法</td>
                        <td style="width:10%;">菇菇外觀</td>
                        <td style="width:10%;">食用功效</td>
                        <td>刪除</td>
                    </tr>
                </thead>
                <tbody>
                   
                    <%
                    try{
                            try
                            {
                                String tar = new String(request.getParameter("target").getBytes("ISO-8859-1"),"UTF-8");
                                sql="SELECT * FROM good WHERE (g_id like '%"+tar+"%') OR (g_type like '%"+tar+"%')";
                            }
                            catch(Exception e)
                            {
                                sql="SELECT * FROM good;";
                            }

                            ResultSet tmp=con.createStatement().executeQuery(sql);
      %>
                   <form action="confirmgood.jsp" method="POST">
                        <%
                            int count=0;
                            while(tmp.next())
                            {
                               
                                String i=tmp.getString("g_id");
                                
                                out.println("<tr>");
                                if(tmp.getInt("g_storage")>49)
                                {
                                    out.println("<td class='td_width_10'>"+"<img src='icon/smile.png' >"+"</td>");
                                }
                                else
                                {
                                    out.println("<td class='td_width_10'>"+"<img src='icon/exclamation-mark.png' >"+"</td>");
                                }
                                out.println("<td>"+"<input type='text' name='g_id' class='td_width_80' placeholder='商品編號' value='"+tmp.getString("g_id")+"'>"+"</td>");
                                out.println("<td >"+"<img src='"+tmp.getString("g_photo")+"'>"+"</td>");
                                out.println("<td>"+"<input type='text' name='g_type'  placeholder='品種' value='"+tmp.getString("g_type")+"'>"+"</td>");
                                out.println("<td>"+"<input type='text' name='g_tag' class='td_width_80' placeholder='屬性' value='"+tmp.getString("g_tag")+"'>"+"</td>");
                                out.println("<td>"+"<input type='text' name='g_price' class='td_width_80' placeholder='價錢(包)' value='"+tmp.getString("g_price")+"'>"+"</td>");
                                out.println("<td>"+tmp.getString("g_sales")+"</td>");
                                out.println("<td>"+"<input type='text' name='g_storage' class='td_width_80' placeholder='庫存數量' value='"+tmp.getString("g_storage")+"'>"+"</td>");
                                out.println("<td>"+"<input type='text' name='g_place'  placeholder='生長環境' value='"+tmp.getString("g_place")+"'>"+"</td>");
                                out.println("<td>"+"<input type='text' name='g_farm'  placeholder='養殖方法' value='"+tmp.getString("g_farm")+"'>"+"</td>");
                                out.println("<td>"+"<input type='text' name='g_like' placeholder='菇菇外觀' value='"+tmp.getString("g_like")+"'>"+"</td>");
                                out.println("<td>"+"<input type='text' name='g_eff'  placeholder='食用功效' value='"+tmp.getString("g_eff")+"'>"+"</td>");
                                out.println("<td class='td_width_10'>"+"<a href='delete_product.jsp?g_id="+tmp.getString("g_id")+"'"+"class='confirmation'"+">"+"<span class='hint--bottom' data-hint='刪除'>"+"<img src='icon/x-button.png' >"+"</span>"+"</a>"+"</td>");

                                count++;
                            }
                            %>
                           
                        
                        <input type="image" class="back_p_submit" src="icon/submit.png">
                    </form>
                    <%
                        }
                        catch(Exception err)
                        {
                            out.write("<script>alert('查無此商品');</script>");
                            response.setHeader("refresh","0;URL=b_product.jsp");
                        }
                        con.close();
                    %>
<img src="icon/add.png" class="back_p_add" onclick="window.open('window_add_product.jsp','PHP.NET',config='height=600,width=1450,toolbar=no,left=200,top=100');">

                </tbody>

            </table>


        </div>


    </div>

</body>
<script type="text/javascript">
    var elems = document.getElementsByClassName('confirmation');
    var confirmIt = function(e) {
        if (!confirm('確定刪除此商品?')) e.preventDefault();
    };
    for (var i = 0, l = elems.length; i < l; i++) {
        elems[i].addEventListener('click', confirmIt, false);
    }

</script>

</html>
