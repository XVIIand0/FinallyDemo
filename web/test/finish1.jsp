<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ page import = "java.sql.*, java.util.*, java.text.*" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!DOCTYPE html>

<html>

<head>
    <meta charset="utf-8">

    <title>期末專案</title>
    
    <link rel="stylesheet" type="text/css" href="css/order.css">
    <link rel="stylesheet" type="text/css" href="css/product2.css">
</head>

<body>
<%

ResultSet man=null;
ResultSet rs=null;
String sql2;
String acc=null;
String pas=null;
String name = request.getParameter("name");
String phone =request.getParameter("phone");
String mail = request.getParameter("email");
String address = request.getParameter("address");
String textarea = request.getParameter("textarea");
String pdate = request.getParameter("date");
String map = request.getParameter("map");
String gs = request.getParameter("gs");
String each_gid[] = gs.split(",");
String qs = request.getParameter("qs");
String each_quantity[] = qs.split(",");
String counts = request.getParameter("counts");


java.util.Date nDate = new java.util.Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String sDate = sdf.format(nDate);
        java.sql.Date now = java.sql.Date.valueOf(sDate);
		sql = "select o_id FROM gougou.`order` ORDER BY o_id desc LIMIT 1;"
										rs = con.createStatement().executeQuery(sql);
										rs.next();
										int thisoid = Integer.valueOf(rs.getString("o_id")).intValue();
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
                                    }
									try{
										for(int i = 1 ; i<each_gid.length ; i++){
										
										sql = "INSERT into `order`(o_id,each_o_id,m_id,taker,m_phone,m_ad,o_content,rdate,product,quantity,deal,sent) ";
										sql+="VALUE(?,?,?,?,?,?,?,?,?,?,?,?)";
										
										PreparedStatement pstmt = null;
										pstmt = con.prepareStatement(sql);
										pstmt.setString(1,(thisoid+1)));
										pstmt.setInt(2,i);
										pstmt.setString(3,acc);
										pstmt.setString(4,name);
										pstmt.setString(5,phone);
										pstmt.setString(6,address);		
										pstmt.setString(7,textarea);
										pstmt.setString(8,pdate);
										pstmt.setString(9,each_gid[i]);
										pstmt.setString(10,each_quantity[i]);
										pstmt.setString(11,counts);
										pstmt.setDate(12,now);
										pstmt.execute();
										
										sql = "select g_sales from good where g_id ="+each_gid[i]+";";
										rs = con.createStatement().executeQuery(sql);
										rs.next();																			
										int sales = con.createStatement().executeQuery(sql);
										int qa = Integer.valueOf(rs.getString(each_quantity[i])).intValue();
										sql = "UPDATE good set g_sale ="+(sales+qa)+"WHERE "+each_gid[i]+";"
										con.createStatement().executeUpdate(sql); 
										sql = "DELETE FROM shopping WHERE m_ac ='"+acc+"' and g_id="+each_gid[i]+";";
										con.createStatement().executeDelete(sql); 
										}
										
											
										
									}
                                    
	catch (SQLException sExec) {
           out.println("SQL錯誤"+sExec.toString());
    }

%>
    <div id="middle_shop_order">
        <br>
        <!--填寫資料部分-->
        <div class="topic"><b>- 訂單完成 -</b></div>
        <img src="img/shoping3.png">
        <div style="margin:8%; margin-top: 0%;">

            <div>親愛的菇菇嗑戶您好：<br>

                這個訊息是發自 MushroomHunter，告知您 MushroomHunter 已接獲您此次的訂購需求，並將以最快速度處理！<br>

                感謝您對 MushroomHunter 的支持並承蒙訂購，以下資料是您此次的訂購明細，若有問題則請依訂單編號向我們查詢，謝謝您！<br>

                MushroomHunter 仍保有決定是否接受訂單及出貨與否之權利，出貨以及取貨通知函，將以E-mail方式通知您！</div>
            <br>
            

            <div class="finish_padding">
              <div class="finish_title"><b>訂單明細</b></div>
               <div style="margin: 2% 10%;">
               
                訂單編號：<%
					out.print((thisoid+1));
				%> <br>

                配送方式：宅配<br>

                付款方式：貨到付款<br>

                收件人：<%out.print(name);%><br>

                應付金額 : NT.<%out.print(counts);%><br><br><br>

                訂購商品名稱與數量：
				<%
								
				for(int i = 1 ; i<each_gid.length ; i++){
					sql = "select g_type from good where g_id ="+each_gid[i]+";";
					ResultSet rs2=con.createStatement().executeQuery(sql);
					rs2.next();
					out.print("<hr>"+rs2.getString("g_type")+"<br><div class='finish_num'><br>數量:"+each_quantity[i]+"</div>");
				}
				
				%>
             
                <hr>
                </div>
            </div>
            <br><br>
            為了保護您的個人資料安全，建議您可隨時登入MushroomHunter網站，至會員專區，查詢訂單、最新訊息或修改基本資料。如果您有任何問題，請您至客服中心查詢相關訊息或來信給我們。<br><br>

             MushroomHunter 敬上
            <br>
            <br>
            <br>
            <br>
            <a href="member_center.jsp"><button class="finish_before_bt">點我至會員中心</button></a>
            <a href="index.jsp"> <button class="finish_next_bt">繼續購物go</button></a>
        </div>
        <br>
    </div>

</body>

</html>
