<%@ page import = "java.sql.*, java.util.*" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<title>Mushroom Hunter</title>
		<link rel="stylesheet" type="text/css" href="css/gradeisgood.css">
		<script src="js/good.js"></script>
	</head>

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
					<%
					 //計數器
					try{
					ResultSet rs0= con.createStatement().executeQuery("select * from counter");
					rs0.next();
					int count1= Integer.parseInt(rs0.getString("counts"));
					if(session.isNew())
					{
						count1++;
						con.createStatement().executeUpdate("update counter set counts='"+count1+"'");
					}
					out.print("<p class='middle-time'>"+"<b>"+"已瀏覽次數："+count1+"</p>");
                    }
                    catch(Exception e){out.print(e.toString());}
                %>  
				</div>
				<div class="mailto">
					<form action="addsuggest.jsp" method="post">
						<select class="select" name="type">
							<option disabled selected hidden>意見分類</option>
							<option style="color:black;" value="服務態度">服務態度</option>
							<option style="color:black;" value="菇菇品質">菇菇品質</option>
							<option style="color:black;" value="配送速度">配送速度</option>
						</select><br>
						<input class="input" type="email" name="email" placeholder="Email"><br>
						<input class="input" type="tel" name="phone" placeholder="連絡電話"><br>
						<textarea class="response" class="" name="response" placeholder="您的訊息"></textarea><br>
						<input class="submit" type="submit" value="送出">
					</form>
		<button onclick="topFunction()" id="myBtn" title="Go to top">Top</button>

</html>