<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ page import = "java.sql.*, java.util.*" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!DOCTYPE html>
<!--基本元素複製標頭-->
<html>

<head>
    <meta charset="utf-8">

    <title>期末專案</title>
    <link rel="stylesheet" href="index.css">
    <link rel="stylesheet" type="text/css" href="css/order.css">
    <link rel="stylesheet" type="text/css" href="css/carts_product.css">
</head>

<style>
html,body{
	font-family: Microsoft JhengHei;
}
</style>
<body>
<% 
ResultSet man=null;
String sql2;

String total_c = request.getParameter("total_c");
String gs = request.getParameter("gs");
String counts = request.getParameter("counts");
String qs = request.getParameter("qs");
if(gs=="1"){
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
                                        man=con.createStatement().executeQuery(sql);
                                        man.next();
                                        if(man.getString("m_level").equals("0"))
                                        {

                                        }
                                        else
                                        {
                                            out.write("<script language=javascript>alert('請先或註冊哦!');</script>");
                                            response.setHeader("refresh","0;URL=index.jsp");
                                        }
                                    }
                                catch(Exception e)
                                    {
                                          out.write("<script language=javascript>alert('請先或註冊哦!');</script>");
                                            response.setHeader("refresh","0;URL=index.jsp");
                                    }%>
    <div id="middle_shop_order">
        <br>
        <!--填寫資料部分-->
        <div class="topic"><b>- 確認收件資料 -</b></div>
        <img style="margin-left:5%;" src="img/shoping2.png">
        <div style="margin:2%; margin-top: -4.5%;">
            <br>
            <table>
                <tbody>
				<form id='o_form' method='get' action='finish.jsp'>
                    <tr>
                        <td>收件者</td>
                        <td><input type="text" name="name" value="" /></td>
                        <td>手機號碼</td>
                        <td colspan="4"><input class="table_width" type="text" name="phone" value="" /></td>
                    </tr>

                    <tr>
                        <td>email</td>
                        <td colspan="4"><input class="table_width" type="email" name="email" value="" /></td>
                    </tr>
                    <tr>
                        <td>地址</td>
                        <td colspan="4">
                            <input class="table_width" type="text" name="address" value="" />
                        </td>
                    </tr>
                    <tr>
                        <td>備註</td>
                        <td colspan="4"><textarea name='textarea' form='o_form' style="resize:none;width:99.5%;height:100px;"></textarea></td><br>
                    </tr>
                     <tr><td colspan="5"><label for='massage'>選擇欲收貨日期：</label>
                            <input name='date' type="date" id="massage"></td>
                        </tr>
                       
                        <tr><td style="border-bottom: 1px solid #fff;">宅配國家</td>
                        <td colspan="2" class="tfoot_style">
                            <select name="map" size="1" ;class="tfoot_style">
                                <option value='taiwan'>台灣</option>
                                <option value='china'>中國大陸</option>
                                <option value='honkong'>香港</option>
                                <option value='japan'>日本</option>
                            </select>
                        </td>
                        <td class="tfoot_style">付款方式: </td>
                        <td style="color: black;font-weight: 500;border-bottom: 1px solid #fff;">貨到付款 </td>
                    </tr>
					
                </tbody>
                <tfoot>
                    <tr>
                        <td colspan="5" style="font-weight:500;"><br><b>※ 提醒您：</b><br>
                            本店配送方式皆為宅配，請填寫正確收件人資訊，避免包裹配送不達，請填寫正確收件人姓名(與證件相符)，避免無法領取</td>
                    </tr>
                    <tr>
                        <td class="tfoot_style">&emsp;</td>
                        <td class="tfoot_style">&emsp;</td>
                        <td>&emsp;</td>
                        <td colspan="4" style="font-size:14px;">總金額 &emsp;&emsp;&emsp;<%out.print("NT."+total_c);%><br>
                            運&emsp;費 &emsp;&emsp;&emsp;NT.60<br>
                        </td>
                    </tr>
                    <tr>
                        <td class="tfoot_style">&emsp;</td>
                        <td class="tfoot_style">&emsp;</td>
                        <td class="tfoot_style">&emsp;</td>
                        <td colspan="4" class="tfoot_style">應付金額 &emsp;<%out.print("NT."+(Integer.valueOf(total_c).intValue()+60));%>
                        </td>
                    </tr>
                </tfoot>
            </table>
			<%out.print("<input type='hidden' name='gs' value='"+gs+"'>");%>
			<%out.print("<input type='hidden' name='qs' value='"+qs+"'>");%>
			<%out.print("<input type='hidden' name='counts' value='"+total_c+"'>");

}
						else{
							out.write("<script language=javascript>alert('沒勾選商品喔!!!');</script>");
							response.setHeader("refresh","0;URL=shopcart.jsp");
						}%>
            <a href="shopcart.jsp"><button class="order_before_bt">返回確認商品</button></a>
            <a href="finish.jsp"><button class="order_next_bt">確認此筆訂單</button></a>
			</form>
        </div>
        <br>
    </div>

</body>

</html>
