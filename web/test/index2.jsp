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
	<body>
		<header>
			<img class="img100" src="images/img (1).jpg">
		</header>
		<!--以下是關於本公司的香菇特色-->
		<div class="about-mush">
			<div class="about-font">特色</div>
			<div class="bigblock">
				<div class="bimg">
					<img class="img100" src="images/img (10).jpg">
				</div>
				<div class="description">
					<div class="text1">
						<p class="little-title">精準</p>
						<hr>
						<p class="little-content">精準的養殖技術，使用阿拉斯加清晨5點整雪山初融水，滴滴用心灌溉</p>
						<p class="little-content">每一株香菇生長時間均為"3個月16天7個小時又22秒"，採收時間分毫不差</p>
					</div>
					<div class="simg1 img100"><img src="images/img (2).jpg"></div>
					<div class="simg2 img100"><img src="images/img (3).jpg"></div>
					<div class="text2">
						<p class="little-title">用心</p>
						<hr>
						<p class="little-content">香菇包裝前均經過老闆親自試吃，品質把關滴水不漏</p>
						<p class="little-content">以曲速引擎飛行器產地直送。超越光速的新鮮，你看的見</p>
					</div>
				</div>
			</div>
		</div>
		<!--以下是關於香菇的小知識-->
		<div class="knowledge-font">香菇小知識</div>
		<div class="knowledge">
			<div class="SB">
				<img class="img100" src="images/img (12).png">
			</div>
			<div class="SB">
				<div class="ban">
					<img class="icon" src="images/img (13).png">
					<p class="kl-title">維生素</p>
					<p class="kl-content">菇菇含有許多維生素﹐如維生素B1、B2、C，增加免疫功能</p>
				</div>
				<div class="ban">
					<img class="icon" src="images/img (14).png">
					<p class="kl-title">纖維</p>
					<p class="kl-content">菇菇中含有大量膳食纖維（3-32%），促進腸胃蠕動</p>
				</div>
				<div class="ban">
					<img class="icon" src="images/img (15).png">
					<p class="kl-title">礦物質</p>
					<p class="kl-content">菇菇中含有多種礦物質，磷、鈉及鉀的含量較高﹐而鈣次之</p>
				</div>
			</div>
			<div class="SB">
				<div class="ban">
					<img class="icon" src="images/img (16).png">
					<p class="kl-title">調節血壓</p>
					<p class="kl-content">菇菇中含有豐富的鉀，可調控血壓、降低膽固醇、預防動脈硬化</p>
				</div>
				<div class="ban">
					<img class="icon" src="images/img (17).png">
					<p class="kl-title">多醣體</p>
					<p class="kl-content">菇菇中含有多種生物活性多醣體，可降低血脂、預防和改善脂肪肝</p>
				</div>
				<div class="ban">
					<img class="icon" src="images/img (18).png">
					<p class="kl-title">幫助減肥</p>
					<p class="kl-content">菇菇高纖維、高蛋白、低脂、低熱量的特性，非常適合減重的食物</p>
				</div>
			</div>
		</div>
		<!--以下是關於農夫(組員)-->
		<div class="ous-font">關於我們</div>
		<div class="about">
			<form action="" enctype="multipart/form-data">
				<div class="farmer flip-card">
					<div class="flip-card-inner">
						<div class="head flip-card-front">
							<img class="img100" id="img1" src="#"/>
						</div>
						<div class="self flip-card-back">
							<h1>冼煜庭</h1>
							<p>帥哥</p>
							<p>就是個大帥哥</p>
						</div>
					</div>
				</div>
				<div class="select-photo">
					<label>
						<input type="file" style="display:none;" onchange="readURL(this)" targetID="img1" accept="image/gif, image/jpeg, image/png"/>
						上傳圖片
					</label>
				</div>
			</form>
			<form action="" enctype="multipart/form-data">
				<div class="farmer flip-card">
					<div class="flip-card-inner">
						<div class="head flip-card-front">
							<img class="img100" id="img2" src="#"/>
						</div>
						<div class="self flip-card-back">
							<h1>冼煜庭</h1>
							<p>帥哥</p>
							<p>就是個大帥哥</p>
						</div>
					</div>
				</div>
				<div class="select-photo">
					<label>
						<input type="file" style="display:none;" onchange="readURL(this)" targetID="img2" accept="image/gif, image/jpeg, image/png"/>
						上傳圖片
					</label>
				</div>
			</form>
			<form action="" enctype="multipart/form-data">
				<div class="farmer flip-card">
					<div class="flip-card-inner">
						<div class="head flip-card-front">
							<img class="img100" id="img3" src="#"/>
						</div>
						<div class="self flip-card-back">
							<h1>冼煜庭</h1>
							<p>帥哥</p>
							<p>就是個大帥哥</p>
						</div>
					</div>
				</div>
				<div class="select-photo">
					<label>
						<input type="file" style="display:none;" onchange="readURL(this)" targetID="img3" accept="image/gif, image/jpeg, image/png"/>
						上傳圖片
					</label>
				</div>
			</form>
			
			<form action="" enctype="multipart/form-data">
				<div class="farmer flip-card">
					<div class="flip-card-inner">
						<div class="head flip-card-front">
							<img class="img100" id="img4" src="#"/>
						</div>
						<div class="self flip-card-back">
							<h1>冼煜庭</h1>
							<p>帥哥</p>
							<p>就是個大帥哥</p>
						</div>
					</div>
				</div>
				<div class="select-photo">
					<label>
						<input type="file" style="display:none;" onchange="readURL(this)" targetID="img4" accept="image/gif, image/jpeg, image/png"/>
						上傳圖片
					</label>
				</div>
			</form>
		</div>
		<button class="change-button">儲存</button>

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
				</div>
			</div>
		</footer>
		<button onclick="topFunction()" id="myBtn" title="Go to top">Top</button>
		<script>
		function readURL(input){
		if(input.files && input.files[0]){
		var imageTagID = input.getAttribute("targetID");
		var reader = new FileReader();
		reader.onload = function (e) {
		var img = document.getElementById(imageTagID);
		img.setAttribute("src", e.target.result)
		}
		reader.readAsDataURL(input.files[0]);
		}
		}
		</script>
		
	</body>
</html>