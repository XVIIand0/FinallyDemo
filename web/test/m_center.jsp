<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ page import = "java.sql.*, java.util.*" %>
<%@ page language="java" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html lang="en" >
	<head>
		<meta charset="UTF-8">
		<title>member profile</title>
		<link rel="stylesheet" href="css/memberprofile.css">
		
		<script src="https://kit.fontawesome.com/a64b954922.js"></script>
	</head>
	
<style>
html,body{
	font-family: Microsoft JhengHei;
}
</style>
	<body>
	 <%
                ResultSet man=null;
     //判別會員有沒有登入
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
                               String dir =request.getParameter("page");
							   String dir2 =request.getParameter("page_o");
                            %>
		<div class="tab">
			<button class="tablinks" onclick="openCity(event, 'MemberProfile')" id="defaultOpen">會員資料</button>
			<button class="tablinks" onclick="openCity(event, 'TransactionRecord')">購物紀錄</button>
<button class="tablinks" onclick="openCity(event, 'Order')">查看訂單</button>
			<button class="tablinks" onclick="openCity(event, 'Recipe')">個人食譜</button>
		</div>
		
		<div id="MemberProfile" class="tabcontent">
			<div class="member-card">
				<div class="member-card_content">
					<div class="member-header">
						<%out.println("<font>"+man.getString("m_name")+"的檔案</font>");%>
					</div>
					<hr class="member-hr">
					<div class="member-grid">
						<div class="member-content">
							<table class="member-table">
								<form action="alter_m.jsp"  enctype="multipart/form-data" method="post" >
                                <tr>
									<td class="content-title">帳號</td>
									<td class="member-input"><label><%=man.getString("m_ac")%></label></td>
								</tr>
                                <tr>
									<td class="content-title">名字</td>
									<td class="member-input"><input type="text" name="m_name" placeholder="請輸入名字~" value="<%=man.getString("m_name")%>"></td>
								</tr>
								<tr>
									<td class="content-title">密碼</td>
									<td class="member-input"><input type="text" name="m_pw" placeholder="請輸入密碼~" value="<%=man.getString("m_pw")%>" ></td>
								</tr>
								<tr>
									<td class="content-title">Email</td>
									<td class="member-input"><input type="text" name="m_mail" placeholder="請輸入email~" value="<%=man.getString("m_mail")%>"></td>
								</tr>
								<tr>
									<td class="content-title">連絡電話</td>
									<td class="member-input"><input type="text" name="m_phone" placeholder="請輸入連絡電話~" value="<%=man.getString("m_phone")%>"></td>
								</tr>
								<tr>
									<td class="content-title">地址</td>
									<td class="member-input"><input type="text" name="m_ad" placeholder="請輸入地址~" value="<%=man.getString("m_ad")%>"></td>
								</tr>
								
							</table>
							
							
						</div>
						<div class="member-photo">
							
								<div class="member-head">
									<img class="img100" id="img1" src="<%out.print(man.getString("m_photo"));%>"/>
								</div>
								<div class="select-photo">
									<label>
										<input name="g_photo" type="file" style="display:none;" onchange="readURL(this)" targetID="img1" accept="image/gif, image/jpeg, image/png"/>
										上傳圖片
									</label>
								</div>
								<button class="member-change-button">儲存</button>
							
						</div>
						</form>
					</div>
				</div>
			</div>
		</div>
<%
		try{
			sql="SELECT * FROM gougou.`order` where m_id = '"+acc+"';";
			ResultSet rsint =con.createStatement().executeQuery(sql);
			if(rsint.next()){
			ResultSet rs=con.createStatement().executeQuery(sql);
			int i = 1;
			rs.last();
			int total_c = rs.getRow();
			String now = request.getParameter("page");
			if(now == null)
				now="1";
			int nowpage = Integer.valueOf(now).intValue();
			int pagenu = nowpage;
			nowpage = (nowpage -1);
			
			if(nowpage > 0)
			nowpage *=5;
			sql="SELECT * FROM gougou.`order` where m_id ='"+acc+" ' order by o_id LIMIT "+nowpage+" ,5  ";
			rs = con.createStatement().executeQuery(sql);
			int countpage = (int)(total_c/5) ;
			countpage +=1;
			%>
	<div id="TransactionRecord" class="tabcontent">
		<div class="page-button">
			<%
			if(pagenu!=1){
			out.print("<a href='member_center.jsp?page="+(pagenu-1)+"' class='previous'>&laquo; 上一頁</a>");
			}
				for(i = 1 ; i<=countpage;i++){
				
				
				out.print("<a href ='member_center.jsp?page="+i+"' class='Next-Previous'>"+i+"</a>");
				
				}
				if(pagenu<countpage){
				out.print("<a href=''member_center.jsp?page="+(pagenu+1)+"' class='next'>下一頁&raquo; </a>");
				}
			%>
		</div>
			<div class="whole-card">
		<%
			i = 1;
			while(rs.next())
			{
			if(i==1){
				out.print("<form enctype='multipart/form-data' class='form_c'><div class='order-card first-card'>");
			i++;
			}
			else{
				out.print("<form enctype='multipart/form-data class=''' class='form_c'><div class='order-card'>");
			}
			out.print("<div class='order-card_content'>");
			out.print("<tr><div>");
			out.print("<div class='order-number-align'>");
			out.print("訂單標號:<td class='order-number'>");
			out.print("<input type ='hidden' name='o_id' value='"+rs.getString("o_id")+"'>");
			out.print(rs.getString("each_o_id"));
			out.print("<div class='buying-time-align'>購買時間:<td class='buy-time'>");
			out.print(rs.getString("rdate"));
			out.print("</td><br></div></div></tr><tr>");
			out.print("<div><div class='product-name-align'>");
			out.print("商品名稱:<td class='product-name'>");
			sql = "select g_type from gougou.good where g_id ="+rs.getString("product");
			ResultSet rs2=con.createStatement().executeQuery(sql);
			rs2.next();
			out.print(rs2.getString("g_type"));
			out.print("</td>");
			out.print("</div>");
			out.print("<div class='quantity-align'>");
			out.print("數量:<td class='quantity'>");
			out.print(rs.getString("quantity"));
			out.print("</td></div></div></tr></div>");
			out.print("<div class='dot-circle>'");
			out.print("<div class='left-circle'></div>");
			out.print("<div class='right-circle'></div></div>");
			out.print("<div class='order-card_bottom'>");
			out.print("<div class='star st1'>");
			if(rs.getString("m_g_star")==null){
			for(int x = 1 ; x<=5 ;x++)
			{
			
				out.print("<i class='fas fa-2x fa-grin-hearts'></i>");
			}
			}
			
			else{
			int stars = Integer.valueOf(rs.getString("m_g_star")).intValue();
			for(int x = 1 ; x<=5 ;x++){
				if(x<=stars){
				out.print("<i style='color:yellow;' class='fas fa-2x fa-grin-hearts ov'></i>");
				}
				else{
				out.print("<i style='color:grey;' class='fas fa-2x fa-grin-hearts ov'></i>");
				}

			}
			}
			out.print("<input class='total_star' type='hidden' name='star'></div>");
			out.print("<div class='review-all'>");
			out.print("<div class='review-title>'");
			out.print("<font>商品評論:</font></div><div class='review'>");
			if(rs.getString("m_g_content")==null){
				out.print("<textarea name='text' class='product-review'></textarea>");
			}
			else{
				out.print("<p class='product-review'>"+rs.getString("m_g_content")+"</p>");
			}
	
			out.print("</div></div>");
			if(rs.getString("m_g_content")==null)
			out.print("<button type='button' class='submit-button'>送出</button>");
			out.print("</form></div></div>");
			
		}
	
		%>
			
			<div class="dot-circle">
				<div class="left-circle"></div>
				<div class="right-circle"></div>
			</div>
			<div class="order-card_bottom">
				





				
			</div>
		</div>
	</div>
	<div class="page-button bottom-page-button">
			<%
			
			%>
		</div>
</div>

<div id="Order" class="tabcontent">
<div class="page-button">
	<%
			}
			else{
				out.print("<script> alert('沒有訂單紀錄，快去買點東西吧!'); openCity(event, 'MemberProfile')</script>");
			}
			sql="SELECT * FROM gougou.`order` where m_id = '"+acc+"' group by o_id;";
			rsint =con.createStatement().executeQuery(sql);
			if(rsint.next()){
			ResultSet rs=con.createStatement().executeQuery(sql);
			int i = 1;
			rs.last();
			int total_c = rs.getRow();
			String now = request.getParameter("page_o");
			if(now == null)
				now="1";
			int nowpage = Integer.valueOf(now).intValue();
			int pagenu = nowpage;
			nowpage = (nowpage -1);
			
			if(nowpage > 0)
			nowpage *=5;
			
			int countpage = (int)(total_c/5) ;
			countpage +=1;
			if(pagenu!=1){
			out.print("<a href='member_center.jsp?page_o="+(pagenu-1)+"' class='previous'>&laquo; 上一頁</a>");
			}
				for(i = 1 ; i<(countpage+1);i++){
				
				
				out.print("<a href ='member_center.jsp?page_o="+i+"' class='Next-Previous'>"+i+"</a>");
				
				}
				if(pagenu<(countpage)){
				out.print("<a href='member_center.jsp?page_o="+(pagenu+1)+"' class='next'>下一頁&raquo; </a>");
				}
			
			%>
			</div>
	
	<%
		sql="SELECT * FROM gougou.`order` where m_id ='"+acc+"' group by o_id LIMIT "+nowpage+" ,5 ";
			rs = con.createStatement().executeQuery(sql);
			int x;
			int y ;
			ResultSet rs4 ;
			ResultSet rs5;
			while(rs.next()){
				x = 1;
				y = 1;
				y++;
		sql="SELECT * FROM gougou.`order` where m_id ='"+acc+" ' and o_id ="+rs.getString("o_id")+" ;";
		rs4 = con.createStatement().executeQuery(sql);
		if (y==1){
			out.print("<div class='buying_order_card first-card'>");
			y =2 ;
		}
		else{
		out.print("<div class='buying_order_card'>");
		}
			out.print("<form enctype='multipart/form-data' class='form_o' method='post'>");
			out.print("<div class='order-card_content'>");
			out.print("購買時間:");
			out.print("<div class='order_buying_time'>"+rs.getString("sent")+"</div>");
			out.print("</div>");
			out.print("<div class='dot-circle'>");
				out.print("<div class='left-circle'></div>");
				out.print("<div class='right-circle'></div>");
			out.print("</div>");
			while(rs4.next()){
			out.print("<div class='order-card_bottom'>");
			if(x == 1){
				out.print("<div class='order_content first_card_content'>");
				x = 2 ;
			}
					else{
						out.print("<div class='order_content'>");
						}
					out.print("<div class='order_img_area'>");
					sql = "select g_photo , g_type , g_price from good where g_id ="+rs4.getString("product")+";";
					rs5 = con.createStatement().executeQuery(sql);
					rs5.next();
						out.print("<img class='order_img' src='"+rs5.getString("g_photo")+"'>");
					out.print("</div>");
					out.print("<div class='order_name'>"+rs5.getString("g_type")+"</div><br>");
					out.print("<div class='order_quantity'>x"+rs4.getString("quantity")+"</div>");
					out.print("<div class='order_pay'>$"+(Integer.valueOf(rs4.getString("quantity")).intValue()*Integer.valueOf(rs5.getString("g_price")).intValue())+"</div>");
				out.print("</div>");
			out.print("</div>");
			}			
			out.print("<div class='order_total'>");
				out.print("合計:");
				out.print("<div class='total_text'>$"+rs.getString("deal")+"</div>");
			out.print("</div>");
		out.print("</form></div>");
			}
			
	%>
		
	
	<div class="page-button bottom-page-button">
		<%
		if(pagenu!=1){
			out.print("<a href='member_center.jsp?page_o="+(pagenu-1)+"' class='previous'>&laquo; 上一頁</a>");
			}
				for(i = 0 ; i<countpage;i++){
				
				
				out.print("<a href ='member_center.jsp?page_o="+i+"' class='Next-Previous'>"+i+"</a>");
				
				}
				if(pagenu<countpage){
				out.print("<a href='member_center.jsp?page_o="+(pagenu+1)+"' class='next'>下一頁&raquo; </a>");
				}
			}%>
	</div>
</div>

<div id="Recipe" class="tabcontent">
	<div class="page-button">
			<a href="#" class="previous">&laquo; 上一頁</a>
			<a href="#" class="Next-Previous">1</a>
			<a href="#" class="Next-Previous">2</a>
			<a href="#" class="next">下一頁 &raquo;</a>
		</div>

		<div class="whole-recipe">
			<div class="recipe-card first-card">
				<form action="" method="post" enctype="multipart/form-data">
					<div class="upload-date">
						<tr>
							<td>上傳日期:</td>
							<td>123456789</td>
						</tr>
					</div>
					<div class="recipe-card-title">
						<input type="text" name="" placeholder="食譜名稱">
					</div>
					<div class="recipe-card-content">
						<div class="recipe-card-content-left">
							<div class="recipe-photo">
								<img class="img100" id="img2" src="#"/>
							</div>
							<div class="recipe-select-photo">
								<label>
									<input type="file" style="display:none;" onchange="readURL(this)" targetID="img2" accept="image/gif, image/jpeg, image/png"/>
									上傳圖片
								</label>
							</div>
						</div>
						<div class="recipe-card-content-right">
							<input onkeyup="value=value.replace(/^(0+)|[^\d]+/g,'')" type="text" name="" placeholder="份量(人)"><br>
							<input onkeyup="value=value.replace(/^(0+)|[^\d]+/g,'')" type="text" name="" placeholder="料理時間(min)">
							<textarea class="recipe-textarea" placeholder="食譜內容"></textarea>
						</div>
					</div>
					<input class="recipe-submit-button" type="submit" value="送出">
				</form>
			</div>

			<div class="recipe-card">
				<form action="" method="post" enctype="multipart/form-data">
					<div class="upload-date">
						<tr>
							<td>上傳日期:</td>
							<td>123456789</td>
						</tr>
					</div>
					<div class="recipe-card-title">
						<input type="text" name="" placeholder="食譜名稱">
					</div>
					<div class="recipe-card-content">
						<div class="recipe-card-content-left">
							<div class="recipe-photo">
								<img class="img100" id="img2" src="#"/>
							</div>
							<div class="recipe-select-photo">
								<label>
									<input type="file" style="display:none;" onchange="readURL(this)" targetID="img2" accept="image/gif, image/jpeg, image/png"/>
									上傳圖片
								</label>
							</div>
						</div>
						<div class="recipe-card-content-right">
							<input onkeyup="value=value.replace(/^(0+)|[^\d]+/g,'')" type="text" name="" placeholder="份量(人)"><br>
							<input onkeyup="value=value.replace(/^(0+)|[^\d]+/g,'')" type="text" name="" placeholder="料理時間(min)">
							<textarea class="recipe-textarea" placeholder="食譜內容"></textarea>
						</div>
					</div>
					<input class="recipe-submit-button" type="submit" value="送出">
				</form>
			</div>

			<div class="recipe-card">
				<form action="" method="post" enctype="multipart/form-data">
					<div class="upload-date">
						<tr>
							<td>上傳日期:</td>
							<td>123456789</td>
						</tr>
					</div>
					<div class="recipe-card-title">
						<input type="text" name="" placeholder="食譜名稱">
					</div>
					<div class="recipe-card-content">
						<div class="recipe-card-content-left">
							<div class="recipe-photo">
								<img class="img100" id="img2" src="#"/>
							</div>
							<div class="recipe-select-photo">
								<label>
									<input type="file" style="display:none;" onchange="readURL(this)" targetID="img2" accept="image/gif, image/jpeg, image/png"/>
									上傳圖片
								</label>
							</div>
						</div>
						<div class="recipe-card-content-right">
							<input onkeyup="value=value.replace(/^(0+)|[^\d]+/g,'')" type="text" name="" placeholder="份量(人)"><br>
							<input onkeyup="value=value.replace(/^(0+)|[^\d]+/g,'')" type="text" name="" placeholder="料理時間(min)">
							<textarea class="recipe-textarea" placeholder="食譜內容"></textarea>
						</div>
					</div>
					<input class="recipe-submit-button" type="submit" value="送出">
				</form>
			</div>

			<div class="recipe-card">
				<form action="" method="post" enctype="multipart/form-data">
					<div class="upload-date">
						<tr>
							<td>上傳日期:</td>
							<td>123456789</td>
						</tr>
					</div>
					<div class="recipe-card-title">
						<input type="text" name="" placeholder="食譜名稱">
					</div>
					<div class="recipe-card-content">
						<div class="recipe-card-content-left">
							<div class="recipe-photo">
								<img class="img100" id="img2" src="#"/>
							</div>
							<div class="recipe-select-photo">
								<label>
									<input type="file" style="display:none;" onchange="readURL(this)" targetID="img2" accept="image/gif, image/jpeg, image/png"/>
									上傳圖片
								</label>
							</div>
						</div>
						<div class="recipe-card-content-right">
							<input onkeyup="value=value.replace(/^(0+)|[^\d]+/g,'')" type="text" name="" placeholder="份量(人)"><br>
							<input onkeyup="value=value.replace(/^(0+)|[^\d]+/g,'')" type="text" name="" placeholder="料理時間(min)">
							<textarea class="recipe-textarea" placeholder="食譜內容"></textarea>
						</div>
					</div>
					<input class="recipe-submit-button" type="submit" value="送出">
				</form>
			</div>

			<div class="recipe-card">
				<form action="" method="post" enctype="multipart/form-data">
					<div class="upload-date">
						<tr>
							<td>上傳日期:</td>
							<td>123456789</td>
						</tr>
					</div>
					<div class="recipe-card-title">
						<input type="text" name="" placeholder="食譜名稱">
					</div>
					<div class="recipe-card-content">
						<div class="recipe-card-content-left">
							<div class="recipe-photo">
								<img class="img100" id="img2" src="#"/>
							</div>
							<div class="recipe-select-photo">
								<label>
									<input type="file" style="display:none;" onchange="readURL(this)" targetID="img2" accept="image/gif, image/jpeg, image/png"/>
									上傳圖片
								</label>
							</div>
						</div>
						<div class="recipe-card-content-right">
							<input onkeyup="value=value.replace(/^(0+)|[^\d]+/g,'')" type="text" name="" placeholder="份量(人)"><br>
							<input onkeyup="value=value.replace(/^(0+)|[^\d]+/g,'')" type="text" name="" placeholder="料理時間(min)">
							<textarea class="recipe-textarea" placeholder="食譜內容"></textarea>
						</div>
					</div>
					<input class="recipe-submit-button" type="submit" value="送出">
				</form>
			</div>
		</div>

	<div class="page-button bottom-page-button">
			<a href="#" class="previous">&laquo; 上一頁</a>
			<a href="#" class="Next-Previous">1</a>
			<a href="#" class="Next-Previous">2</a>
			<a href="#" class="next">下一頁 &raquo;</a>
		</div>
</div>


	<footer>
		<p class="footer-title">mushroom hunter</p>
		<hr>
		<div class="columns-3">
			<div class="trademark"></div>
			<div class="middle-font">
				<p class="middle-title">聯絡我們</p>
				<p>桃園市中壢區中北路200號</p>
				<p>電話：+886-03-265-9999 , +886-03-456-3171</p>
				<p>傳真：+886-03-265-8888 , +886-03-456-3176</p>
				<p class="middle-time">服務時間：沒有服務</p>
			</div>
			<div class="mailto">
				<form action="" method="post">
					<select class="select" name="">
							<option disabled selected hidden>意見分類</option>
							<option style="color:black;" value="">服務態度</option>
							<option style="color:black;" value="">菇菇品質</option>
							<option style="color:black;" value="">配送速度</option>
						</select><br>
					<input class="input" type="email" name="email" placeholder="Email"><br>
					<input class="input" type="tel" name="phone" placeholder="連絡電話"><br>
					<textarea class="response" class="" name="response" placeholder="您的訊息"></textarea><br>
					<input class="submit" type="submit" value="送出">
				</form>
			</div>
		</div>
	</footer>
	<button onclick="topFunction()" id="myBtn" title="Go to top">Top</button>
	<script src="js/memberprofile.js"></script>
	<script src="js/good.js"></script>
<%
	if(dir!=null){
	out.print("<script>openCity(event, 'TransactionRecord')</script>");
	}
	if(dir2!=null){
	out.print("<script>openCity(event, 'Order')</script>");
	}
	}
	catch (Exception e){ 
out.print(e.toString()); 
}
	%>


</body>
</html>
